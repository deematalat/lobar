import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/helper/componet/material_btn.dart';
import 'package:lobor/helper/constant.dart';
import '../../../../empty_state/error_404_screen.dart';
import '../../../../helper/app_decoration.dart';
import '../../../../helper/componet/custom_app_bar.dart';
import '../../../../helper/componet/shimmer_card.dart';
import '../../../../helper/text_style.dart';
import '../../widgets/select_address_item.dart';
import 'add_address.dart';

class SelectAddressScreen extends StatelessWidget {
  const SelectAddressScreen({Key? key}) : super(key: key);
  static const route = "/SelectAddressScreen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.gray50,
        appBar: CustomAppBar(
          height: 60.sp,
          leading: IconButton(
            onPressed: () {
              print("clickd!!!");
              Navigator.pushNamed(context, AddAdressScreen.route);
              print("clickd!!!");
            },
            icon: const Icon(
              Icons.add_box_outlined,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Select Address",
            style: TextStyles.txtQuicksandSemiBold18,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_forward_outlined,
                color: Colors.black,
              ),
            ),
          ],
          styleType: Style.bgFillWhiteA700,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 23.sp, top: 26.sp, right: 16.sp),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('addresses').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const ErrorScreen();
              }

              if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5, // Total number of shimmer items
                  itemBuilder: (context, index) {
                    return ShimmerCard();
                  },
                );
              }

              final data = snapshot.data;
              if (data == null || data.docs.isEmpty) {
                return const Center(child: Text("No addresses found."));
              }

              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.docs.length,
                itemBuilder: (context, index) {
                  final addressData = data.docs[index].data() as Map<String, dynamic>;
                  return InkWell(
                    borderRadius: const BorderRadius.all(Radius.elliptical(20.0, 20.0)),
                    splashColor: Colors.white,
                    onTap: () {
                      print(addressData.toString());
                      // Navigate to the details screen or do something else.
                      // You can replace the below line with your navigation logic.
                      // Navigator.pushNamed(context, ProductDetailsScreen.route, arguments: index);
                    },
                    child: const SelectAddressItemWidget(),
                  );
                },
              );
            },
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 116.sp,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 36.sp,
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: AppColor.whiteA700),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.only(left: 19.sp, top: 14.sp, right: 19.sp, bottom: 14.sp),
                  decoration: AppDecoration.fillWhiteA700,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MaterialBtn(btnText: "Select", onpressed: () {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//todo local