// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_config.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FxConfigCWProxy {
  FxConfig reverse(bool? reverse);

  FxConfig reverb(FxReverb? reverb);

  FxConfig delay(FxDelay? delay);

  FxConfig lowshelf(FxShelf? lowshelf);

  FxConfig highshelf(FxShelf? highshelf);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FxConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FxConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  FxConfig call({
    bool? reverse,
    FxReverb? reverb,
    FxDelay? delay,
    FxShelf? lowshelf,
    FxShelf? highshelf,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFxConfig.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFxConfig.copyWith.fieldName(...)`
class _$FxConfigCWProxyImpl implements _$FxConfigCWProxy {
  const _$FxConfigCWProxyImpl(this._value);

  final FxConfig _value;

  @override
  FxConfig reverse(bool? reverse) => this(reverse: reverse);

  @override
  FxConfig reverb(FxReverb? reverb) => this(reverb: reverb);

  @override
  FxConfig delay(FxDelay? delay) => this(delay: delay);

  @override
  FxConfig lowshelf(FxShelf? lowshelf) => this(lowshelf: lowshelf);

  @override
  FxConfig highshelf(FxShelf? highshelf) => this(highshelf: highshelf);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FxConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FxConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  FxConfig call({
    Object? reverse = const $CopyWithPlaceholder(),
    Object? reverb = const $CopyWithPlaceholder(),
    Object? delay = const $CopyWithPlaceholder(),
    Object? lowshelf = const $CopyWithPlaceholder(),
    Object? highshelf = const $CopyWithPlaceholder(),
  }) {
    return FxConfig(
      reverse: reverse == const $CopyWithPlaceholder()
          ? _value.reverse
          // ignore: cast_nullable_to_non_nullable
          : reverse as bool?,
      reverb: reverb == const $CopyWithPlaceholder()
          ? _value.reverb
          // ignore: cast_nullable_to_non_nullable
          : reverb as FxReverb?,
      delay: delay == const $CopyWithPlaceholder()
          ? _value.delay
          // ignore: cast_nullable_to_non_nullable
          : delay as FxDelay?,
      lowshelf: lowshelf == const $CopyWithPlaceholder()
          ? _value.lowshelf
          // ignore: cast_nullable_to_non_nullable
          : lowshelf as FxShelf?,
      highshelf: highshelf == const $CopyWithPlaceholder()
          ? _value.highshelf
          // ignore: cast_nullable_to_non_nullable
          : highshelf as FxShelf?,
    );
  }
}

extension $FxConfigCopyWith on FxConfig {
  /// Returns a callable class that can be used as follows: `instanceOfFxConfig.copyWith(...)` or like so:`instanceOfFxConfig.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FxConfigCWProxy get copyWith => _$FxConfigCWProxyImpl(this);
}

abstract class _$FxReverbCWProxy {
  FxReverb level(int level);

  FxReverb damping(int damping);

  FxReverb size(int size);

  FxReverb depth(int depth);

  FxReverb predelay(int predelay);

  FxReverb wetgain(int wetgain);

  FxReverb wetonly(bool wetonly);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FxReverb(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FxReverb(...).copyWith(id: 12, name: "My name")
  /// ````
  FxReverb call({
    int? level,
    int? damping,
    int? size,
    int? depth,
    int? predelay,
    int? wetgain,
    bool? wetonly,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFxReverb.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFxReverb.copyWith.fieldName(...)`
class _$FxReverbCWProxyImpl implements _$FxReverbCWProxy {
  const _$FxReverbCWProxyImpl(this._value);

  final FxReverb _value;

  @override
  FxReverb level(int level) => this(level: level);

  @override
  FxReverb damping(int damping) => this(damping: damping);

  @override
  FxReverb size(int size) => this(size: size);

  @override
  FxReverb depth(int depth) => this(depth: depth);

  @override
  FxReverb predelay(int predelay) => this(predelay: predelay);

  @override
  FxReverb wetgain(int wetgain) => this(wetgain: wetgain);

  @override
  FxReverb wetonly(bool wetonly) => this(wetonly: wetonly);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FxReverb(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FxReverb(...).copyWith(id: 12, name: "My name")
  /// ````
  FxReverb call({
    Object? level = const $CopyWithPlaceholder(),
    Object? damping = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? depth = const $CopyWithPlaceholder(),
    Object? predelay = const $CopyWithPlaceholder(),
    Object? wetgain = const $CopyWithPlaceholder(),
    Object? wetonly = const $CopyWithPlaceholder(),
  }) {
    return FxReverb(
      level: level == const $CopyWithPlaceholder() || level == null
          // ignore: unnecessary_non_null_assertion
          ? _value.level!
          // ignore: cast_nullable_to_non_nullable
          : level as int,
      damping: damping == const $CopyWithPlaceholder() || damping == null
          // ignore: unnecessary_non_null_assertion
          ? _value.damping!
          // ignore: cast_nullable_to_non_nullable
          : damping as int,
      size: size == const $CopyWithPlaceholder() || size == null
          // ignore: unnecessary_non_null_assertion
          ? _value.size!
          // ignore: cast_nullable_to_non_nullable
          : size as int,
      depth: depth == const $CopyWithPlaceholder() || depth == null
          // ignore: unnecessary_non_null_assertion
          ? _value.depth!
          // ignore: cast_nullable_to_non_nullable
          : depth as int,
      predelay: predelay == const $CopyWithPlaceholder() || predelay == null
          // ignore: unnecessary_non_null_assertion
          ? _value.predelay!
          // ignore: cast_nullable_to_non_nullable
          : predelay as int,
      wetgain: wetgain == const $CopyWithPlaceholder() || wetgain == null
          // ignore: unnecessary_non_null_assertion
          ? _value.wetgain!
          // ignore: cast_nullable_to_non_nullable
          : wetgain as int,
      wetonly: wetonly == const $CopyWithPlaceholder() || wetonly == null
          // ignore: unnecessary_non_null_assertion
          ? _value.wetonly!
          // ignore: cast_nullable_to_non_nullable
          : wetonly as bool,
    );
  }
}

extension $FxReverbCopyWith on FxReverb {
  /// Returns a callable class that can be used as follows: `instanceOfFxReverb.copyWith(...)` or like so:`instanceOfFxReverb.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FxReverbCWProxy get copyWith => _$FxReverbCWProxyImpl(this);
}

abstract class _$FxDelayCWProxy {
  FxDelay gainIn(double gainIn);

  FxDelay gainOut(double gainOut);

  FxDelay parallel(bool parallel);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FxDelay(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FxDelay(...).copyWith(id: 12, name: "My name")
  /// ````
  FxDelay call({
    double? gainIn,
    double? gainOut,
    bool? parallel,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFxDelay.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFxDelay.copyWith.fieldName(...)`
class _$FxDelayCWProxyImpl implements _$FxDelayCWProxy {
  const _$FxDelayCWProxyImpl(this._value);

  final FxDelay _value;

  @override
  FxDelay gainIn(double gainIn) => this(gainIn: gainIn);

  @override
  FxDelay gainOut(double gainOut) => this(gainOut: gainOut);

  @override
  FxDelay parallel(bool parallel) => this(parallel: parallel);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FxDelay(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FxDelay(...).copyWith(id: 12, name: "My name")
  /// ````
  FxDelay call({
    Object? gainIn = const $CopyWithPlaceholder(),
    Object? gainOut = const $CopyWithPlaceholder(),
    Object? parallel = const $CopyWithPlaceholder(),
  }) {
    return FxDelay(
      gainIn: gainIn == const $CopyWithPlaceholder() || gainIn == null
          // ignore: unnecessary_non_null_assertion
          ? _value.gainIn!
          // ignore: cast_nullable_to_non_nullable
          : gainIn as double,
      gainOut: gainOut == const $CopyWithPlaceholder() || gainOut == null
          // ignore: unnecessary_non_null_assertion
          ? _value.gainOut!
          // ignore: cast_nullable_to_non_nullable
          : gainOut as double,
      parallel: parallel == const $CopyWithPlaceholder() || parallel == null
          // ignore: unnecessary_non_null_assertion
          ? _value.parallel!
          // ignore: cast_nullable_to_non_nullable
          : parallel as bool,
    );
  }
}

extension $FxDelayCopyWith on FxDelay {
  /// Returns a callable class that can be used as follows: `instanceOfFxDelay.copyWith(...)` or like so:`instanceOfFxDelay.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FxDelayCWProxy get copyWith => _$FxDelayCWProxyImpl(this);
}

abstract class _$FxShelfCWProxy {
  FxShelf gain(double gain);

  FxShelf frequency(int frequency);

  FxShelf slope(double slope);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FxShelf(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FxShelf(...).copyWith(id: 12, name: "My name")
  /// ````
  FxShelf call({
    double? gain,
    int? frequency,
    double? slope,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFxShelf.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFxShelf.copyWith.fieldName(...)`
class _$FxShelfCWProxyImpl implements _$FxShelfCWProxy {
  const _$FxShelfCWProxyImpl(this._value);

  final FxShelf _value;

  @override
  FxShelf gain(double gain) => this(gain: gain);

  @override
  FxShelf frequency(int frequency) => this(frequency: frequency);

  @override
  FxShelf slope(double slope) => this(slope: slope);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FxShelf(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FxShelf(...).copyWith(id: 12, name: "My name")
  /// ````
  FxShelf call({
    Object? gain = const $CopyWithPlaceholder(),
    Object? frequency = const $CopyWithPlaceholder(),
    Object? slope = const $CopyWithPlaceholder(),
  }) {
    return FxShelf(
      gain: gain == const $CopyWithPlaceholder() || gain == null
          // ignore: unnecessary_non_null_assertion
          ? _value.gain!
          // ignore: cast_nullable_to_non_nullable
          : gain as double,
      frequency: frequency == const $CopyWithPlaceholder() || frequency == null
          // ignore: unnecessary_non_null_assertion
          ? _value.frequency!
          // ignore: cast_nullable_to_non_nullable
          : frequency as int,
      slope: slope == const $CopyWithPlaceholder() || slope == null
          // ignore: unnecessary_non_null_assertion
          ? _value.slope!
          // ignore: cast_nullable_to_non_nullable
          : slope as double,
    );
  }
}

extension $FxShelfCopyWith on FxShelf {
  /// Returns a callable class that can be used as follows: `instanceOfFxShelf.copyWith(...)` or like so:`instanceOfFxShelf.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FxShelfCWProxy get copyWith => _$FxShelfCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FxConfig _$FxConfigFromJson(Map<String, dynamic> json) => FxConfig(
      reverse: json['reverse'] as bool?,
      reverb: json['reverb'] == null
          ? null
          : FxReverb.fromJson(json['reverb'] as Map<String, dynamic>),
      delay: json['delay'] == null
          ? null
          : FxDelay.fromJson(json['delay'] as Map<String, dynamic>),
      lowshelf: json['lowshelf'] == null
          ? null
          : FxShelf.fromJson(json['lowshelf'] as Map<String, dynamic>),
      highshelf: json['highshelf'] == null
          ? null
          : FxShelf.fromJson(json['highshelf'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FxConfigToJson(FxConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reverse', instance.reverse);
  writeNotNull('reverb', instance.reverb?.toJson());
  writeNotNull('delay', instance.delay?.toJson());
  writeNotNull('lowshelf', instance.lowshelf?.toJson());
  writeNotNull('highshelf', instance.highshelf?.toJson());
  return val;
}

FxReverb _$FxReverbFromJson(Map<String, dynamic> json) => FxReverb(
      level: json['level'] as int? ?? 50,
      damping: json['damping'] as int? ?? 50,
      size: json['size'] as int? ?? 100,
      depth: json['depth'] as int? ?? 100,
      predelay: json['predelay'] as int? ?? 20,
      wetgain: json['wetgain'] as int? ?? 0,
      wetonly: json['wetonly'] as bool? ?? false,
    );

Map<String, dynamic> _$FxReverbToJson(FxReverb instance) => <String, dynamic>{
      'level': instance.level,
      'damping': instance.damping,
      'size': instance.size,
      'depth': instance.depth,
      'predelay': instance.predelay,
      'wetgain': instance.wetgain,
      'wetonly': instance.wetonly,
    };

FxDelay _$FxDelayFromJson(Map<String, dynamic> json) => FxDelay(
      gainIn: (json['gain_in'] as num?)?.toDouble() ?? 0.8,
      gainOut: (json['gain_out'] as num?)?.toDouble() ?? 0.5,
      parallel: json['parallel'] as bool? ?? false,
    );

Map<String, dynamic> _$FxDelayToJson(FxDelay instance) => <String, dynamic>{
      'gain_in': instance.gainIn,
      'gain_out': instance.gainOut,
      'parallel': instance.parallel,
    };

FxShelf _$FxShelfFromJson(Map<String, dynamic> json) => FxShelf(
      gain: (json['gain'] as num?)?.toDouble() ?? -20,
      frequency: json['frequency'] as int? ?? 500,
      slope: (json['slope'] as num?)?.toDouble() ?? 0.5,
    );

Map<String, dynamic> _$FxShelfToJson(FxShelf instance) => <String, dynamic>{
      'gain': instance.gain,
      'frequency': instance.frequency,
      'slope': instance.slope,
    };
