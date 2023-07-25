


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/helper/constant.dart';
import 'package:lobor/helper/text_style.dart';

import '../../../../auth/presentation/widgets/custom_text_form_field.dart';
import '../../../../helper/app_decoration.dart';
import '../../../../helper/componet/custom_app_bar.dart';

class AddAdressScreen extends StatelessWidget {
  AddAdressScreen({Key? key}) : super(key: key);
   static final route="/AddAdressScreen";
  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  TextEditingController schoolController = TextEditingController();

  TextEditingController streetoneController = TextEditingController();

  TextEditingController buildingoneController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColor.whiteA700,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height:60.sp,
                centerTitle: true,
                title: Text( "address"),
                styleType: Style.bgFillWhiteA700),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                     EdgeInsets.only(left: 19.sp, top: 32.sp, right: 19.sp, bottom: 32.sp),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 1.sp, right: 1.sp),
                              padding: EdgeInsets.only(
                                  left: 17.sp, top: 8.sp, right: 17.sp, bottom: 8.sp),
                              decoration: AppDecoration.fillBluegray600
                                  .copyWith(
                                  borderRadius:
                                  BorderRadiusStyle.roundedBorder8),
                              child: Row(children: [
                          Padding(
                              padding: EdgeInsets.only(left: 2.sp, top: 36.sp),
                              child: Text("City",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyles.txtQuicksandSemiBold16)),

                          Padding(
                              padding: EdgeInsets.only(left: 1.sp, top: 22.sp),
                              child: Text("Region",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyles.txtQuicksandSemiBold16)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: schoolController,
                              hintText: "Alexander Language School",
                              margin: EdgeInsets.only(top: 9.sp),
                              fontStyle:
                              TextFormFieldFontStyle.QuicksandSemiBold16),
                          Padding(
                              padding: EdgeInsets.only(left: 1.sp, top: 21.sp),
                              child: Text("street",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyles.txtQuicksandSemiBold16)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: streetoneController,
                              hintText: "Add Your Street",
                              margin: EdgeInsets.only(top: 10.sp)),
                          Padding(
                              padding: EdgeInsets.only(top: 22.sp),
                              child: Text("Building",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyles.txtQuicksandSemiBold16)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: buildingoneController,
                              hintText: "Add Number of Buliding",
                              margin: EdgeInsets.only(top: 9.sp),
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.number),
                        ]
    )
    )
    ]
    ),
    ),
    ),
        ),
    );
  }

}

//todo: local