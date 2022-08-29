import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {this.w,
      this.h,
      this.border,
      this.backcolor,
      this.textcolor,
      this.name,
      this.fsize});
  double? w, h, border, fsize;
  Color? backcolor, textcolor;
  String? name;
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(border!),
          color: backcolor,
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            name!,
            style: TextStyle(fontSize: fsize, color: textcolor),
          ),
        ),
    ),
      );
  }
}
