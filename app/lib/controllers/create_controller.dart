import 'package:bloc/bloc.dart';
import 'package:common/common.dart';

class CreateController extends Cubit<SubliminalRequest> {
  CreateController() : super(SubliminalRequest.blank);

  void setTitle(String title) => emit(state.copyWith(title: title));
  void setText(String text) =>
      emit(state.copyWith(config: state.config.copyWith(text: text)));
  void setVoice(String voice) =>
      emit(state.copyWith(config: state.config.copyWith(voice: voice)));
  void setAlign(String? align) => emit(state.copyWith(
      config: state.config.copyWith(align: align ?? state.config.align)));
  void setRepeat(int repeat) =>
      emit(state.copyWith(config: state.config.copyWith(repeat: repeat)));
  void setSpeed(num speed) =>
      emit(state.copyWith(config: state.config.copyWith(speed: speed)));
  void setPitch(num pitch) =>
      emit(state.copyWith(config: state.config.copyWith(pitch: pitch)));
  void setGain(num gain) =>
      emit(state.copyWith(config: state.config.copyWith(gain: gain)));
  void setOffset(int offset) =>
      emit(state.copyWith(config: state.config.copyWith(offset: offset)));

  // Effects - temporary until more controls can be added
  void setSpeechReverb(bool enabled) => emit(
        state.copyWith(
          config: state.config.copyWith(
              speechFx: state.config.speechFx
                  .copyWith(reverb: enabled ? const FxReverb() : null)),
        ),
      );

  void setSpeechReverse(bool enabled) => emit(
        state.copyWith(
          config: state.config.copyWith(
              speechFx: state.config.speechFx.copyWith(reverse: enabled)),
        ),
      );
}
