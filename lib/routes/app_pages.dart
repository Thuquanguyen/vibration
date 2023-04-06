import 'package:get/get.dart';
import 'package:vibration_strong/screens/home/home_binding.dart';
import 'package:vibration_strong/screens/information/information_binding.dart';
import 'package:vibration_strong/screens/not_vibration/not_vibration_binding.dart';
import 'package:vibration_strong/screens/premium/premium_binding.dart';
import 'package:vibration_strong/screens/premium/premium_screen.dart';
import 'package:vibration_strong/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:vibration_strong/screens/setting/setting_binding.dart';
import 'package:vibration_strong/screens/setting/setting_screen.dart';
import 'package:vibration_strong/screens/term/term_binding.dart';
import 'package:vibration_strong/screens/term/term_screen.dart';
import 'package:vibration_strong/screens/welcome/welcome_binding.dart';
import 'package:vibration_strong/screens/welcome/welcome_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/information/information_screen.dart';
import '../screens/not_vibration/not_vibration_screen.dart';
import '../screens/privacy_policy/privacy_policy_binding.dart';
import '../screens/splash/splash_binding.dart';
import '../screens/splash/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const Homescreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.INFORMATION,
      page: () => InformationScreen(),
      binding: InformationBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => Welcomescreen(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.PREMIUM,
      page: () => const Premiumscreen(),
      binding: PremiumBinding(),
    ),
    GetPage(
      name: _Paths.TERM,
      page: () => const TermScreen(),
      binding: TermBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY,
      page: () => const PrivacyPolicyScreen(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.NOT_VIBRATION,
      page: () => const NotVibrationscreen(),
      binding: NotVibrationBinding(),
    ),
  ];
}
