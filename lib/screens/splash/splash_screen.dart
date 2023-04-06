import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vibration_strong/screens/splash/splash_controller.dart';
import 'package:vibration_strong/utils/lazy_widget.dart';

import '../../core/assets/app_assets.dart';
import '../../core/common/imagehelper.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/textstyles.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return LazyWidget(child: Scaffold(body: Container(
      width: Get.width,
      height: Get.height,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          ImageHelper.loadFromAsset(AppAssets.icWelcome,
              tintColor: Colors.pinkAccent, width: 100.w, height: 100.w),
          AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                'VibratorZen',
                textStyle: TextStyles.title1,
                colors: [
                  AppColors.neutralColor2,
                  Colors.blue,
                  Colors.yellow,
                  Colors.red,
                ],
              ),
            ],
            isRepeatingAnimation: false,
          ),
          const Spacer(
            flex: 2,
          ),
          DefaultTextStyle(
              style: TextStyles.defaultStyle,
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('Copyright by Sonic .Inc'),
                ],
                isRepeatingAnimation: false,
              )),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    ),));
  }
}
