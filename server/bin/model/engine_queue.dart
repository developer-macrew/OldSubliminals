import 'package:common/common.dart';
import 'package:equatable/equatable.dart';

class EngineQueue extends Equatable {
  final List<String> ready;
  final List<String> generating;
  final List<String> queue;

  const EngineQueue({
    required this.ready,
    required this.generating,
    required this.queue,
  });

  factory EngineQueue.initial() => EngineQueue(
        ready: [],
        generating: [],
        queue: [],
      );

  factory EngineQueue.fromJson(Map<String, dynamic> json) => EngineQueue(
        generating: <String>[...json['generating']],
        queue: <String>[...json['queue']],
        ready: <String>[...json['ready']],
      );

  Map<String, dynamic> toJson() => {
        'ready': ready,
        'generating': generating,
        'queue': queue,
      };

  Map<String, dynamic> lengths() => {
        'ready': ready.length,
        'generating': generating.length,
        'queue': queue.length,
      };

  SubliminalStatus statusOf(String id) {
    if (ready.contains(id)) return SubliminalStatus.ready;
    if (generating.contains(id)) return SubliminalStatus.generating;
    if (queue.contains(id)) return SubliminalStatus.queue;
    return SubliminalStatus.none;
  }

  @override
  String toString() =>
      'EngineQueue(ready: ${ready.length}, generating: ${generating.length}, queue: ${queue.length})';

  @override
  List<Object> get props => [ready.length, generating.length, queue.length];
}
