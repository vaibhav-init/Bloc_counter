abstract class CounterStates {}

class InitialState extends CounterStates {}

class UpdateState extends CounterStates {
  final int counter;
  UpdateState({required this.counter});
}
