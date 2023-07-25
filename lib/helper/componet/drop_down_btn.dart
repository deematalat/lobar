

import 'package:flutter/material.dart';

class DropdownItem extends StatefulWidget {
  const DropdownItem({super.key, required this.DropDawnList});
  final List DropDawnList;
  @override
  _DropdownItemState createState() => _DropdownItemState();
}

class _DropdownItemState extends State<DropdownItem> {

  @override
  Widget build(BuildContext context) {
    String selected = widget.DropDawnList[0];
    return  Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), // Customize the border here
          borderRadius: BorderRadius.circular(8.0), // Optional: Add border radius
        ),
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: DropdownButtonFormField<String>(
      value: selected,
      onChanged: (String? newValue) {
        setState(() {
          selected = newValue!;
        });
      },
      items: widget.DropDawnList.map((city) {
        return DropdownMenuItem<String>(
          value: city,
          child: Text(city),
        );
      }).toList(),
    ),),);
  }
}
