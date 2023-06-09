import 'package:audio_wave/audio_wave.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration_strong/core/assets/app_assets.dart';
import 'package:vibration_strong/core/common/app_func.dart';
import 'package:vibration_strong/core/theme/dimens.dart';
import 'package:vibration_strong/core/theme/textstyles.dart';
import 'package:vibration_strong/routes/app_pages.dart';
import 'package:vibration_strong/utils/app_scaffold.dart';
import 'package:vibration_strong/utils/touchable.dart';
import 'package:filling_slider/filling_slider.dart';
import '../../core/common/imagehelper.dart';
import '../../widget/item_vibration.dart';
import 'home_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class Homescreen extends GetView<HomeController> {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hideBackButton: true,
      appBarHeight: 0,
      hideAppBar: true,
      paddingTop: 0,
      body: ExpandableBottomSheet(
        key: key,
        animationDurationExtend: const Duration(milliseconds: 500),
        animationDurationContract: const Duration(milliseconds: 250),
        animationCurveExpand: Curves.bounceOut,
        animationCurveContract: Curves.ease,
        persistentContentHeight: 160,
        background: Stack(
          children: [
            ImageHelper.loadFromAsset(AppAssets.imgBacground,
                width: Dimens.screenWidth,
                height: Dimens.screenHeight,
                fit: BoxFit.cover),
            Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w),
                  child: Row(
                    children: [
                      Touchable(
                          onTap: () {
                            Get.toNamed(Routes.INFORMATION);
                          },
                          child: const Icon(
                            Icons.info_outline,
                            color: Colors.amberAccent,
                          )),
                      const Spacer(),
                      Touchable(
                          onTap: () {
                            Get.toNamed(Routes.SETTING);
                          },
                          child: const Icon(
                            Icons.settings,
                            color: Colors.amberAccent,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                AudioWave(
                  height: 32,
                  width: 88,
                  spacing: 2.5,
                  bars: [
                    AudioWaveBar(heightFactor: 0.6, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.4, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.3, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.2, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.6, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.6, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.3, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.6, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.9, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 1, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.24, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.54, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.89, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.4, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.36, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.17, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.5, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.33, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 1, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.6, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.4, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.3, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.2, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.6, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.6, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.3, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.6, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.9, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 1, color: Colors.amberAccent),
                    AudioWaveBar(heightFactor: 0.24, color: Colors.amberAccent)
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Obx(() => FillingSlider(
                        initialValue: controller.initValue.value,
                        width: 100,
                        height: 250,
                        onChange: (a, b) {
                          controller.progress.value = a;
                          if (a >= 0.5) {
                            controller.initValue.value = 0.2;
                            Get.toNamed(Routes.PREMIUM);
                          }
                          print("aaaaa = $a");
                        },
                        color: Colors.white,
                        fillColor: Colors.purple,
                        child: SizedBox(
                          width: 100,
                          height: 220,
                          child: Column(
                            children: [
                              ImageHelper.loadFromAsset(AppAssets.icPremium,
                                  width: 12.w, height: 12.w),
                              Text("High",
                                  style: TextStyles.label2.copyWith(
                                      fontFamily: GoogleFonts.aleo().fontFamily,
                                      color: controller.progress.value >= 0.8
                                          ? Colors.white
                                          : Colors.black)),
                              const Spacer(),
                              ImageHelper.loadFromAsset(AppAssets.icPremium,
                                  width: 12.w, height: 12.w),
                              Text(
                                "Medium",
                                style: TextStyles.label2.copyWith(
                                    fontFamily: GoogleFonts.aleo().fontFamily,
                                    color: controller.progress.value >= 0.5
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              const Spacer(),
                              Text(
                                "Low",
                                style: TextStyles.label2.copyWith(
                                    fontFamily: GoogleFonts.aleo().fontFamily,
                                    color: controller.progress.value >= 0.08
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ],
                          ),
                        ))),
                    SizedBox(
                      width: 10.w,
                    ),
                  ],
                ),
                Touchable(
                    onTap: () {
                      Vibration.cancel();
                    },
                    child: Container(
                      margin:
                          EdgeInsets.only(top: 20.h, left: 50.w, right: 50.w),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xffA22447).withOpacity(.25),
                                offset: const Offset(0, 0),
                                blurRadius: 20,
                                spreadRadius: 3)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r)),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      child: Center(
                        child: Text(
                          "STOP VIBRATION",
                          style: TextStyles.body1,
                        ),
                      ),
                    ))
              ],
            ),
          ],
        ),
        persistentHeader: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.r),
                topLeft: Radius.circular(16.r)),
          ),
          height: 50.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Vibration Patterns',
                      style: TextStyles.body3
                          .setTextSize(12.sp)
                          .setColor(Colors.black)
                          .semiBold,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Please choose vibration patterns below',
                      style: TextStyles.defaultStyle.setTextSize(10.sp),
                    )
                  ],
                ),
              ),
              Touchable(
                  onTap: () {
                    Get.toNamed(Routes.PREMIUM);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.cyanAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.lightBlueAccent.withOpacity(0.5),
                        width: 0.5,
                      ),
                    ),
                    width: 25.w,
                    height: 25.w,
                    child: Center(
                      child: ImageHelper.loadFromAsset(AppAssets.icPremium,
                          width: 12.w, height: 12.w),
                    ),
                  ))
            ],
          ),
        ),
        expandableContent: Container(
          constraints: BoxConstraints(maxHeight: Dimens.screenHeight * 0.32),
          color: Colors.white,
          width: Dimens.screenWidth,
          child: GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5),
            itemBuilder: (_, index) => ItemVibration(
              vibrationModel: controller.vibrations[index],
            ),
            itemCount: controller.vibrations.length,
          ),
        ),
        enableToggle: false,
      ),
    );
  }
}
