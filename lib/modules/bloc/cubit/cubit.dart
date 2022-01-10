import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:buzzle_game/modules/bloc/states/states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitState());
  static AppCubit get(context) => BlocProvider.of(context);
  late Timer timer;
  int start = 0;
  int move = 0;
  bool pause = false;
  bool heIsWin = false;

  void switchPause() {
    pause = !pause;
    changestate();
  }

  List boardList = [
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
    0,
    12,
    13,
    14,
    15,
  ];
  List colors = [
    '0xff00A19D',
    '0xffFFF8E5',
    '0xFFFFB344',
    '0xffE05D5D',
    '0xff00A19D',
    '0xffFFF8E5',
    '0xFFFFB344',
    '0xffE05D5D',
    '0xff00A19D',
    '0xffFFF8E5',
    '0xFFFFB344',
    '0xffE05D5D',
    '0xff00A19D',
    '0xffFFF8E5',
    '0xFFFFB344',
    '0xffE05D5D',
  ];

  void changestate() {
    emit(ChangeState());
  }

  bool checkWin(List gameState) {
    int prev = gameState.first;
    for (int i = 1; i < gameState.length - 1; i++) {
      int next = gameState[i];
      if (prev == 0 || next == 0) i++;
      if (prev > next) return false;
      prev = next;
    }
    heIsWin = true;
    pause = true;
    changestate();
    return true;
  }

  void reset() {
    boardList.shuffle();
    colors.shuffle();
    start = 0;
    move = 0;
    changestate();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (pause == false || heIsWin == false) {
          start++;
          changestate();
        }
      },
    );
  }
}
