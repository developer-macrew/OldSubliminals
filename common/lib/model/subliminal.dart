import 'package:common/common.dart';
import 'package:common/model/entity.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mongo_dart/mongo_dart.dart';

part 'subliminal.g.dart';

@JsonSerializable()
@CopyWith()
class Subliminal extends Equatable implements Entity {
  @override
  final String id;
  @override
  final int timestamp;
  final SubliminalConfig config;
  final String path;
  final String title;
  final String? owner;
  final String? url;

  Subliminal({
    String? id,
    int? timestamp,
    required this.config,
    required this.path,
    required this.title,
    this.owner,
    this.url,
  })  : id = id ?? ObjectId().id.hexString,
        timestamp = timestamp ?? nowMs();

  @override
  List<Object?> get props => [id];

  factory Subliminal.fromJson(Map<String, dynamic> json) =>
      _$SubliminalFromJson(json);

  Map<String, dynamic> toJson({bool includeUrl = true}) {
    Map<String, dynamic> json = _$SubliminalToJson(this);
    if (!includeUrl && json.containsKey('url')) {
      json.remove('url');
    }
    return json;
  }

  @override
  Map<String, dynamic> export() => toJson();
}
