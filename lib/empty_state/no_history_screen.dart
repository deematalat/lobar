

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/auth/presentation/widgets/custom_image_view.dart';
import '../helper/constant.dart';
import '../helper/image_constant.dart';

class NoHistoryScreen extends StatelessWidget {
  const NoHistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.gray50,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomImageView(
          svgPath:ImageConstant.noHistory,
        ),
        Text("No History !"),
        Container(
          width: 50.sp,
          height: 5.sp,
          decoration: BoxDecoration(
            color: AppColor.lime200,
            borderRadius:BorderRadius.circular(5.sp),
          ),
        ),
      ],
    ), );
  }
}
