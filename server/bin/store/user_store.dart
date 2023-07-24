import 'package:common/common.dart';

import 'entity_store.dart';

class UserStore extends EntityStore<User> {
  UserStore(super.db);

  Future<Result<User>> getByFirebaseId(String firebaseId) async {
    final found = items.values.firstWhereOrNull((e) => e.firebaseId == firebaseId);
    if (found != null) return Result.ok(found);
    return getByField('firebase_id', firebaseId);
  }
}
