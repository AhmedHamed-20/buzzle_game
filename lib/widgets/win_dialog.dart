import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget win_dialog(
    BuildContext context, int win_time, int step, Function reset) {
  return AlertDialog(
    title: Text(
      'Victory',
      style: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Yessssssssssss you made it 🥳🥳🎈',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        Text(
          'You made it in ${win_time.toString()} second and with ${step} steps.',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
      ],
    ),
    actions: [
      MaterialButton(
        onPressed: () {
          reset();
          Navigator.of(context).pop();
        },
        child: Text(
          'ok',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    ],
  );
}
