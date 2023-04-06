import 'package:get/get.dart';
import 'package:vibration_strong/screens/splash/splash_controller.dart';



class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(),fenix: true);
  }
}
