import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key,
        required this.productImage,
        required this.productName,

      })
      : super(key: key);
  final String productImage;
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: SizedBox(
          child: Column(
            children: <Widget>[
              Container(
                width:100,
                height:140,
                child: SvgPicture.network(
                 "https://firebasestorage.googleapis.com/v0/b/labor-7bc4f.appspot.com/o/$productImage?alt=media&token=6fb1e068-1d2d-41ac-be98-5876c84110b8" , // Set the height as desired
                )
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height:10,),
                  Center(
                    child: Text(
                      productName,
                      maxLines:1,
                      textAlign:TextAlign.end,
                      overflow:TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Raleway'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
