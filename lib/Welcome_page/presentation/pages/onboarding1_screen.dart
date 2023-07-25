import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/auth/presentation/pages/login_screen.dart';
import 'package:lobor/Welcome_page/presentation/widgets/slider.dart';
import 'package:lobor/helper/constant.dart';
import '../../../helper/text_style.dart';
import '../../data/models/slider_model.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import '../widgets/build_dot.dart';
import '../../../helper/componet/material_btn.dart';

class OnBoardingOneScreen extends StatefulWidget {
  static const route = '/OnBoardingOneScreen';

  const OnBoardingOneScreen({super.key});
  @override
  _OnBoardingOneScreenState createState() => _OnBoardingOneScreenState();
}

class _OnBoardingOneScreenState extends State<OnBoardingOneScreen> {
  List<SliderModel> slides = <SliderModel>[];
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {

    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data = AppLocalizations.of(context)!;
    slides = getSlides(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.bounceIn);
                    },
                    child: Text(
                      currentIndex == slides.length - 1 ? '' : data.skip_btn,
                      style: TextStyles.subStyle,
                    ),
                  )
                ],
              ),
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
                  itemCount: slides.length,
                  itemBuilder: (context, index) {
                    // contents of slider
                    return SliderA(
                      image: slides[index].getImage()!,
                      title: slides[index].getTitle()!,
                      description: slides[index].getDescription()!,
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                slides.length,
                (index) => buildDot(
                    index,
                    context,
                    currentIndex,
                    currentIndex == index
                        ? AppColor.orange_color
                        : AppColor.sub_color),
              ),
            ),
            SizedBox(
              height: 45.sp,
            ),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: MaterialBtn(
                btnText: currentIndex == slides.length - 1
                    ? data.enter
                    : data.next_btn,
                onpressed: () {
                  if (currentIndex == slides.length - 1) {
                    Navigator.pushReplacementNamed(context, LoginScreen.route);
                  }
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
                },
              ),
            ),
            SizedBox(
              height: 45.sp,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
