
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Welcome_page/presentation/manager/onboarding_provider.dart';

class DropDawnSelect extends StatelessWidget {
 late String dropdownvalue;

  // List of items in our dropdown menu
  var items = [
    'ar',
    'en',
  ];

  @override
  Widget build(BuildContext context) {
    var provide=  Provider.of<OnBoardingProvider>(context);
    dropdownvalue = provide.getLang();
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(

              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                  dropdownvalue = newValue!;
                  provide.setLang(newValue);
              },
            ),
          ],
        ),
      );

  }
}