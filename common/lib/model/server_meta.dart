import 'package:json_annotation/json_annotation.dart';

part 'server_meta.g.dart';

@JsonSerializable()
class ServerMeta {
  final String version;

  const ServerMeta({required this.version});
  factory ServerMeta.initial() => ServerMeta(version: '0.0.0');

  factory ServerMeta.fromJson(Map<String, dynamic> json) => _$ServerMetaFromJson(json);
  Map<String, dynamic> toJson() => _$ServerMetaToJson(this);
}
