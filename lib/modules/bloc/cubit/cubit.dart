import 'package:bloc/bloc.dart';
import 'package:buzzle_game/modules/bloc/states/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitState());
  static AppCubit get(context) => BlocProvider.of(context);
  List boardList = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
  ];
  void changestate() {
    emit(ChangeState());
  }

  bool checkWin(List gameState) {
    int prev = gameState.first;
    for (int i = 1; i < gameState.length; i++) {
      int next = gameState[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  void reset() {
    boardList.shuffle();
    changestate();
  }
}
