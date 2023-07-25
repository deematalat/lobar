


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/helper/text_style.dart';

class SliderA extends StatelessWidget {
  String image,title,description;
  SliderA({required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(image)),
          SizedBox(height: 20),
          Text(title, style: TextStyles.title,),
          SizedBox(height: 12),
          Padding(padding: EdgeInsets.all(20.w),
          child:Text(description),),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
