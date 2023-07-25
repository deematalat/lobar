import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/helper/constant.dart';

class AppDecoration {
  static BoxDecoration get outlineGray300 => BoxDecoration(
    color: AppColor.gray50,
    border: Border.all(
      color: AppColor.gray300,
      width: 1.sp,

    ),
  );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
    color: AppColor.whiteA700,
  );

  static BoxDecoration get outlineGreen400 => BoxDecoration(
    color: AppColor.gray50,
    border: Border.all(
      color: AppColor.green400,
      width: 1.sp,
    ),
  );
  static BoxDecoration get outlineBlack9000c => BoxDecoration(
    color:  AppColor.gray50,
    boxShadow: [
      BoxShadow(
        color: AppColor.black900,
        spreadRadius:
          2.sp,

        blurRadius:
          2.sp,

        offset: Offset(
          0,
          4,
        ),
      ),
    ],
  );
  static BoxDecoration get fillBluegray600 => BoxDecoration(
    color:  AppColor.blueGray100,
  );


}
class BorderRadiusStyle {
  static BorderRadius roundedBorder8 = BorderRadius.circular(
    8.sp,
  );
}



double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

