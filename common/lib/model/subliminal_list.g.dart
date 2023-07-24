// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subliminal_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubliminalList _$SubliminalListFromJson(Map<String, dynamic> json) =>
    SubliminalList(
      ready: (json['ready'] as List<dynamic>)
          .map((e) => Subliminal.fromJson(e as Map<String, dynamic>))
          .toList(),
      requests: (json['requests'] as List<dynamic>)
          .map((e) => SubliminalRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubliminalListToJson(SubliminalList instance) =>
    <String, dynamic>{
      'ready': instance.ready.map((e) => e.toJson()).toList(),
      'requests': instance.requests.map((e) => e.toJson()).toList(),
    };
