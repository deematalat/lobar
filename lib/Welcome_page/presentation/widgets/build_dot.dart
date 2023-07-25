




import 'package:flutter/material.dart';

Container buildDot(int index, BuildContext context, int currentIndex,Color? color){

  return Container(
    height: 10,
    width: currentIndex == index ? 25 : 10,
    margin: EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: color,
    ),
  );
}