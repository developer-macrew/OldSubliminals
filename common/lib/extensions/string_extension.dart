extension Capitalise on String {
  /// Capitalises the first letter of a string.
  String capitalise() {
    if (isEmpty) return this;

    return this[0].toUpperCase() + substring(1);
  }

  /// Capitalises the first letter of every word in a string.
  String titleise() {
    if (isEmpty) return this;
    return split(' ').map((e) => e.capitalise()).join(' ');
  }

  /// Replaces whitespace sequences with single spaces, and removes
  /// leading and trailing spaces.
  String trimAll() => replaceAll(RegExp(r'\s+'), ' ').trim();

  /// Splits the string around each instance of one or more consecutive
  /// whitespace characters.
  List<String> fields() {
    return trimAll().split(' ');
  }
}
