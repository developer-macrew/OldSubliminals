import 'package:common/model/subliminal_config.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subliminal_request.g.dart';

@CopyWith()
@JsonSerializable()
class SubliminalRequest {
  final String id;
  final int? position;
  final String? title;
  final String? owner;
  final SubliminalConfig config;

  const SubliminalRequest({
    required this.id,
    this.position,
    this.title,
    this.owner,
    required this.config,
  });

  static const blank =
      SubliminalRequest(id: '', config: SubliminalConfig(text: ''));

  factory SubliminalRequest.fromJson(Map<String, dynamic> json) =>
      _$SubliminalRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubliminalRequestToJson(this);
}
