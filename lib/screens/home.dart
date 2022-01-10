import 'package:buzzle_game/modules/bloc/cubit/cubit.dart';
import 'package:buzzle_game/modules/bloc/states/states.dart';
import 'package:buzzle_game/widgets/play_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              InkWell(
                onTap: () {
                  cubit.reset();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.replay,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          backgroundColor: Colors.grey[200],
          body: SafeArea(
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      'Puzzle',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  PlayBoard(),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.timer,
                              color: Colors.black,
                              size: 30,
                            ),
                            Text(
                              '${cubit.start.toString()} sec',
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                cubit.switchPause();
                              },
                              child: Icon(
                                cubit.pause ? Icons.play_arrow : Icons.pause,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.cached,
                              size: 30,
                              color: Colors.black,
                            ),
                            Text(
                              cubit.move.toString(),
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                        // Column(
                        //   children: [
                        //     Icon(
                        //       Icons.timer,
                        //       color: Colors.black,
                        //       size: 30,
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
