import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

import '../../../helper/constant.dart';

class DatePickerWidget extends StatefulWidget {
  late final DateTime selectedValue;

    DatePickerWidget({super.key, required this.selectedValue});
  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor:  AppColor.green400,
          selectedTextColor: Colors.white,
          onDateChange: (date) {
// New date selected
            setState(() {
              widget.selectedValue = date;
            });
          },
        ),
      ],
    );
  }
}
