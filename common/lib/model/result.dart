/// A generic structure for results to be returned in.
// ignore_for_file: null_check_on_nullable_type_parameter

class Result<T> {
  final T? object;
  final String? error;
  final List<String> warnings;

  bool get ok => error == null;
  bool get hasObject => object != null;

  const Result({this.object, this.error, this.warnings = const []})
      : assert(!(error == null && object == null));

  factory Result.error(String error, [List<String> warnings = const []]) =>
      Result(error: error, warnings: warnings);
  factory Result.ok(T object, [List<String> warnings = const []]) =>
      Result(object: object, warnings: warnings);

  Result<T> transform(T Function(T e) transformer) =>
      ok ? Result.ok(transformer(object!)) : this;

  Future<Result<T>> asyncTransform(Future<T> Function(T e) transformer) async =>
      ok ? Result.ok(await transformer(object!)) : this;

  @override
  String toString() {
    String str = ok ? 'ok, $object' : 'error, $error';
    if (warnings.isNotEmpty) str = '$str, $warnings';
    return 'Result($str)';
  }
}

class ApiResult<T> extends Result<T> {
  const ApiResult({
    super.object,
    super.error,
    super.warnings = const [],
  });

  factory ApiResult.error(String error, [List<String> warnings = const []]) =>
      ApiResult(error: error, warnings: warnings);
  factory ApiResult.ok(T object,
          {String? token, int? expiry, List<String> warnings = const []}) =>
      ApiResult(object: object, warnings: warnings);

  @override
  String toString() {
    String str = ok ? 'ok, $object' : 'error, $error';
    if (warnings.isNotEmpty) str = '$str, $warnings';
    return 'ApiResult($str)';
  }
}
