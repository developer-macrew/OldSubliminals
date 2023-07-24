import 'package:common/model/fx_config.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subliminal_config.g.dart';

@CopyWith()
@JsonSerializable()
class SubliminalConfig extends Equatable {
  final String music;
  final String text;
  final String voice;
  final String align;
  final int repeat;
  final int offset;
  final int pad;
  final num speed;
  final num pitch;
  final num gain;
  final num speechLevel;
  final num normLevel;
  final num fadeSize;
  final FxConfig musicFx;
  final FxConfig speechFx;

  @override
  List<Object?> get props => [
        music,
        text,
        voice,
        align,
        repeat,
        pad,
        offset,
        speed,
        pitch,
        gain,
        speechLevel,
        normLevel,
        fadeSize,
        musicFx,
        speechFx,
      ];

  const SubliminalConfig({
    this.music = 'example.mp3',
    required this.text,
    this.voice = 'en-GB-Wavenet-A',
    this.align = 'centre',
    this.repeat = 0,
    this.offset = 0,
    this.pad = 0,
    this.speed = 1.0,
    this.pitch = 0.0,
    this.gain = 0.0,
    this.speechLevel = 0.5,
    this.normLevel = 0.95,
    this.fadeSize = 0.05,
    this.musicFx = FxConfig.none,
    this.speechFx = FxConfig.none,
  });

  factory SubliminalConfig.fromJson(Map<String, dynamic> json) =>
      _$SubliminalConfigFromJson(json);

  Map<String, dynamic> toJson() => _$SubliminalConfigToJson(this);
}
