

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lobor/helper/constant.dart';
import 'package:lobor/home/presentation/pages/Categories_screen.dart';
import '../../../auth/presentation/widgets/custom_image_view.dart';
import '../../../helper/componet/geoloctor.dart';
import '../../../helper/image_constant.dart';
import '../../../helper/text_style.dart';
import '../widgets/carousel_slider_screen.dart';
import '../widgets/list_category.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';

class HomeScreen extends StatefulWidget  {

   static final route="/HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String locationName = 'Getting location...';
  @override
  void initState() {
    getLocationAndName();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var data = AppLocalizations.of(context)!;
    return Scaffold(
      appBar:AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading:Padding(
          padding: EdgeInsets.all(15.sp),
          child: CustomImageView(
          svgPath: ImageConstant.imgBill,
        ),),
        title:Center(
          child:
          CustomImageView(
          svgPath: ImageConstant.imglogo,
        ),
      ),),
      body: SingleChildScrollView(
        child: Padding(
          padding:   EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.sp,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: data.good_morning, style:TextStyles.txtQuicksandSemiBold20 ),
                        TextSpan(text: ' الخير',style:TextStyles.subStyle),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.sp,),
              Text(data.home_description,style: TextStyles.txtQuicksandBold28,),
              SizedBox(height: 20.sp,),
              Card(
                child:Row(
                  children: [
                    Padding(padding: EdgeInsets.all(10.sp),
                   child: CircleAvatar(
                      backgroundColor:Colors.white,
                      child:Icon(Icons.location_on_rounded,color: AppColor.lime200,),
                      radius: 30.sp,
                    ),),
                   Column(children: [
                     Text(data.location,style: TextStyles.supStyle,),
                     Text(locationName),
                   ],)
                  ],
                ),
                color:AppColor.darkGree ,
              ),
              SizedBox(height: 40.sp,),
              CustomCarouselSlider(),
              ListTile(
                leading: Text(data.service,style: TextStyles.title,),
                trailing: TextButton(onPressed: () {
                  Navigator.pushNamed(context,CategoriesScreen.route);
                }, child:Text(data.service_btn,
                  style:TextStyle(
                    color: AppColor.primary
                  ) ,),) ,
              ),
              ProductSlider(itemCount:4,),
            ],
          ),
        ),
      ) ,
      backgroundColor: AppColor.gray50,
    );
  }

  Future<void> getLocationAndName() async {
    Position? position = await UserLocation().getCurrentLocation();
    if (position != null) {
      String name = await UserLocation().getLocationName(position);
      if (mounted) {
        setState(() {
          locationName = name;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          locationName = 'Failed to get location';
        });
      }
    }
  }

}
// todo:user name