
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/auth/presentation/pages/register_screen.dart';
import 'package:lobor/helper/componet/Helpers.dart';
import 'package:lobor/helper/constant.dart';
import 'package:provider/provider.dart';
import '../../../helper/app_decoration.dart';
import '../../../helper/componet/material_btn.dart';
import '../../../helper/image_constant.dart';
import '../../../helper/text_style.dart';
import '../manager/auth_controller.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/custom_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';

import 'otp_screen.dart';
class LoginScreen extends StatelessWidget {
  static final route="/LoginScreen";
  static String verify='';
  LoginScreen({Key? key})
      : super(
    key: key,
  );

  TextEditingController mobilenoController = TextEditingController();

  TextEditingController passwordoneController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var data=AppLocalizations.of(context)!;
    var provide=  Provider.of<AuthController>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height:58.sp,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColor.whiteA700,
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(
                    top: 9.w
                  ),
                  child: Text(
                    data.login,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyles.txtQuicksandBold28,
                  ),
                ),
                Container(
                  width:256.sp,
                  margin:EdgeInsets.only(top:19.sp),
                  child: Text(
                   data.login_description,
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: TextStyles.txtQuicksandMedium14,
                  ),
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[  Padding(
                    padding: EdgeInsets.only(
                      left: 25.sp,right: 25.sp,
                      top: 20.sp,
                    ),
                    child: Text(
                     data.phone,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyles.txtQuicksandSemiBold16,
                    ),
                  ),]
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: mobilenoController,
                  hintText: data.phone_hint,
                  margin: EdgeInsets.only(
                    left: 19.sp,
                    top: 10.sp,
                    right: 20.sp,),
                  textInputType: TextInputType.phone,
                  suffix: Container(
                    margin:EdgeInsets.only(
                      left: 30,
                      top: 18,
                      right: 24,
                      bottom: 18,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgCall,
                    ),
                  ),
                  suffixConstraints: BoxConstraints(
                    maxHeight: 60.sp,
                  ),
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[  Padding(
                    padding:EdgeInsets.only(
                      left: 25.sp,right: 25.sp,
                      top: 20.sp,
                    ),
                    child: Text(
                      data.password,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyles.txtQuicksandSemiBold16,
                    ),
                  ),]
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: passwordoneController,
                  hintText: data.password_hint,
                  margin: EdgeInsets.only(
                    left: 19.sp,
                    top: 10.sp,
                    right: 20.sp,
                  ),
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  suffix: Container(
                    margin: EdgeInsets.only(
                      left: 30.sp,
                      top: 18.sp,
                      right: 24.sp,
                      bottom: 18.sp,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgEye,
                    ),
                  ),
                  suffixConstraints: BoxConstraints(
                    maxHeight: 60.sp,

                  ),
                  isObscureText: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20.sp,
                      right: 20.sp,
                      bottom:20.sp,
                      left:20.sp
                    ),
                    child: Text(
                      data.forget_password,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyles.txtQuicksandMedium16,
                    ),
                  ),
                ),
                Padding(padding:EdgeInsets.symmetric(horizontal:20.w) ,
               child: MaterialBtn(btnText:data.login, onpressed: () async {
                 await perfrormLogin(context,provide);
               },
                ),),
                Padding(
                  padding:EdgeInsets.only(
                    left: 20.sp,
                    top: 22.sp,
                    right: 20.sp,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 6,
                          bottom: 6,
                        ),
                        child: SizedBox(
                          width:
                            167.sp,
                          child: Divider(
                            height: 2.sp,
                            thickness: 2.sp,
                            color: AppColor.gray50,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 18.sp,
                        ),
                        child: Text(
                          data.or,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyles.txtQuicksandMedium12,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 6.sp,
                          bottom: 6.sp,
                        ),
                        child: SizedBox(
                          width: 186.sp,
                          child: Divider(
                            height: 2.sp,
                            thickness: 2.sp,
                            color: AppColor.gray50,
                            indent: 19.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20.sp,
                    top: 16.sp,
                    right: 19.sp,
                  ),
                  padding: EdgeInsets.only(
                    left: 126.sp,
                    top: 16.sp,
                    right: 126.sp,
                    bottom: 16.sp,
                  ),
                  decoration: AppDecoration.outlineGray300.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgAkariconsfacebookfill,
                        height: 32.sp,
                        width: 32.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 12.sp,
                          top: 4.sp,
                          right: 1.sp,
                          bottom: 4.sp,
                        ),
                        child: Text(
                          data.facebook,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyles.txtQuicksandSemiBold18.copyWith(
                            letterSpacing: 1.0.sp ,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20.sp,
                    top: 18.sp,
                    right: 19.sp,
                  ),
                  padding: EdgeInsets.only(
                    left: 139.sp,
                    top: 16.sp,
                    right: 139.sp,
                    bottom: 16.sp,
                  ),
                  decoration: AppDecoration.outlineGray300.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgYoutube,
                        height: 32.sp,
                        width:
                          32.sp,

                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 12.sp,
                          top: 6.sp,
                          bottom: 2.sp,
                        ),
                        child: Text(
                          data.google,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyles.txtQuicksandSemiBold18.copyWith(
                            letterSpacing: 1.0.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 28,
                    bottom: 5,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: data.dont_have_acc,
                          style: TextStyle(
                            color: AppColor.gray90001,
                            fontSize: 16.sp,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          recognizer:TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context,RegisterScreen.route);
                            },
                          text: data.sign_up,
                          style: TextStyle(
                            color: AppColor.gray90001,
                            fontSize: 16.sp,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> perfrormLogin(context,provide)async{
    if(checkData(context)){
      await register(context,provide);
    }
  }
  bool checkData( context){
    if(
        mobilenoController.text.isNotEmpty&&
        passwordoneController.text.isNotEmpty
    ){
      return true;
    }
    Helpers.ShowSnackBar(context: context,
        massage:"Enter required data!"
        ,error: true);
    return false;
  }
  Future<void> register(context,provide)async {
    var result = await provide.getVerifiedCode( mobilenoController.text);
    Navigator.pushNamedAndRemoveUntil(context,OtpScreen.route,(route) => false);
  }
}
