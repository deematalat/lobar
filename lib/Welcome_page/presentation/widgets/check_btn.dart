import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import 'package:flutter/material.dart';
import 'package:lobor/helper/constant.dart';
import 'package:provider/provider.dart';

import '../../../helper/text_style.dart';
import '../manager/onboarding_provider.dart';




class CheckBtn extends StatefulWidget {
   CheckBtn({Key? key}) : super(key: key);

  @override
  State<CheckBtn> createState() => _CheckBtnState();
}

class _CheckBtnState extends State<CheckBtn> {

  @override
  Widget build(BuildContext context) {
    var data=AppLocalizations.of(context)!;
    var provide=  Provider.of<OnBoardingProvider>(context);
    return  Row(
      children: <Widget>[
        Checkbox(
          activeColor:AppColor.primary,
          value: provide.isChecked(),
          onChanged: (bool? value) {
            setState(() {
              provide.setCheckValue(value);
            });
          },
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(child://SizedBox
        Text(
         data.term ,
          style:TextStyles.supStyle,
        ),), //Text
        SizedBox(width: 10), //SizedBox
      ], //<Widget>[]
    );
  }
}


