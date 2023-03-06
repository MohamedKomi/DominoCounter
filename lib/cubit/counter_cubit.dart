import 'package:basketball_counter_app/cubit/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterAState());
  int firstTeamCounter = 0;
  int secondTeamCounter = 0;

  void teamIncrement(String team, int points) {
    if (team == 'A') {
      firstTeamCounter += points;
      emit(CounterAState());
    } else {
      secondTeamCounter += points;
      emit(CounterBState());
    }
  }
  void teamDecrement(String team, int points) {
    if (team == 'A') {
      firstTeamCounter -= points;
      emit(CounterAState());
    } else {
      secondTeamCounter -= points;
      emit(CounterBState());
    }
  }

  void resetTeams() {
    firstTeamCounter = 0;
    secondTeamCounter = 0;
    emit(CounterAState());
  }
}
