import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/helper/text_style.dart';
import '../../../auth/presentation/widgets/custom_image_view.dart';

import '../../../helper/image_constant.dart';

class ProcessSixItemWidget extends StatelessWidget {
  const ProcessSixItemWidget(
      {Key? key,
      required this.price,
      required this.title,
      required this.state,
      required this.rate,
      required this.type,
      required this.desc,
      required this.period,
      required this.isClicked})
      : super(
          key: key,
        );
  final int price;
  final String title;
  final String state;
  final double rate;
  final String type;
  final String desc;
  final String period;
  final bool isClicked;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(20.0, 20.0)),
    border: Border.all(
    color: isClicked ? Colors.green : Colors.transparent,
    width: isClicked ? 2.0 : 0.0,
    ),
    ),child: Card(
        child: Padding(
          padding:  EdgeInsets.all(8.sp),
          child: Column(
      children: [
          Row(
            children: [
              CustomImageView(
                svgPath: ImageConstant.imglogo,
              ),
              SizedBox(
                width: 16.sp,
              ),
              Text(
                title,
                style: TextStyles.txtQuicksandSemiBold18,
              ),
            ],
          ),
          Row(
            children: [
              RatingBar.builder(
                itemSize:20,
                initialRating: rate,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(width:70.sp,),
              SizedBox(
                child:Column(
                  children: [
                    Text('السعر',style: TextStyles.txtQuicksandSemiBold18,),
                    Text('price $price',style: TextStyles.txtQuicksandMedium16,),
                  ],
                ),
              ),
            ],
          ),
          Text(desc,style:TextStyles.supStyle,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text(type,style: TextStyles.txtQuicksandMedium14,),
                  SizedBox(width:16.sp ,),
                  CustomImageView(
                    svgPath:ImageConstant.edit,
                  ),
                ],
              ),

              Row(
                children: [
                  Text(period,style: TextStyles.txtQuicksandMedium14,),
                  SizedBox(width:16.sp ,),
                  CustomImageView(
                    svgPath:ImageConstant.clock,
                  ),
                ],
              ),

              Row(
                children: [
                  Text(state,style: TextStyles.txtQuicksandMedium14,),
                  SizedBox(width:16.sp ,),
                  CustomImageView(
                    svgPath:ImageConstant.flag,
                  ),
                ],
              ),
            ],
          )
      ],
    ),
        )

    ),);
  }
}
