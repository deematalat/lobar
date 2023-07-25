
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/helper/text_style.dart';


class SelectAddressItemWidget extends StatelessWidget {
  const SelectAddressItemWidget({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 19.sp,
        top: 12.sp,
        right: 19.sp,
        bottom: 12.sp,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height:
              48.sp,
            width:
            49.sp,

            margin: EdgeInsets.only(
              top: 23.sp,
              bottom: 27.sp,
            ),
            child: Padding(
            padding: EdgeInsets.only(
              left: 15.sp,
              top: 4.sp,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "City",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyles.txtQuicksandMedium10Gray300,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 138.sp,
                      ),
                      child: Text(
                        "Street",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyles.txtQuicksandMedium10Gray300,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.sp,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Riyadh",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyles.txtQuicksandSemiBold16,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 116.sp,
                        ),
                        child: Text(
                          "Non",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyles.txtQuicksandSemiBold18,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 12.sp,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "region",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyles.txtQuicksandMedium10Gray300,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 126.sp,
                        ),
                        child: Text(
                          "Building",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyles.txtQuicksandMedium10Gray300,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 1.sp,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width:
                          99.sp,
                        child: Text(
                          "Alexander Language School",
                          maxLines: null,
                          textAlign: TextAlign.left,
                          style: TextStyles.txtQuicksandMedium14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 56.sp,
                          top: 3.sp,
                          bottom: 15.sp,
                        ),
                        child: Text(
                          "2 Floor",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyles.txtQuicksandMedium14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),),
        ],
      ),
    );
  }
}