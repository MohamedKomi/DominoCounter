import 'package:basketball_counter_app/cubit/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterAState());
  Map<String, int> counters = {
    'first': 0,
    'second': 0,
    'third': 0,
    'forth': 0,
  };

  void teamIncrement(String team, int points) {
    switch (team) {
      case 'A':
        counters['first'] = counters['first']! + points;
        emit(CounterAState());

        break;
      case 'B':
        counters['second'] = counters['second']! + points;
        emit(CounterBState());
        break;
      case 'C':
        counters['third'] = counters['third']! + points;
        emit(CounterCState());
        break;
      case 'D':
        counters['forth'] = counters['forth']! + points;
        emit(CounterDState());
    }
  }

  void teamDecrement(String team, int points) {
    switch (team) {
      case 'A':
        counters['first'] = counters['first']! - points;
        emit(CounterAState());

        break;
      case 'B':
        counters['second'] = counters['second']! - points;
        emit(CounterBState());
        break;
      case 'C':
        counters['third'] = counters['third']! - points;
        emit(CounterCState());
        break;
      case 'D':
        counters['forth'] = counters['forth']! - points;
        emit(CounterDState());
    }
  }

  void resetTeams() {
    counters['first'] = 0;
    counters['second'] = 0;
    counters['third'] = 0;
    counters['forth'] = 0;
    emit(CounterAState());

  }
}
