
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/helper/componet/Helpers.dart';
import 'package:lobor/home/presentation/pages/main_screen.dart';
import 'package:provider/provider.dart';
import '../../../auth/data/repositories/auth_repository.dart';
import '../../../helper/componet/geoloctor.dart';
import '../../../helper/text_style.dart';
import '../manager/onboarding_provider.dart';
import '../widgets/check_btn.dart';
import '../../../helper/componet/material_btn.dart';
import '../widgets/select_lang_btn.dart';
import 'onboarding1_screen.dart';


UserLocation location=UserLocation();

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static const route="/OnBoardingScreen";

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

   @override
  void initState()  {
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data=AppLocalizations.of(context)!;
    var provide=  Provider.of<OnBoardingProvider>(context);
   setState(() {
     provide.getLang();
   });
    return  Scaffold(
  body:SafeArea(
      child: Padding(
      padding:EdgeInsets.symmetric(horizontal:20.w ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
     children: [
      SizedBox(height: 70.sp,),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Image.asset("assets/logo.png"),
        ]
      ),
      SizedBox(height: 45.sp,),
       Text(data.onboarding_title,style:TextStyles.title,),
      SizedBox(height: 90.sp,),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
     children:[Text(data.select_lang,style:TextStyles.selectLang,
            textAlign:TextAlign.end,
        ),]),
       SizedBox(height: 25.sp,),
      SelectLangBtn(),
      SizedBox(height:10.sp,),
      CheckBtn(),
      SizedBox(height: 40.sp,),
      MaterialBtn(btnText:data.enter, onpressed: () {
        if(provide.isChecked())
       { Navigator.pushReplacementNamed(context,
            OnBoardingOneScreen.route);}
       else{ Helpers.ShowSnackBar(context: context, massage:"check the term and conditions",error: true);}
      },),
       SizedBox(height: 45.sp,),
    ],
  ),),
  ),
    );
  }
}

