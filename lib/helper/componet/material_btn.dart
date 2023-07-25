
import 'package:flutter/material.dart';
import '../constant.dart';
import '../text_style.dart';

class MaterialBtn extends StatelessWidget {
  const MaterialBtn({Key? key,required this.btnText, required this.onpressed}) : super(key: key);
   final String btnText;
   final Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return  Material(
      color:AppColor.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.white), // Add the side property for the border
      ),
      child:MaterialButton(
        onPressed: onpressed,
          disabledColor:AppColor.disable_color,
          textColor:Colors.white,
        minWidth: double.infinity,
        child: Text(btnText,style:TextStyles.buttonStyle),
      ),
    );
  }
}
