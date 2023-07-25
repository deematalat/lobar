
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Welcome_page/presentation/manager/onboarding_provider.dart';
import '../../../empty_state/error_404_screen.dart';
import '../../../helper/componet/shimmer_card.dart';
import '../../../process/presentation/pages/process_one_screen.dart';
import 'category_item.dart';

List items=[
  'car wash',
  'hourly cleaning',
  'contract cleaning',
  'conditioning',
  'electrical',
  'plumbing'
];

class  ProductSlider extends StatelessWidget {
  const ProductSlider({Key? key,
    required this.itemCount,
  }) : super(key: key);
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    var provide=  Provider.of<OnBoardingProvider>(context);
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Categories').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio:200/240
            ),
            itemCount:itemCount, // Total number of items in the grid
            itemBuilder: (context, index) {
              return ShimmerCard();
            },
          );
        }
        return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio:200/240
              ),
              itemCount:itemCount, // Total number of items in the grid
              itemBuilder: (context, index) {
                Map<String, dynamic>? dataMap = snapshot.data!.docs[0].data() as Map<String, dynamic>?;
                return
                  InkWell(
                    borderRadius: const BorderRadius.all(Radius.elliptical(20.0, 20.0)),
                    splashColor: Colors.white,
                    onTap: () {
                      print(snapshot.data!.docs[0].data()!.toString());
 Navigator.pushNamed(context, ProcessSelector.route,arguments:{
   'index':index,
   'title': dataMap! [items[index]]['title'][provide.getLang()],
   'image':dataMap! [items[index]]['image'],
 });
                    },child:
               Hero(tag: index,
               child:CategoryItem(
                  productName: dataMap! [items[index]]['title'][provide.getLang()],
                  productImage:dataMap! [items[index]]['image'],
                )),);
              },
            );

      },
    );
  }
}
















