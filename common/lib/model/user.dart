import 'package:common/common.dart';
import 'package:common/model/entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mongo_dart/mongo_dart.dart';

part 'user.g.dart';

@JsonSerializable()
class User implements Entity {
  @override
  final String id;
  @override
  final int timestamp;
  final String firebaseId;
  final String? name;
  final String? email;
  final String? avatarUrl;

  User({
    String? id,
    int? timestamp,
    required this.firebaseId,
    required this.name,
    this.email,
    this.avatarUrl,
  })  : id = id ?? ObjectId().id.hexString,
        timestamp = timestamp ?? nowMs();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  Map<String, dynamic> export() => toJson();
}
