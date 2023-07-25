import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/helper/constant.dart';
import '../../../helper/componet/custom_app_bar.dart';
import '../../../helper/text_style.dart';
import '../widgets/list_category.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';

import 'main_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static const route = '/CategoriesScreen';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    var data = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: CustomAppBar(
        height: 60.sp,
        centerTitle: true,
        title: Text(
          data.categories,
          style: TextStyles.txtQuicksandSemiBold18,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, MainScreen.route);
              },
              icon: Icon(
                Icons.arrow_forward_outlined,
                color: Colors.black,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Container(
            color: AppColor.gray50,
            child: Column(
              children: [
                ProductSlider(
                  itemCount: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
