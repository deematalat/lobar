

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/helper/constant.dart';
import 'package:lobor/home/presentation/pages/main_screen.dart';
import 'package:provider/provider.dart';
import '../../../auth/presentation/manager/auth_controller.dart';
import '../../../helper/componet/custom_app_bar.dart';
import '../../../helper/image_constant.dart';
import '../../../helper/text_style.dart';
import '../../../profile/presentation/pages/address/select_address_screen.dart';
import '../../../profile/presentation/pages/conact_us_screen.dart';
import '../../../profile/presentation/widgets/dropdown_select_lang.dart';
import '../widgets/profile_card.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';

class ProfileScreen extends StatelessWidget {
  static const  route='/ProfileScreen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = AppLocalizations.of(context)!;
    var provide=  Provider.of<AuthController>(context);
    return Scaffold(
        appBar: CustomAppBar(
          height: 60.sp,
          centerTitle: true,
          title: Center(
            child: Text(
             data.profile,
              style: TextStyles.txtQuicksandSemiBold18,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, MainScreen.route);
                },
                icon: const Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.black,
                )),
          ],
        ),
        body: SafeArea(child:
      SingleChildScrollView(
        child:Container(
          color: AppColor.gray50,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.all(40) ,
              child: Column(
                children: [
                  Card(elevation:3,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child:SizedBox(
                      height: 200,
                      width:double.infinity,
                      child:Column(
                          children: <Widget>[
                            Container(
                              height: 80,
                                    width: 80,
                                    child: Image.
                                  network("https://engineering.unl.edu/images/staff/Kayla-Person.jpg",
                                    fit:BoxFit.cover,),
                                ),
                           Text("name",style:TextStyles.txtQuicksandSemiBold18,),
                            Text("email",style:TextStyles.txtQuicksandSemiBold18,),
                          ]
                      ),
                    ),
                  ),
                  ProfileCard( title:data.payment,
                    widget: IconButton(
                        onPressed:(){},
                        icon:Icon(Icons.navigate_next,size:30,)
                    ),
                    desc:data.payment_desc,
                    path: ImageConstant.payment,),
                  ProfileCard( title:data.location, desc:data.location_desc,
                    path: ImageConstant.imgLocation,
                    widget: IconButton(
                        onPressed:(){
                          Navigator.pushNamed(context,SelectAddressScreen.route);
                        },
                        icon:Icon(Icons.navigate_next,size:30,)
                    ),
                    ),
                  ProfileCard( title:data.notfication,
                      widget: IconButton(
                      onPressed:(){},
                      icon:Icon(Icons.navigate_next,size:30,)
                  ), desc:data.notfication_desc, path: ImageConstant.imgBill,),
                  ProfileCard( title:data.select_lang, desc: '', path:ImageConstant.language,
                    widget:DropDawnSelect()
                    ,),
                  ProfileCard( title:data.pocket,widget:IconButton(
                      onPressed:(){},
                      icon:Icon(Icons.navigate_next,size:30,)
                  ), desc:data.pocket_desc, path: ImageConstant.pocket,),
                  ProfileCard(
                    title:data.conact_us,
                    widget: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context,ContactUsScreen.route);
                        },
                        icon:Icon(Icons.navigate_next,size:30,)
                    ),
                    desc:data.conact_description,
                    path: ImageConstant.imgCall,),
                  ProfileCard( title:data.logout,
                    widget:IconButton(
                        onPressed:() async {
                          await  provide.signOut();
                        },
                        icon:Icon(Icons.navigate_next,size:30,)
                    ), desc:'', path: ImageConstant.logout,),

                ],
              ),)
          ],
        ),),),
      )
    );
  }

}

// todo: user info
