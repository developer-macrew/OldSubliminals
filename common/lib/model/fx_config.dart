import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fx_config.g.dart';

@CopyWith()
@JsonSerializable(includeIfNull: false)
class FxConfig extends Equatable {
  final bool? reverse;
  final FxReverb? reverb;
  final FxDelay? delay;
  final FxShelf? lowshelf;
  final FxShelf? highshelf;

  const FxConfig({
    this.reverse,
    this.reverb,
    this.delay,
    this.lowshelf,
    this.highshelf,
  });

  static const none = FxConfig();

  factory FxConfig.fromJson(Map<String, dynamic> json) =>
      _$FxConfigFromJson(json);

  Map<String, dynamic> toJson() => _$FxConfigToJson(this);

  @override
  List<Object?> get props => [reverse, reverb, delay, lowshelf, highshelf];
}

@CopyWith()
@JsonSerializable()
class FxReverb extends Equatable {
  final int level;
  final int damping;
  final int size;
  final int depth;
  final int predelay;
  final int wetgain;
  final bool wetonly;

  const FxReverb({
    this.level = 50,
    this.damping = 50,
    this.size = 100,
    this.depth = 100,
    this.predelay = 20,
    this.wetgain = 0,
    this.wetonly = false,
  });

  static const standard = FxReverb();

  factory FxReverb.fromJson(Map<String, dynamic> json) =>
      _$FxReverbFromJson(json);

  Map<String, dynamic> toJson() => _$FxReverbToJson(this);

  @override
  List<Object?> get props =>
      [level, damping, size, depth, predelay, wetgain, wetonly];
}

@CopyWith()
@JsonSerializable()
class FxDelay extends Equatable {
  final double gainIn;
  final double gainOut;
  final bool parallel;
  // final List<DelaySet> delays; // todo
  const FxDelay({
    this.gainIn = 0.8,
    this.gainOut = 0.5,
    this.parallel = false,
  });

  factory FxDelay.fromJson(Map<String, dynamic> json) =>
      _$FxDelayFromJson(json);

  Map<String, dynamic> toJson() => _$FxDelayToJson(this);

  @override
  List<Object?> get props => [gainIn, gainOut, parallel];
}

@CopyWith()
@JsonSerializable()
class FxShelf extends Equatable {
  final double gain;
  final int frequency;
  final double slope;

  const FxShelf({
    this.gain = -20,
    this.frequency = 500,
    this.slope = 0.5,
  });

  factory FxShelf.low({
    double gain = -20,
    int frequency = 100,
    double slope = 0.5,
  }) =>
      FxShelf(
        gain: gain,
        frequency: frequency,
        slope: slope,
      );

  factory FxShelf.high({
    double gain = -20,
    int frequency = 3000,
    double slope = 0.5,
  }) =>
      FxShelf(
        gain: gain,
        frequency: frequency,
        slope: slope,
      );

  factory FxShelf.fromJson(Map<String, dynamic> json) =>
      _$FxShelfFromJson(json);
  Map<String, dynamic> toJson() => _$FxShelfToJson(this);

  @override
  List<Object?> get props => [gain, frequency, slope];
}
