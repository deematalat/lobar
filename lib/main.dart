import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lobor/helper/constant.dart';
import 'package:lobor/process/presentation/manager/process_controller.dart';
import 'package:lobor/profile/data/repositories/profile_repository.dart';
import 'package:lobor/profile/presentation/manager/profile_controller.dart';
import 'package:provider/provider.dart';
import 'Welcome_page/presentation/manager/onboarding_provider.dart';
import 'Welcome_page/presentation/pages/onboarding_screen.dart';
import 'auth/presentation/manager/auth_controller.dart';
import 'auth/data/repositories/auth_repository.dart';
import 'helper/route/app_routes.dart';
import 'firebase_options.dart';
import 'helper/shared_pref_controller.dart';
import 'home/presentation/pages/main_screen.dart';

AuthRepository authRepository = AuthRepository();
ProfileRepository profileRepository = ProfileRepository();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPerf().initPref().then((value) {
    runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => OnBoardingProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => AuthController(authRepository),
      ),
      ChangeNotifierProvider(
        create: (_) => ProfileController(profileRepository),
      ),
      ChangeNotifierProvider(
        create: (_) => ProcessController(),
      )
    ], child: const MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provide = Provider.of<OnBoardingProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ChangeNotifierProvider<AuthController>(
          create: (context) => AuthController(AuthRepository()),
          builder: (context, _) {
            return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(provide.getLang()),
              debugShowCheckedModeBanner: false,
              initialRoute: context.watch<AuthController>().getCurrentLogin()
                  ? MainScreen.route
                  : OnBoardingScreen.route,
              routes: AppRoutes.routes,
              theme: ThemeData(primarySwatch: Colors.green),
            );
          },
        );
      },
    );
  }
}
