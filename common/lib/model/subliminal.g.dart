// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subliminal.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SubliminalCWProxy {
  Subliminal id(String? id);

  Subliminal timestamp(int? timestamp);

  Subliminal config(SubliminalConfig config);

  Subliminal path(String path);

  Subliminal title(String title);

  Subliminal owner(String? owner);

  Subliminal url(String? url);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Subliminal(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Subliminal(...).copyWith(id: 12, name: "My name")
  /// ````
  Subliminal call({
    String? id,
    int? timestamp,
    SubliminalConfig? config,
    String? path,
    String? title,
    String? owner,
    String? url,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSubliminal.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSubliminal.copyWith.fieldName(...)`
class _$SubliminalCWProxyImpl implements _$SubliminalCWProxy {
  const _$SubliminalCWProxyImpl(this._value);

  final Subliminal _value;

  @override
  Subliminal id(String? id) => this(id: id);

  @override
  Subliminal timestamp(int? timestamp) => this(timestamp: timestamp);

  @override
  Subliminal config(SubliminalConfig config) => this(config: config);

  @override
  Subliminal path(String path) => this(path: path);

  @override
  Subliminal title(String title) => this(title: title);

  @override
  Subliminal owner(String? owner) => this(owner: owner);

  @override
  Subliminal url(String? url) => this(url: url);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Subliminal(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Subliminal(...).copyWith(id: 12, name: "My name")
  /// ````
  Subliminal call({
    Object? id = const $CopyWithPlaceholder(),
    Object? timestamp = const $CopyWithPlaceholder(),
    Object? config = const $CopyWithPlaceholder(),
    Object? path = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? owner = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
  }) {
    return Subliminal(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      timestamp: timestamp == const $CopyWithPlaceholder()
          ? _value.timestamp
          // ignore: cast_nullable_to_non_nullable
          : timestamp as int?,
      config: config == const $CopyWithPlaceholder() || config == null
          // ignore: unnecessary_non_null_assertion
          ? _value.config!
          // ignore: cast_nullable_to_non_nullable
          : config as SubliminalConfig,
      path: path == const $CopyWithPlaceholder() || path == null
          // ignore: unnecessary_non_null_assertion
          ? _value.path!
          // ignore: cast_nullable_to_non_nullable
          : path as String,
      title: title == const $CopyWithPlaceholder() || title == null
          // ignore: unnecessary_non_null_assertion
          ? _value.title!
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      owner: owner == const $CopyWithPlaceholder()
          ? _value.owner
          // ignore: cast_nullable_to_non_nullable
          : owner as String?,
      url: url == const $CopyWithPlaceholder()
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String?,
    );
  }
}

extension $SubliminalCopyWith on Subliminal {
  /// Returns a callable class that can be used as follows: `instanceOfSubliminal.copyWith(...)` or like so:`instanceOfSubliminal.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SubliminalCWProxy get copyWith => _$SubliminalCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subliminal _$SubliminalFromJson(Map<String, dynamic> json) => Subliminal(
      id: json['id'] as String?,
      timestamp: json['timestamp'] as int?,
      config: SubliminalConfig.fromJson(json['config'] as Map<String, dynamic>),
      path: json['path'] as String,
      title: json['title'] as String,
      owner: json['owner'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$SubliminalToJson(Subliminal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp,
      'config': instance.config.toJson(),
      'path': instance.path,
      'title': instance.title,
      'owner': instance.owner,
      'url': instance.url,
    };
