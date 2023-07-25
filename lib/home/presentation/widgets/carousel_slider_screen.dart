import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../auth/presentation/widgets/custom_image_view.dart';
import '../../../helper/image_constant.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = AppLocalizations.of(context)!;
    return CarouselSlider(
      options: CarouselOptions(
          height:150.sp,
          viewportFraction:1,
          animateToClosest:true,
          enableInfiniteScroll:true,
          autoPlay:true
      ),
      items: [
       data.slider,
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Stack(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgBG,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 20.sp, horizontal: 20.sp),
                    child: CustomImageView(
                      svgPath: ImageConstant.Whlogo,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 60.sp, horizontal: 20.sp),
                    child: Text(
                      i,
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
