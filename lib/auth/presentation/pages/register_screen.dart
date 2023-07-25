import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/auth/presentation/pages/login_screen.dart';
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


class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static final route = "/RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController enterFullNameController = TextEditingController();

  TextEditingController mobilenoController = TextEditingController();

  TextEditingController passwordoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provide=  Provider.of<AuthController>(context);
    var data = AppLocalizations.of(context)!;
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColor.whiteA700,
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: SingleChildScrollView(
                              padding: EdgeInsets.only(top: 69.sp),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 18.sp, right: 20.sp, bottom: 67.sp),
                                  child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Text(data.sign_up,
                                            style:
                                                TextStyles.txtQuicksandBold28,
                                            textAlign: TextAlign.left),
                                        Container(
                                            width: 149.sp,
                                            margin: EdgeInsets.only(top: 17.sp),
                                            child: Text(
                                                data.register_description,
                                                maxLines: null,
                                                textAlign: TextAlign.center,
                                                style: TextStyles
                                                    .txtQuicksandMedium14)),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 25.sp,right: 25.sp,
                                                    top: 20.sp,
                                                  ),
                                                  child: Text(data.full_name,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyles
                                                          .txtQuicksandSemiBold16))
                                            ]),
                                        CustomTextFormField(
                                          focusNode: FocusNode(),
                                          autofocus: true,
                                          controller: enterFullNameController,
                                          hintText: data.name_hint,
                                          margin: EdgeInsets.only(
                                            left: 19.sp,
                                            top: 10.sp,
                                            right: 20.sp,
                                          ),
                                          textInputType: TextInputType.name,
                                          suffix: Container(
                                            margin: EdgeInsets.only(
                                              left: 30,
                                              top: 18,
                                              right: 24,
                                              bottom: 18,
                                            ),
                                            child: CustomImageView(
                                              svgPath: ImageConstant.imgUser,
                                            ),
                                          ),
                                          suffixConstraints: BoxConstraints(
                                            maxHeight: 60.sp,
                                          ),
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 25.sp,right: 25.sp,
                                                    top: 20.sp,
                                                  ),
                                                  child: Text(data.phone,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyles
                                                          .txtQuicksandSemiBold16))
                                            ]),
                                        CustomTextFormField(
                                          focusNode: FocusNode(),
                                          autofocus: true,
                                          controller: mobilenoController,
                                          hintText: data.phone_hint,
                                          margin: EdgeInsets.only(
                                            left: 19.sp,
                                            top: 10.sp,
                                            right: 20.sp,
                                          ),
                                          textInputType: TextInputType.phone,
                                          suffix: Container(
                                            margin: EdgeInsets.only(
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 25.sp,right: 25.sp,
                                                    top: 20.sp,
                                                  ),
                                                  child: Text(data.password,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyles
                                                          .txtQuicksandSemiBold16))
                                            ]),
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
                                          textInputType:
                                              TextInputType.visiblePassword,
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
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20.sp,
                                              top: 20.sp,
                                              right: 20.sp,
                                              bottom: 10.sp),
                                          child: MaterialBtn(
                                            btnText: data.register,
                                            onpressed: () {
                                              perfrormRegister(
                                                  context,provide,
                                                  mobilenoController.text,
                                                  enterFullNameController.text
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 1.sp,
                                                top: 22.sp,
                                                right: 1.sp),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 6.sp,
                                                          bottom: 12.sp),
                                                      child: SizedBox(
                                                          width: 167.sp,
                                                          child: Divider(
                                                              height: 2.sp,
                                                              thickness: 2.sp,
                                                              color: AppColor
                                                                  .gray50))),
                                                  Text(data.or,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyles
                                                          .txtQuicksandMedium12),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 6.sp,
                                                          bottom: 12.sp),
                                                      child: SizedBox(
                                                          width: 167.sp,
                                                          child: Divider(
                                                              height: 2.sp,
                                                              thickness: 2.sp,
                                                              color: AppColor
                                                                  .gray50)))
                                                ])),
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 1.sp, top: 10.sp),
                                            padding: EdgeInsets.only(
                                                left: 126.sp,
                                                top: 14.sp,
                                                right: 126.sp,
                                                bottom: 14.sp),
                                            decoration: AppDecoration
                                                .outlineGray300
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder8),
                                            child: Row(children: [
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgAkariconsfacebookfill,
                                                  height: 32.sp,
                                                  width: 32.sp,
                                                  margin: EdgeInsets.only(
                                                      top: 1.sp, bottom: 1.sp)),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 12.sp, top: 7.sp),
                                                  child: Text(
                                                    data.facebook,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyles
                                                        .txtQuicksandSemiBold18
                                                        .copyWith(
                                                      letterSpacing: 1.0.sp,
                                                    ),
                                                  ))
                                            ])),
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 1.sp, top: 18.sp),
                                            padding: EdgeInsets.only(
                                                left: 139.sp,
                                                top: 14.sp,
                                                right: 139.sp,
                                                bottom: 14.sp),
                                            decoration: AppDecoration
                                                .outlineGray300
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder8),
                                            child: Row(children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgYoutube,
                                                  height: 32.sp,
                                                  width: 32.sp,
                                                  margin: EdgeInsets.only(
                                                      top: 1.sp, bottom: 1.sp)),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 12.sp, top: 7.sp),
                                                  child: Text(
                                                    data.google,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyles
                                                        .txtQuicksandSemiBold18
                                                        .copyWith(
                                                      letterSpacing: 1.0.sp,
                                                    ),
                                                  ))
                                            ])),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 28,
                                            bottom: 5,
                                          ),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: data.have_acc,
                                                  style: TextStyle(
                                                    color: AppColor.gray90001,
                                                    fontSize: 16.sp,
                                                    fontFamily: 'Quicksand',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                TextSpan(
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              LoginScreen
                                                                  .route);
                                                        },
                                                  text: data.sign_in,
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
                                      ]))))
                    ]))
        )
    );

  }

  Future<void> perfrormRegister(context,provide,phoneNumber,fullName)async{
    if(checkData(context)){
      await register(context,provide,phoneNumber,fullName);
    }
  }

  bool checkData( context){
    if(enterFullNameController.text.isNotEmpty&&
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

  Future<void> register(context,provide,phoneNumber,fullName)async {
         var result = await provide.getVerifiedCode(phoneNumber);
         if (mounted) {
         await provide.saveUserInfo(fullName:fullName,phone:phoneNumber,result:result);
         Navigator.pushNamedAndRemoveUntil(context,OtpScreen.route,(route) => false);}
  }
}
