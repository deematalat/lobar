import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/helper/constant.dart';
import 'package:lobor/home/presentation/pages/main_screen.dart';
import 'package:provider/provider.dart';
import '../../../auth/presentation/widgets/custom_text_form_field.dart';
import '../../../empty_state/massage_alert.dart';
import '../../../helper/componet/Helpers.dart';
import '../../../helper/componet/custom_app_bar.dart';
import '../../../helper/componet/material_btn.dart';
import '../../../helper/text_style.dart';
import '../manager/profile_controller.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key}) : super(key: key);

  static final route = "/ContactUsScreen";

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController massageController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var data = AppLocalizations.of(context)!;
    var provide = Provider.of<ProfileController>(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColor.whiteA700,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
              height: 60.sp,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_forward_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
              centerTitle: true,
              title: Text(
                data.conact_us,
                style: TextStyles.txtQuicksandSemiBold18,
              ),
            ),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(
                        left: 19.sp, top: 25.sp, right: 19.sp, bottom: 25.sp),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: 319.sp,
                              margin: EdgeInsets.only(left: 5.sp, right: 65.sp),
                              child: Text(
                                 data.conact_description,
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: TextStyles.txtQuicksandSemiBold20)),
                          Container(
                              height: 202.sp,
                              width: 389.sp,
                              margin: EdgeInsets.only(top: 28.sp),
                              child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 1.sp),
                                                  child: Text(data.name,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyles
                                                          .txtQuicksandSemiBold16)),
                                              CustomTextFormField(
                                                  focusNode: FocusNode(),
                                                  autofocus: true,
                                                  controller: nameController,
                                                  margin: EdgeInsets.only(
                                                      top: 10.sp),
                                                  hintText: data.name_hint,
                                                  variant: TextFormFieldVariant
                                                      .White)
                                            ])),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 40.sp),
                                                  child: Text(data.phone,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyles
                                                          .txtQuicksandSemiBold16)),
                                              CustomTextFormField(
                                                  focusNode: FocusNode(),
                                                  autofocus: true,
                                                  controller: phoneController,
                                                  hintText: data.phone_hint,
                                                  margin: EdgeInsets.only(
                                                      top: 10.sp),
                                                  textInputType:
                                                      TextInputType.phone)
                                            ]))
                                  ])),
                          Padding(
                              padding: EdgeInsets.only(left: 2.sp, top: 22.sp),
                              child: Text(data.massage,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyles.txtQuicksandSemiBold16)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: massageController,
                              hintText: data.massage_hint,
                              margin: EdgeInsets.only(left: 1.sp, top: 9.sp),
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.text,
                              maxLines: 7),
                          SizedBox(
                            height: 20.sp,
                          ),
                          MaterialBtn(
                            btnText: data.submit,
                            onpressed: () async {
                             await perfrorm(context,provide);
                             await asyncConfirmDialog(context, text: 'home', onPreesed: () {
                               Navigator.pushNamed(context,MainScreen.route);
                             });
                            },
                          )
                        ])))));
  }
  Future<void> perfrorm(context,provide)async{
    if(checkData(context)){
      await sendMassage(context,provide);
    }
  }

  bool checkData( context){
    if(
        phoneController.text.isNotEmpty&&
        nameController.text.isNotEmpty&&
        massageController.text.isNotEmpty
    ){
      return true;
    }
    Helpers.ShowSnackBar(context: context,
        massage:"Enter required data!"
        ,error: true);
    return false;
  }

  Future<void> sendMassage(context,provide)async {
    var result = await provide.sendMassage(
        fullName: nameController.text,
        phone: phoneController.text,
        massage: massageController.text);
  }
  }

// todo:localization