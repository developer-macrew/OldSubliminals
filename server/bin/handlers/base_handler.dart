import 'dart:convert';

import 'package:common/common.dart';
import 'package:common/model/errors.dart';
import 'package:shelf/shelf.dart';
import 'package:firebase_admin_sdk/src/auth/user_record.dart';
import 'package:openid_client/openid_client.dart';

import '../services/locator.dart';
import '../utils/user_from_firebase.dart';

class BaseHandler {
  Response buildResponse({
    Map<String, dynamic>? data,
    String? error,
    List<String> warnings = const [],
    int status = 200,
  }) {
    // can't grow const maps and lists
    data ??= {};
    warnings = List.from(warnings);

    // TODO: tokens?

    if (error != null) {
      status = Errors.httpCode(error);
      data = {'error': error};
    }

    if (warnings.isNotEmpty) {
      data = {'warnings': warnings}..addAll(data);
    }

    String body = JsonEncoder.withIndent(' ', toEncodable).convert(data);
    return Response(
      status,
      body: body,
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  Response buildErrorResponse(String error) => buildResponse(error: error);

  // Response buildStreamResponse() {
  //   return Response(200, encoding: Encoding.)
  // }

  static Object? toEncodable(dynamic object) {
    if (object is Map) {
      // convert maps that aren't Map<String, dynamic>
      return {
        for (var k in object.keys) '$k': object[k],
      };
    }
    return null;
  }

  Future<User?> verifyHeaders(Map<String, String> headers,
      [bool forceRenewToken = false]) async {
    String? authorization = headers['authorization'];
    if (authorization != null && authorization.startsWith('Bearer ')) {
      String token = authorization.substring('Bearer '.length);
      try {
        if (env().debugToken.isNotEmpty && token == env().debugToken) {
          final result = await userStore().get(env().debugUser);
          User? user = result.object;
          return user;
        }
        final idToken = await verifyToken(token);
        final userRecord = await auth().getUser(idToken.claims.subject);
        final result = await userStore().getByFirebaseId(userRecord.uid);
        User? user = result.object;
        if (user == null) {
          user = userFromFirebase(userRecord);
          userStore().set(user, true);
        }
        return user;
      } catch (e) {
        print('exception: $e');
        return null;
      }
    } else {
      return null;
    }
  }

  Future<IdToken> verifyToken(String token) async {
    return auth().verifyIdToken(token);
  }
}
