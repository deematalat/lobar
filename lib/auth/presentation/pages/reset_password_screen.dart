
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/auth/presentation/pages/forget_password_screen.dart';
import 'package:lobor/helper/constant.dart';
import 'package:lobor/helper/text_style.dart';

import '../../../helper/app_decoration.dart';
import '../../../helper/componet/material_btn.dart';
import '../../../helper/image_constant.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/custom_text_form_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);
  static final route="/ResetPasswordScreen";
  TextEditingController groupninetynineController = TextEditingController();

  TextEditingController group100Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor:AppColor.whiteA700,
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: double.maxFinite,
                          child: Container(
                              width: double.maxFinite,
                              padding: EdgeInsets.only(
                                  left: 27.sp, top: 16.sp
                                  , right: 27.sp, bottom: 16.sp
                              ),
                              decoration: AppDecoration.fillWhiteA700,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant
                                            .imgEye,
                                        height: 24.sp,
                                        width: 24.sp,
                                        margin:EdgeInsets.only(bottom: 2.sp))
                                  ]))),
                      Padding(
                          padding: EdgeInsets.only(top: 8.sp),
                          child: Text("اعادة كلمة المرور",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyles.txtDINNextLTW23Regular38)),
                      Container(
                          width: 112.sp,
                          margin: EdgeInsets.only(top: 14.sp),
                          child: Text("برجاء ادخال كلمة مرور \nلتاكيد حسابك",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: TextStyles.txtDINNextLTW23Medium14Gray400)),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: EdgeInsets.only(top: 35.sp, right: 20.sp),
                              child: Text("رقم المرور",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyles.txtQuicksandMedium16))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: groupninetynineController,
                          hintText: "ادخل رقم الهاتف",
                          margin: EdgeInsets.only(left: 19, top: 5, right: 20),
                          prefix: Container(
                              margin: EdgeInsets.only(
                                  left: 21.sp, top: 18.sp, right: 30.sp, bottom: 18.sp),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgEye)),
                          prefixConstraints:
                          BoxConstraints(maxHeight: 60.sp)),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: EdgeInsets.only(top: 22.sp, right: 20.sp),
                              child: Text("تاكيد رقم المرور",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyles.txtQuicksandMedium16))),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: group100Controller,
                          hintText: "ادخل رقم الهاتف",
                          margin: EdgeInsets.only(left: 19.sp, top: 5.sp, right: 20.sp),
                          textInputAction: TextInputAction.done,
                          prefix: Container(
                              margin: EdgeInsets.only(
                                  left: 21.sp, top: 18.sp, right: 30.sp, bottom: 18.sp),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgEye)),
                          prefixConstraints:
                          BoxConstraints(maxHeight: 60.sp)),
                   Padding(padding: EdgeInsets.all(20.w) ,child:  MaterialBtn(btnText: 'submit', onpressed: () {
                        Navigator.pushNamed(context,ForgetPasswordScreen.route);
                      },)),
                    ]))));
  }


}