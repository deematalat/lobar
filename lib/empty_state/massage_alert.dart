



import 'package:flutter/material.dart';
import 'package:lobor/home/presentation/pages/main_screen.dart';

Future asyncConfirmDialog(BuildContext context, {required String text,required  Function()? onPreesed}) async {

  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Your request has been \n completed'),
        content: const Text(
            'The worker will be dispatched on time.'),
        actions: <Widget>[
          TextButton(
            child:   Text(text),
            onPressed:onPreesed,
          ),
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}