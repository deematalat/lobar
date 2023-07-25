
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Welcome_page/presentation/manager/onboarding_provider.dart';
import '../../../empty_state/no_history_screen.dart';
import '../../../helper/componet/shimmer_card.dart';
import '../widgets/order_item.dart';

class UnderwayScreen extends StatelessWidget {
  static final route = "/UnderwayScreen";

  const UnderwayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provide=  Provider.of<OnBoardingProvider>(context);
    return Padding(
      padding: EdgeInsets.only(left: 23.sp, top: 26.sp, right: 16.sp),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('orders')
            .where('status', whereIn: ['Done', 'Cancel'])
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const NoHistoryScreen();
          }

          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5, // Total number of shimmer items
              itemBuilder: (context, index) {
                Map<String, dynamic>? dataMap =
                snapshot.data?.docs[index].data() as Map<String, dynamic>?;
                return ShimmerCard();
              },
            );
          }

          final data = snapshot.data;
          if (data == null || data.docs.isEmpty) {
            return NoHistoryScreen();
          }

          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.docs.length,
            itemBuilder: (context, index) {
              final orderData = data.docs[index].data() as Map<String, dynamic>;
              DocumentReference serviceRef =
              orderData['serviceReference'] as DocumentReference;

              return FutureBuilder<DocumentSnapshot>(
                future: serviceRef.get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData) {
                    return ShimmerCard();
                  }

                  // Data from the referenced document
                  final serviceData = snapshot.data!.data() as Map<String, dynamic>;

                  return InkWell(
                    borderRadius:
                    const BorderRadius.all(Radius.elliptical(20.0, 20.0)),
                    splashColor: Colors.green,
                    onTap: () {
                      print(orderData.toString());
                    },
                    child: OrderItem(
                      type:serviceData['Services']['type'][provide.getLang()],
                      status: orderData['status'],
                      companyName:serviceData['title'][provide.getLang()], // Add your code to fetch the company name if needed
                      date:orderData['startDate'] , // Add your code to fetch the date if needed
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
