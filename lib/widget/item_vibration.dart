import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration_strong/core/assets/app_assets.dart';
import 'package:vibration_strong/core/theme/textstyles.dart';
import 'package:vibration_strong/screens/home/home_controller.dart';
import 'package:vibration_strong/utils/touchable.dart';

import '../core/common/app_func.dart';
import '../core/common/imagehelper.dart';
import '../core/model/vibration_model.dart';
import '../routes/app_pages.dart';
import '../screens/in_app_manage.dart';

class ItemVibration extends StatelessWidget {
  ItemVibration({Key? key, this.vibrationModel, this.controller, this.index})
      : super(key: key);
  VibrationModel? vibrationModel;
  HomeController? controller;
  int? index;

  @override
  Widget build(BuildContext context) {
    return Touchable(
      onTap: () {
        if (!IAPConnection().isAvailable && vibrationModel?.isPremium == true) {
          Vibration.cancel();
          AppFunc.showAlertDialogConfirm(context,
              message: 'Would you like to try this vibration once?',
              callBack: () {
                Get.toNamed(Routes.PREMIUM);
              },
              cancelCallback: () {
                controller?.rewardedAd?.show(onUserEarnedReward: (a,b){
                  vibrationModel?.onTap?.call();
                });
              });
        } else {
          if ((index ?? 0) > 4 && (index ?? 0) < 10 && !IAPConnection().isAvailable){
            controller?.interstitialAd?.show();
            controller?.changeSelected(index ?? 0);
            Vibration.cancel();
            vibrationModel?.onTap?.call();
          } else {
            controller?.changeSelected(index ?? 0);
            Vibration.cancel();
            vibrationModel?.onTap?.call();
          }
        }
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
                      color: vibrationModel?.isSelected == true
                          ? Colors.pinkAccent
                          : Colors.cyanAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: Colors.lightBlueAccent.withOpacity(0.5),
                        width: 0.5,
                      ),
                    ),
                    child: Center(
                      child: ImageHelper.loadFromAsset(
                          vibrationModel?.icon ?? AppAssets.icPremium,
                          tintColor: vibrationModel?.isSelected == true
                              ? Colors.white
                              : Colors.lightBlueAccent,
                          width: 18.w,
                          height: 18.w),
                    ),
                  ),
                  if (!IAPConnection().isAvailable &&
                      vibrationModel?.isPremium == true)
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
