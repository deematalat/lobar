
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Helpers {
  static void ShowSnackBar
      ({
    required BuildContext context,
    required String massage,
    bool error =false
 }){
        ScaffoldMessenger.of(context).showSnackBar
          (
            SnackBar(content:Text(massage),
             backgroundColor: error?Colors.red:Colors.green,
              behavior: SnackBarBehavior.floating,
              duration:Duration(seconds:1),
            ),
          );
   }
 }