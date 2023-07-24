import 'package:bloc/bloc.dart';
import 'package:common/model/server_meta.dart';
import 'package:subliminal/services/service_locator.dart';

class MetaController extends Cubit<ServerMeta> {
  MetaController() : super(ServerMeta.initial()) {
    get();
  }

  void get() async {
    final result = await api().getMeta();
    if (result.ok) {
      emit(result.object!);
    }
  }
}
