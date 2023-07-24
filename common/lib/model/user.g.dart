// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      timestamp: json['timestamp'] as int?,
      firebaseId: json['firebase_id'] as String,
      name: json['name'] as String?,
      email: json['email'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp,
      'firebase_id': instance.firebaseId,
      'name': instance.name,
      'email': instance.email,
      'avatar_url': instance.avatarUrl,
    };
