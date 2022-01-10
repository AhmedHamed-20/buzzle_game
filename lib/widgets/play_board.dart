import 'package:buzzle_game/const/const.dart';
import 'package:buzzle_game/modules/bloc/cubit/cubit.dart';
import 'package:buzzle_game/modules/bloc/states/states.dart';
import 'package:buzzle_game/widgets/win_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayBoard extends StatelessWidget {
  const PlayBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    //cubit.boardList.shuffle();
    //colors.shuffle();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Expanded(
          child: Card(
            color: Color(0xffF0ECE3),
            elevation: 15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: cubit.boardList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return (cubit.boardList[index] == 0)
                      ? SizedBox.shrink()
                      : InkWell(
                          onTap: () {
                            if (cubit.pause == false) {
                              var tempIndex = index;
                              // if (index - 4 < 0 || index - 1 < 0) {
                              //   tempIndex = 1;
                              // }
                              if (cubit.boardList[
                                          index + 4 >= 16 ? 14 : index + 4] ==
                                      0 ||
                                  cubit.boardList[
                                          index - 4 < 0 ? 1 : index - 4] ==
                                      0 ||
                                  cubit.boardList[
                                          index - 1 < 0 ? 1 : index - 1] ==
                                      0 ||
                                  cubit.boardList[
                                          index + 1 >= 16 ? 14 : index + 1] ==
                                      0) {
                                cubit.boardList[cubit.boardList.indexOf(0)] =
                                    cubit.boardList[index];
                                cubit.boardList[index] = 0;
                                print(cubit.checkWin(cubit.boardList));
                                cubit.move++;
                                if (cubit.checkWin(cubit.boardList) == false) {
                                  cubit.changestate();
                                } else if (cubit.checkWin(cubit.boardList) ==
                                    true) {
                                  int win_time = cubit.start;
                                  showDialog(
                                    context: context,
                                    builder: (context) => win_dialog(context,
                                        win_time, cubit.move, cubit.reset),
                                  );
                                }
                              }
                            }
                          },
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            color: Color(int.parse(cubit.colors[index])),
                            child: Center(
                              child: Text(
                                cubit.boardList[index].toString(),
                                style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontSize: 23,
                                  //  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
