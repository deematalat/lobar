

import 'package:flutter/material.dart';
import 'package:lobor/auth/presentation/pages/login_screen.dart';
import 'package:lobor/home/presentation/pages/history_screen.dart';
import 'package:lobor/home/presentation/pages/home_screen.dart';
import '../../Welcome_page/presentation/pages/onboarding1_screen.dart';
import '../../Welcome_page/presentation/pages/onboarding_screen.dart';
import '../../auth/presentation/pages/forget_password_screen.dart';
import '../../auth/presentation/pages/otp_screen.dart';
import '../../auth/presentation/pages/register_screen.dart';
import '../../auth/presentation/pages/reset_password_screen.dart';
import '../../home/presentation/pages/Categories_screen.dart';
import '../../home/presentation/pages/main_screen.dart';
import '../../process/presentation/pages/process_one_screen.dart';
import '../../profile/presentation/pages/address/add_address.dart';
import '../../profile/presentation/pages/address/select_address_screen.dart';
import '../../profile/presentation/pages/conact_us_screen.dart';

class AppRoutes {

  static Map<String, WidgetBuilder> routes = {

    OnBoardingScreen.route: (context) => const OnBoardingScreen(),

    OnBoardingOneScreen.route: (context) =>const OnBoardingOneScreen(),

    LoginScreen.route:(context) =>LoginScreen(),

    RegisterScreen.route:(context) =>RegisterScreen(),

    OtpScreen.route:(context) =>OtpScreen(),

    ForgetPasswordScreen.route:(context) =>ForgetPasswordScreen(),

    ResetPasswordScreen.route:(context)=>ResetPasswordScreen(),

    MainScreen.route:(context)=>MainScreen(),

    HomeScreen.route:(context)=>HomeScreen(),

    CategoriesScreen.route:(context)=>CategoriesScreen(),

    ContactUsScreen.route:(context)=>ContactUsScreen(),

    SelectAddressScreen.route:(context)=>SelectAddressScreen(),

    AddAdressScreen.route:(context)=>AddAdressScreen(),

    ProcessSelector.route:(context)=>ProcessSelector(),

    HistoryScreen.route:(context)=>HistoryScreen()
  };
}