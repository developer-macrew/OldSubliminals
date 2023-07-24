part of 'api_service.dart';

class ApiResponse {
  final int status;
  final Map<String, dynamic> data;
  final String? error;
  final List<String> warnings;

  bool get ok => status >= 200 && status < 300;

  const ApiResponse({
    required this.status,
    this.data = const {},
    this.error,
    this.warnings = const [],
  });

  factory ApiResponse.ok({
    int? status,
    Map<String, dynamic> data = const {},
    List<String> warnings = const [],
  }) =>
      ApiResponse(
        status: status ?? 200,
        data: data,
        warnings: warnings,
      );

  factory ApiResponse.error(
    int status, {
    Map<String, dynamic> data = const {},
    String? error,
    List<String> warnings = const [],
  }) =>
      ApiResponse(
        status: status,
        data: data,
        error: error ?? Errors.codes[status]?.first,
        warnings: warnings,
      );

  factory ApiResponse.errorString(
    String error, {
    Map<String, dynamic> data = const {},
    List<String> warnings = const [],
  }) =>
      ApiResponse(
        status: Errors.httpCode(error),
        error: error,
        data: data,
        warnings: warnings,
      );

  @override
  String toString() => ok
      ? 'ApiResponse(ok ($status), $data)'
      : 'ApiResponse(error ($status), $error)';
}
