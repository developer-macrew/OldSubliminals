import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:subliminal/services/service_locator.dart';

class UserSubsController extends Cubit<SubliminalList> {
  UserSubsController() : super(SubliminalList.empty) {
    init();
  }

  void init() {
    auth().loggedInStream.listen(_handleLoginChange);
  }

  void _handleLoginChange(bool loggedIn) {
    if (loggedIn) {
      update();
    } else {
      clear();
    }
  }

  void clear() => emit(SubliminalList.empty);

  void update() async {
    final result = await api().getMySubliminals();
    if (result.ok) {
      emit(result.object!);
    }
    if (state.requests.isNotEmpty) {
      Timer(const Duration(seconds: 1), update);
    }
  }
}
