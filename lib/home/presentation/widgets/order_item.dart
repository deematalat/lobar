
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lobor/helper/text_style.dart';

import '../../../helper/constant.dart';

class OrderItem extends StatelessWidget {
  final String type;
  final String status;
  final String companyName;
  final Timestamp date;
  const OrderItem({super.key, required this.type, required this.status, required this.companyName,required this.date});
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('MMMM dd, yyyy').format(date.toDate());
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: 388.sp,
            height: 200.sp,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x0C000000),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child:Column(
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
                    Text(type,style:TextStyles.title,),
                  TextButton(onPressed: (){}, child:Container(
                    decoration:BoxDecoration(
                        color:AppColor.green400,
                      borderRadius:BorderRadius.circular(25.sp)
                    ),
                    width:90.sp,
                    height:50.sp,

                      child: Center(child:Text(status,style:TextStyle(
                        color:Colors.white
                      ),),),
                  ),
                  ),
                ],),
                Divider(),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
                  Text(companyName,style:TextStyles.txtQuicksandSemiBold18,),
                  Text(formattedDate,style:TextStyles.subStyle,),
                ],),
                Divider(),
                ListTile(
                  leading:Text("اكمال عملية الدفع الان",style:TextStyle(
                    color:AppColor.green400
                  ),),
                  trailing:IconButton(
                    onPressed: () {  },
                    icon: Icon(Icons.arrow_forward_outlined,color:AppColor.green400,),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}