import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callBack;
  const CalcButton({
    Key? key,
    required this.text,
    required this.fillColor,
    this.textSize = 28,
    this.textColor = 0xffffffff,
    required this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
        backgroundColor: Color(textColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.all(8));
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: TextButton(
          style: flatButtonStyle,
          onPressed: () {
            callBack(text);
          },
          child: Text(
            text,
            style: TextStyle(
              color: fillColor != null ? Color(fillColor) : null,
              // textColor: Color(textColor),
              fontSize: textSize,
            ),
          ),
        ),
      ),
    );
  }
}
