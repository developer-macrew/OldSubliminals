import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart' as shelf_router;

import 'handlers/auth_handler.dart';
import 'handlers/queue_handler.dart';
import 'handlers/status_handler.dart';
import 'handlers/subliminal_handler.dart';
import 'services/environment.dart';
import 'services/locator.dart';
import 'services/mongo_service.dart';

Future<void> main(List<String> arguments) async {
  final env = Environment.read();
  final db = MongoService();
  await db.init(env);
  setUpServiceLocator(environment: env, db: db);
  final _router = shelf_router.Router()
    ..get('/hello', _echoRequest)
    ..get('/test', StatusHandler().test)
    ..get('/stream', StatusHandler().streamTest)
    ..get('/', StatusHandler().meta)
    ..get('/status', StatusHandler().status)
    ..get('/users/me', AuthHandler().getMe)
    ..get('/subliminals/me', SubliminalHandler().mySubliminals)
    ..post('/subliminals/create', SubliminalHandler().create)
    ..get('/subliminals/<id>', SubliminalHandler().get)
    ..get('/subliminals/<id>/download', SubliminalHandler().download)
    ..delete('/subliminals/<id>/delete', SubliminalHandler().delete)
    ..post('/queue/update', QueueHandler().update);

  final cascade = Cascade().add(_router);
  final pipeline = Pipeline()
      .addMiddleware(logRequests(logger: _logger))
      .addMiddleware(corsHeaders())
      .addHandler(cascade.handler);

  final server = await shelf_io.serve(
    pipeline,
    InternetAddress.anyIPv4,
    8080,
  );

  print('Serving at http://${server.address.host}:${server.port}');
}

Response _echoRequest(Request request) =>
    Response.ok('Request for "${request.url}"');

void _logger(String msg, bool isError) {
  if (isError) {
    print('[ERROR] $msg');
  } else {
    if (msg.contains('/subliminals/me')) {
      return;
    }
    print(msg);
  }
}
