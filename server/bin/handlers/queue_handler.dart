import 'dart:convert';

import 'package:common/common.dart';
import 'package:shelf/shelf.dart';

import '../model/engine_queue.dart';
import '../services/locator.dart';
import 'base_handler.dart';

class QueueHandler extends BaseHandler {
  Future<Response> update(Request request) async {
    final String payload = await request.readAsString();
    Map<String, dynamic> data = jsonDecode(payload);

    EngineQueue? _queue;

    try {
      _queue = EngineQueue.fromJson(data);
    } catch (e, s) {
      print('Queue Handler Error: $e\n$s');
      return buildErrorResponse(Errors.unprocessableEntity);
    }
    queue().update(_queue);

    return buildResponse();
  }
}
