import 'dart:convert';
import 'dart:developer';

import 'package:common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:rest_client/rest_client.dart' as rc;
import 'package:subliminal/services/service_locator.dart';

part 'api_response.dart';

typedef Unwrapper<T> = T Function(Map<String, dynamic> data);

class ApiService {
  static String host = 'https://coral-app-vf2es.ondigitalocean.app';

  Future<ApiResult<ServerMeta>> getMeta() async =>
      getAndUnwrap('/', unwrapper: unwrapServerMeta);

  Future<ApiResult<User>> getMe() => getAndUnwrap(
        '/users/me',
        unwrapper: unwrapUser,
        needAuth: true,
      );

  Future<ApiResult<SubliminalList>> getMySubliminals() => getAndUnwrap(
        '/subliminals/me',
        unwrapper: unwrapSubList,
        needAuth: true,
      );

  Future<ApiResult<SubliminalRequest>> createSubliminal(
          SubliminalRequest request) =>
      postAndUnwrap(
        '/subliminals/create',
        body: {
          ...request.config.toJson(),
          'title': request.title,
        },
        unwrapper: SubliminalRequest.fromJson,
        needAuth: true,
      );

  Future<ApiResult<Subliminal>> getSubliminal(String id) =>
      getAndUnwrap('/subliminals/$id', unwrapper: Subliminal.fromJson);

  Future<ApiResponse> deleteSubliminal(String id) =>
      delete('/subliminals/$id/delete', needAuth: true);

  Future<ApiResponse> makeRequest(
    String path, {
    rc.RequestMethod method = rc.RequestMethod.get,
    bool needAuth = false,
    Map<String, dynamic>? body,
  }) async {
    try {
      Map<String, String> headers = {};
      if (needAuth) {
        if (auth().state.fbLoggedIn) {
          String? token = await auth().getIdToken();
          if (token == null) return ApiResponse.error(401);
          headers['Authorization'] = 'Bearer $token';
        } else {
          return ApiResponse.error(401);
        }
      }

      final req = rc.Request(
        url: '$host$path',
        method: method,
        headers: headers,
        body: body == null ? null : jsonEncode(body),
      );
      final resp =
          await rc.Client().execute(request: req, throwRestExceptions: false);
      log('${resp.body}');
      if (resp.statusCode < 200 || resp.statusCode >= 400) {
        return ApiResponse.error(resp.statusCode);
      }
      return parseBody(resp.body);
    } catch (e, s) {
      print(
          'ApiClient ${method.toString().toLowerCase()}($path), body: $body, error $e\n$s');
      return ApiResponse.error(500);
    }
  }

  Future<ApiResponse> get(
    String path, {
    bool needAuth = false,
  }) =>
      makeRequest(path, needAuth: needAuth);

  Future<ApiResponse> post(
    String path, {
    bool needAuth = false,
    Map<String, dynamic> body = const {},
  }) =>
      makeRequest(
        path,
        method: rc.RequestMethod.post,
        needAuth: needAuth,
        body: body,
      );

  Future<ApiResponse> delete(
    String path, {
    bool needAuth = false,
    Map<String, dynamic>? body,
  }) =>
      makeRequest(
        path,
        method: rc.RequestMethod.delete,
        needAuth: needAuth,
        body: body,
      );

  // Future<ApiResponse> get(
  //   String path, {
  //   bool needAuth = false,
  // }) async {
  //   try {
  //     Map<String, String> headers = {};
  //     if (needAuth) {
  //       if (auth().state.fbLoggedIn) {
  //         String? token = await auth().getIdToken();
  //         if (token == null) return ApiResponse.error(401);
  //         headers['Authorization'] = 'Bearer $token';
  //       } else {
  //         return ApiResponse.error(401);
  //       }
  //     }

  //     final req = rc.Request(
  //       url: '$host$path',
  //       method: rc.RequestMethod.get,
  //       headers: headers,
  //     );
  //     final resp =
  //         await rc.Client().execute(request: req, throwRestExceptions: false);
  //     log('${resp.body}');
  //     if (resp.statusCode != 200) return ApiResponse.error(resp.statusCode);
  //     return parseBody(resp.body);
  //   } catch (e, s) {
  //     print('ApiClient.get($path), error $e\n$s');
  //     return ApiResponse.error(500);
  //   }
  // }

  // Future<ApiResponse> post(
  //   String path, {
  //   bool needAuth = false,
  //   Map<String, dynamic> body = const {},
  // }) async {
  //   try {
  //     Map<String, String> headers = {};
  //     if (needAuth) {
  //       if (auth().state.loggedIn) {
  //         String? token = await auth().getIdToken();
  //         if (token == null) return ApiResponse.error(401);
  //         headers['Authorization'] = 'Bearer $token';
  //       } else {
  //         return ApiResponse.error(401);
  //       }
  //     }

  //     final req = rc.Request(
  //       url: '$host$path',
  //       method: rc.RequestMethod.post,
  //       headers: headers,
  //       body: jsonEncode(body),
  //     );
  //     final resp = await rc.Client().execute(request: req);
  //     if (resp.statusCode != 200) return ApiResponse.error(resp.statusCode);
  //     return parseBody(resp.body);
  //   } catch (e, s) {
  //     print('ApiClient.post($path, $body), error $e\n$s');
  //     return ApiResponse.error(500);
  //   }
  // }

  static ApiResponse parseBody(Map<String, dynamic> body) {
    List<String> warnings = body['warnings'] ?? [];
    if (body.containsKey('warnings')) body.remove('warnings');
    return ApiResponse.ok(data: body, warnings: warnings);
  }

  ApiResult<T> unwrapResponse<T>(ApiResponse response, Unwrapper<T> unwrapper) {
    if (!response.ok) {
      return ApiResult.error(response.error!, response.warnings);
    }
    return ApiResult.ok(
      unwrapper(response.data),
      warnings: response.warnings,
    );
  }

  Future<ApiResult<T>> getAndUnwrap<T>(
    String path, {
    required Unwrapper<T> unwrapper,
    bool needAuth = false,
  }) async =>
      unwrapResponse(await get(path, needAuth: needAuth), unwrapper);

  Future<ApiResult<T>> postAndUnwrap<T>(
    String path, {
    required Unwrapper<T> unwrapper,
    Map<String, dynamic> body = const {},
    bool needAuth = false,
  }) async =>
      unwrapResponse(
          await post(path, body: body, needAuth: needAuth), unwrapper);

  ServerMeta unwrapServerMeta(Map<String, dynamic> data) =>
      ServerMeta.fromJson(data);
  User unwrapUser(Map<String, dynamic> data) => User.fromJson(data);
  SubliminalList unwrapSubList(Map<String, dynamic> data) =>
      SubliminalList.fromJson(data);
}
