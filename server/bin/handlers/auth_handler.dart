import 'package:common/common.dart';
import 'package:shelf/shelf.dart';

import 'base_handler.dart';

class AuthHandler extends BaseHandler {
  Future<Response> getMe(Request request) async {
    final userRecord = await verifyHeaders(request.headers);
    if (userRecord == null) return buildErrorResponse(Errors.unauthorised);

    return buildResponse(data: userRecord.toJson());
  }
}
