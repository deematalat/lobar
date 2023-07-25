import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/helper/constant.dart';
import 'package:lobor/home/presentation/pages/previous_screen.dart';
import 'package:lobor/home/presentation/pages/underway_screen.dart';
import '../../../helper/componet/custom_app_bar.dart';
import '../../../helper/text_style.dart';
import '../widgets/navigation_screen.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';

import 'main_screen.dart';


class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);
  static final route="/HistoryScreen";
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int currentIndex = 0;
  late PageController _controller;
  List<NavigationButtonScreens> screens = <NavigationButtonScreens>[
    const NavigationButtonScreens(title: 'Underway', body: UnderwayScreen()),
    const NavigationButtonScreens(title: 'Previous', body: PreviousScreen()),
  ];
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: CustomAppBar(
        height: 60.sp,
        centerTitle: true,
        title: Center(
          child: Text(
           data.history,
            style: TextStyles.txtQuicksandSemiBold18,
          ),
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Column(
                    children: [
                      Text(
                       data.previous,
                        style: currentIndex == 1
                            ? TextStyles.txtQuicksandSemiBold18
                            : TextStyles.txtDINNextLTW23Medium14Gray400,
                      ),
                      Visibility(
                         visible:currentIndex==1,
                          child: Container(
                            width: 10,
                            height: 5,
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius:BorderRadius.circular(5.sp),
                            ),
                          ),
                      ),
                    ],
                  ),
                  onTap: () {
                    _controller.jumpToPage(1);
                  },
                ),
                GestureDetector(
                  child: Column(
                    children: [
                      Text(
                        data.underway,
                        style: currentIndex == 0
                            ? TextStyles.txtQuicksandSemiBold18
                            : TextStyles.txtDINNextLTW23Medium14Gray400,
                      ),
                      Visibility(
                        visible:currentIndex==0,
                        child: Container(
                          width: 10,
                          height: 5,
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius:BorderRadius.circular(5.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    _controller.jumpToPage(0);
                  },
                ),
              ],
            ),
            Expanded(
                child: PageView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: screens.length,
              itemBuilder: (BuildContext context, int index) {
                return screens[currentIndex].body;
              },
            )),
          ],
        ),
      ),
    );
  }
}
