import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

extension SeededStream<T> on BlocBase<T> {
  Stream<T> get seededStream => stream.startWith(state);
}
