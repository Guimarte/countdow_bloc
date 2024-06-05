import 'package:bloc/bloc.dart';
import 'package:final_countdown/app/home/bloc/home_event.dart';
import 'package:final_countdown/app/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeStateInitial()) {
    on<HomeEventAdd>(_increment);
    on<HomeEventRemove>(_decrement);
    on<HomeEventCounter>(_startCounter);
  }

  int value = 1;
  int get _value => value;

  void _increment(HomeEventAdd event, Emitter<HomeState> emitter) {
    value = _value + 1;
    emitter(HomeStateAdd(value: value));
  }

  void _decrement(HomeEventRemove event, Emitter<HomeState> emitter) {
    if (_value == 1) {
      return;
    }
    value = _value - 1;
    emitter(HomeStateRemove(value: value));
  }

  void _startCounter(HomeEventCounter event, Emitter<HomeState> emitter) {
    if (_value <= 0) {
      return;
    }
    value = _value - 1;
    emitter(HomeStateCounter(value: value));
  }
}
