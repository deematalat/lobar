
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/helper/constant.dart';
import 'package:lobor/helper/shared_pref_controller.dart';
import 'package:provider/provider.dart';
import '../../../helper/text_style.dart';
import '../manager/onboarding_provider.dart';

class SelectLangBtn extends StatefulWidget {
  const SelectLangBtn({Key? key}) : super(key: key);

  @override
  State<SelectLangBtn> createState() => _SelectLangBtnState();
}

class _SelectLangBtnState extends State<SelectLangBtn> {

  @override
  Widget build(BuildContext context) {
    var data=AppLocalizations.of(context)!;
    var provide=  Provider.of<OnBoardingProvider>(context);
    return  Column(
      children: [
        RadioListTile(
          contentPadding: EdgeInsets.symmetric(horizontal:0),
          activeColor:AppColor.primary,
          title: Padding(
            padding: EdgeInsets.only(right: 250.0.w), // Add top padding for spacing
            child: Text(data.en,style:TextStyles.langName),
          ),
          value: "en",
          groupValue:provide.lang,
          onChanged: (value){
            setState(() {
              provide.setLang(value.toString());
              print(SharedPerf().lang);
            });
            setState(() {

            });
          },
        ),
        Divider(
           thickness:1,
            height: 1.h,
            color: Color.fromRGBO(0, 0, 0, 0.1),
        ),
        RadioListTile(
          contentPadding: EdgeInsets.symmetric(horizontal:0),
          activeColor:AppColor.primary,
          title: Padding(
    padding: EdgeInsets.only(right: 250.0.w), // Add top padding for spacing
    child: Text(data.ar,style:TextStyles.langName),
    ),
          value: "ar",
          groupValue:provide.lang,
          onChanged: (value){
            setState(() {
              provide.setLang(value.toString());
              print(SharedPerf().lang);
            });
            setState(() {

            });
          },
        ),
        Divider(
          thickness:1,
          height: 1.h,
          color: Color.fromRGBO(0, 0, 0, 0.1),
        ),
      ],
    ) ;
  }
}
