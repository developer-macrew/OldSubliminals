class Errors {
  static const unauthorised = 'unauthorised';
  static const notFound = 'not_found';
  static const unknown = 'unknown';
  static const invalidRequest = 'invalid_request';
  static const unprocessableEntity = 'unprocessable_entity';

  static const Map<int, List<String>> codes = {
    400: [invalidRequest],
    401: [unauthorised],
    404: [notFound],
    422: [unprocessableEntity],
    500: [unknown],
  };

  static String errorString(int code) => codes[code]?.first ?? unknown;

  static int httpCode(String error) {
    for (final c in codes.entries) {
      if (c.value.contains(error)) return c.key;
    }
    return 500;
  }
}
