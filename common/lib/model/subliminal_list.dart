import 'package:common/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subliminal_list.g.dart';

@JsonSerializable()
class SubliminalList {
  final List<Subliminal> ready;
  final List<SubliminalRequest> requests;

  const SubliminalList({required this.ready, required this.requests});
  static const empty = SubliminalList(ready: [], requests: []);

  factory SubliminalList.fromJson(Map<String, dynamic> json) =>
      _$SubliminalListFromJson(json);

  Map<String, dynamic> toJson() => _$SubliminalListToJson(this);
}
