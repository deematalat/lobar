


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/process/presentation/manager/process_controller.dart';
import 'package:lobor/process/presentation/widgets/serviceItem.dart';
import 'package:provider/provider.dart';
import '../../../../empty_state/error_404_screen.dart';
import '../../../../helper/componet/shimmer_card.dart';
import '../../../Welcome_page/presentation/manager/onboarding_provider.dart';



class AllServicesItem extends StatefulWidget {
  const AllServicesItem({Key? key, required this.serviceType}) : super(key: key);
  static const route = "/AllServicesItem";
 final String serviceType;

  @override
  State<AllServicesItem> createState() => _AllServicesItemState();
}

class _AllServicesItemState extends State<AllServicesItem> {
  int _selectedItemIndex = -1;
  @override
  Widget build(BuildContext context) {
    var provide=  Provider.of<OnBoardingProvider>(context);
    var provideProcess=  Provider.of<ProcessController>(context);
    print(widget.serviceType);
    return Padding(
          padding: EdgeInsets.only(left: 23.sp, top: 26.sp, right: 16.sp),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Companies').snapshots(),
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
                    Map<String, dynamic>? dataMap = snapshot.data!.docs[0].data()! as Map<String, dynamic>?;
                    return ShimmerCard();
                  },
                );
              }

              final data = snapshot.data;
              if (data == null || data.docs.isEmpty) {
                return const Center(child: Text("No  Services found."));
              }

              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.docs.length,
                itemBuilder: (context, index) {
                  final bool isSelected = _selectedItemIndex == index;
                  final addressData = data.docs[index].data() as Map<String, dynamic>;
                  return InkWell(
                    borderRadius: const BorderRadius.all(Radius.elliptical(20.0, 20.0)),
                    splashColor: Colors.green,
                    onTap: () {
                      setState(() {
                        _selectedItemIndex = index;
                         provideProcess.setCompanyId(
                             snapshot.data!.docs[index].id
                         );
                      });

                      print(addressData.toString());
                    },
                    child: ProcessSixItemWidget(
                      price:addressData['Services']['price'],
                      title:addressData['title'][provide.getLang()],
                      state:addressData['Services']['state'][provide.getLang()],
                      rate:addressData['rate'],
                      type:addressData['Services']['type'][provide.getLang()],
                      desc:  addressData['desc'][provide.getLang()],
                      period:addressData['Services']['period'],
                      isClicked:isSelected  ,
                    ),
                  );
                },
              );
            },
          ),
        );
  }
}
