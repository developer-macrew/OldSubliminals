import 'package:common/common.dart';
import 'package:firebase_admin_sdk/src/auth/user_record.dart';

User userFromFirebase(UserRecord record) => User(
      firebaseId: record.uid,
      name: record.displayName,
      email: record.email,
      avatarUrl: record.photoUrl,
    );
