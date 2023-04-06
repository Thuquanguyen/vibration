import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration_strong/core/assets/app_assets.dart';
import 'package:vibration_strong/core/theme/textstyles.dart';
import 'package:vibration_strong/utils/touchable.dart';

import '../core/common/imagehelper.dart';
import '../core/model/vibration_model.dart';
import '../routes/app_pages.dart';

class ItemVibration extends StatelessWidget {
  ItemVibration({Key? key, this.vibrationModel}) : super(key: key);
  VibrationModel? vibrationModel;

  @override
  Widget build(BuildContext context) {
    return Touchable(
      onTap: () {
        // if (vibrationModel?.isPremium == true) {
        //   Vibration.cancel();
        //   // Get.toNamed(Routes.PREMIUM);
        // } else {
        //   // vibrationModel?.onTap?.call();
        // }
        Vibration.cancel();
        vibrationModel?.onTap?.call();
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(
              width: 50.w,
              height: 50.w,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.cyanAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: Colors.lightBlueAccent.withOpacity(0.5),
                        width: 0.5,
                      ),
                    ),
                    child: Center(
                      child: ImageHelper.loadFromAsset(
                          vibrationModel?.icon ?? AppAssets.icPremium,
                          tintColor: Colors.lightBlueAccent,
                          width: 14.w,
                          height: 14.w),
                    ),
                  ),
                  if (vibrationModel?.isPremium == true)
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 16.w,
                        height: 16.w,
                        decoration: BoxDecoration(
                            color: Colors.pinkAccent.withOpacity(0.3),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.r),
                                bottomLeft: Radius.circular(6.r))),
                        child: Center(
                          child: ImageHelper.loadFromAsset(AppAssets.icPremium,
                              width: 10.w, height: 10.w),
                        ),
                      ),
                    )
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              vibrationModel?.title ?? 'Sunny',
              style: TextStyles.defaultStyle.setTextSize(10.sp),
            )
          ],
        ),
      ),
    );
  }
}
