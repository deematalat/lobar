
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/auth/presentation/widgets/custom_image_view.dart';
import 'package:lobor/helper/text_style.dart';


class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.title,
    required this.widget,
    required this.desc,
    required this.path,
  });
  final Widget widget;
  final String title;
  final String desc;
  final String path;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          top:3,
        ),
        child:Card(elevation:2,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Container(
              height: 70.sp,
              width:double.infinity,
              child: Padding(
                padding:EdgeInsets.symmetric(
                    horizontal:20
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomImageView(
                      svgPath:path,
                    ),
                    Padding(padding:EdgeInsets.all(2.sp),
                    child:Column(
                      children: [
                      Text(title,style:TextStyles.txtQuicksandSemiBold18,),
                      Text(desc,style:TextStyles.txtQuicksandMedium14,maxLines:1,),
                    ],),),
                   widget,

                  ],
                ),),
            ),
          )
    );
  }

}