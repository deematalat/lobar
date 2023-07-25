
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/helper/constant.dart';
import 'package:lobor/helper/text_style.dart';
import '../../../helper/componet/material_btn.dart';
import '../../../helper/image_constant.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
   static final route="/ForgetPasswordScreen";
  TextEditingController mobilenoController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColor.whiteA700,
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:EdgeInsets.only(left: 18.sp, top: 8.sp, right: 18.sp, bottom: 8.sp),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25.sp,
                          ),
                          Text("Forget Password",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyles.txtQuicksandBold28),
                          Container(
                              width: 171.sp,
                              margin: EdgeInsets.only(top: 24.sp),
                              child: Text(
                                  "Enter your Phone Number\nto reset password.",
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  style: TextStyles.txtQuicksandMedium14)),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 4.sp, top: 28.sp),
                                  child: Text("Phone",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyles.txtQuicksandSemiBold16))),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: mobilenoController,
                              hintText: "5621458751",
                              margin: EdgeInsets.only(top: 10.sp),
                              variant: TextFormFieldVariant.White,
                              padding: TextFormFieldPadding.PaddingT20,
                              fontStyle:
                              TextFormFieldFontStyle.QuicksandSemiBold16,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.phone,
                              suffix: Container(
                                  margin:EdgeInsets.only(
                                      left: 30.sp, top: 18.sp, right: 24.sp, bottom: 18.sp),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgCall)),
                              suffixConstraints: BoxConstraints(
                                  maxHeight:60.sp)),
                          SizedBox(
                            height: 25.sp,
                          ),
                          MaterialBtn(btnText: 'Reset password', onpressed: () {  },),
                        ])))));
  }


}