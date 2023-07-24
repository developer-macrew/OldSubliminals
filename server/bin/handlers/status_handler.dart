import 'package:common/model/server_meta.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_ndjson_stream/shelf_ndjson_stream.dart';

import '../services/locator.dart';
import 'base_handler.dart';

class StatusHandler extends BaseHandler {
  Future<Response> meta(Request request) async {
    return buildResponse(
      data: ServerMeta(
        version: env().version,
      ).toJson(),
    );
  }

  Future<Response> status(Request request) async {
    return buildResponse(data: {
      'queue': queue().state.lengths(),
    });
  }

  Future<Response> test(Request request) async {
    final user = await verifyHeaders(request.headers);
    return buildResponse(
      data: {'user': user?.toJson()},
    );
  }

  Future<Response> streamTest(Request request) async {
    final x = NdjsonStream(initialMessage: {'letter': 'a'});
    _pushStreamData(x);
    return x.response;
  }

  void _pushStreamData(NdjsonStream stream) async {
    for (int i = 1; i < 26; i++) {
      stream.add({'letter': String.fromCharCode('a'.codeUnitAt(0) + i)});
      await Future.delayed(Duration(milliseconds: 200));
    }
    stream.close();
  }
}
