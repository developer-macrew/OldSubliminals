import 'package:bloc/bloc.dart';
import 'package:common/common.dart';

import '../model/engine_queue.dart';
import 'locator.dart';

class QueueManager extends Cubit<EngineQueue> {
  QueueManager() : super(EngineQueue.initial()) {
    fetchState();
  }

  void update(EngineQueue queue) {
    print('Queue updated: $queue');
    emit(queue);
  }

  Future<void> fetchState() async {
    final initialState = state;
    final result = await engine().getQueue();
    if (result.ok) {
      // We don't want to update this if the engine has already updated us.
      if (initialState == state) {
        update(result.object!);
      }
    }
  }

  SubliminalStatus statusOf(String id) => state.statusOf(id);
}
