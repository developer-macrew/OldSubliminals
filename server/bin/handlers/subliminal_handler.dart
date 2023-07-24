import 'dart:convert';

import 'package:common/common.dart';
import 'package:shelf/shelf.dart';

import '../services/locator.dart';
import 'base_handler.dart';

class SubliminalHandler extends BaseHandler {
  Future<Response> create(Request request) async {
    final user = await verifyHeaders(request.headers);
    if (user == null) return buildErrorResponse(Errors.unauthorised);

    final String payload = await request.readAsString();
    Map<String, dynamic> data = jsonDecode(payload);
    String? title = data.remove('title');

    SubliminalConfig? config;

    try {
      config = SubliminalConfig.fromJson(data);
    } catch (e) {
      return buildErrorResponse(Errors.unprocessableEntity);
    }

    final req =
        await subliminalStore().create(config, owner: user.id, title: title);
    if (!req.ok) return buildErrorResponse(req.error!);
    return buildResponse(data: {
      ...req.object!.toJson(),
    });
  }

  Future<Response> mySubliminals(Request request) async {
    final user = await verifyHeaders(request.headers);
    if (user == null) return buildErrorResponse(Errors.unauthorised);
    final subs = await subliminalStore().getByOwner(user.id);
    return buildResponse(
      data: {
        'ready': [...subs.reversed.map((e) => e.toJson())],
        'requests': [
          ...subliminalStore().requestsForOwner(user.id).map((e) => e.toJson()),
        ],
      },
    );
  }

  Future<Response> get(Request request, String id) async {
    final sub = await subliminalStore().get(id);
    if (!sub.ok) {
      return buildErrorResponse(sub.error!);
    }
    return buildResponse(data: sub.object!.toJson());
  }

  Future<Response> download(Request request, String id) async {
    final sub = await subliminalStore().get(id);
    if (!sub.ok) {
      return buildErrorResponse(sub.error!);
    }
    return Response.seeOther(sub.object!.url!);
  }

  Future<Response> delete(Request request, String id) async {
    List<String> warnings = [];
    final user = await verifyHeaders(request.headers);
    if (user == null) return buildErrorResponse(Errors.unauthorised);
    final sub = await subliminalStore().get(id);
    if (!sub.ok) return buildErrorResponse(sub.error!);
    if (sub.object!.owner != user.id) {
      return buildErrorResponse(Errors.unauthorised);
    }
    final result = await subliminalStore().delete(sub.object!);
    if (!result.ok) return buildErrorResponse(result.error!);
    final delResult = await spaces().delete(sub.object!.path);
    if (!delResult.ok) warnings.add(delResult.error!);
    return buildResponse(warnings: warnings);
  }
}
