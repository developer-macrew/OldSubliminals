import 'package:common/common.dart';
import 'package:common/model/subliminal.dart';

abstract class Entity {
  final String id;
  final int timestamp;
  const Entity({required this.id, required this.timestamp});

  static const Map<Type, Function(Map<String, dynamic> json)> builders = {
    User: User.fromJson,
    Subliminal: Subliminal.fromJson,
  };

  static T build<T extends Entity>(Map<String, dynamic> doc) =>
      builders[T]!(doc);

  static const Map<Type, String> entityTables = {
    User: 'users',
    Subliminal: 'subs',
  };

  static String table(Type t) => entityTables[t] ?? '';

  Map<String, dynamic> export();
}
