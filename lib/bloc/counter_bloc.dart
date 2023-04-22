import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  int counter = 0;

  CounterBloc() : super(InitialState()) {
    on<NumberIncrease>(onNumberIncrease);
    on<NumberDecrease>(onNumberDecrease);
  }

  void onNumberIncrease(NumberIncrease event, Emitter<CounterStates> emit) {
    counter = counter + 1;
    emit(UpdateState(counter: counter));
  }

  void onNumberDecrease(NumberDecrease event, Emitter<CounterStates> emit) {
    counter = counter - 1;
    emit(UpdateState(counter: counter));
  }
}
