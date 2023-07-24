// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subliminal_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SubliminalRequestCWProxy {
  SubliminalRequest id(String id);

  SubliminalRequest position(int? position);

  SubliminalRequest title(String? title);

  SubliminalRequest owner(String? owner);

  SubliminalRequest config(SubliminalConfig config);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SubliminalRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SubliminalRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SubliminalRequest call({
    String? id,
    int? position,
    String? title,
    String? owner,
    SubliminalConfig? config,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSubliminalRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSubliminalRequest.copyWith.fieldName(...)`
class _$SubliminalRequestCWProxyImpl implements _$SubliminalRequestCWProxy {
  const _$SubliminalRequestCWProxyImpl(this._value);

  final SubliminalRequest _value;

  @override
  SubliminalRequest id(String id) => this(id: id);

  @override
  SubliminalRequest position(int? position) => this(position: position);

  @override
  SubliminalRequest title(String? title) => this(title: title);

  @override
  SubliminalRequest owner(String? owner) => this(owner: owner);

  @override
  SubliminalRequest config(SubliminalConfig config) => this(config: config);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SubliminalRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SubliminalRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SubliminalRequest call({
    Object? id = const $CopyWithPlaceholder(),
    Object? position = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? owner = const $CopyWithPlaceholder(),
    Object? config = const $CopyWithPlaceholder(),
  }) {
    return SubliminalRequest(
      id: id == const $CopyWithPlaceholder() || id == null
          // ignore: unnecessary_non_null_assertion
          ? _value.id!
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      position: position == const $CopyWithPlaceholder()
          ? _value.position
          // ignore: cast_nullable_to_non_nullable
          : position as int?,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      owner: owner == const $CopyWithPlaceholder()
          ? _value.owner
          // ignore: cast_nullable_to_non_nullable
          : owner as String?,
      config: config == const $CopyWithPlaceholder() || config == null
          // ignore: unnecessary_non_null_assertion
          ? _value.config!
          // ignore: cast_nullable_to_non_nullable
          : config as SubliminalConfig,
    );
  }
}

extension $SubliminalRequestCopyWith on SubliminalRequest {
  /// Returns a callable class that can be used as follows: `instanceOfSubliminalRequest.copyWith(...)` or like so:`instanceOfSubliminalRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SubliminalRequestCWProxy get copyWith =>
      _$SubliminalRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubliminalRequest _$SubliminalRequestFromJson(Map<String, dynamic> json) =>
    SubliminalRequest(
      id: json['id'] as String,
      position: json['position'] as int?,
      title: json['title'] as String?,
      owner: json['owner'] as String?,
      config: SubliminalConfig.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubliminalRequestToJson(SubliminalRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'position': instance.position,
      'title': instance.title,
      'owner': instance.owner,
      'config': instance.config.toJson(),
    };
