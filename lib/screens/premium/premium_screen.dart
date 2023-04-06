import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:vibration_strong/core/assets/app_assets.dart';
import 'package:vibration_strong/core/common/imagehelper.dart';
import 'package:vibration_strong/core/model/package_model.dart';
import 'package:vibration_strong/core/theme/app_colors.dart';
import 'package:vibration_strong/core/theme/dimens.dart';
import 'package:vibration_strong/core/theme/textstyles.dart';
import 'package:vibration_strong/routes/app_pages.dart';
import 'package:vibration_strong/utils/app_scaffold.dart';
import 'package:vibration_strong/utils/touchable.dart';

import 'premium_controller.dart';

class Premiumscreen extends GetView<PremiumController> {
  const Premiumscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      color: Colors.white,
      body: Stack(
        children: [
          Container(
            width: Dimens.screenWidth,
            height: Dimens.screenHeight,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    colors: [
                  Colors.purple.withOpacity(0.9),
                  Colors.red.withOpacity(0.9),
                ],
                    stops: const [
                  0.0,
                  0.5
                ])),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 16.w, top: Dimens.screenPaddingTop + 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Touchable(
                    onTap: () {
                      controller.restore();
                    },
                    child: Text(
                      'Restore',
                      style: TextStyles.defaultStyle
                          .setColor(Colors.white.withOpacity(1)),
                    ),
                  )),
                  Touchable(
                      onTap: () {
                        if(Get.previousRoute == Routes.HOME || Get.previousRoute == Routes.SETTING){
                          Get.back();
                        }else{
                         Get.offAndToNamed(Routes.HOME);
                        }
                      },
                      child: const Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 120.h),
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    ClipPath(
                      clipper: OvalTopBorderClipper(),
                      clipBehavior: Clip.hardEdge,
                      child: Container(
                        height: 50,
                        color: const Color.fromRGBO(235, 241, 248, 1),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      width: Dimens.screenWidth,
                      color: const Color.fromRGBO(235, 241, 248, 1),
                      child: Column(
                        children: [
                          Text(
                            'Experience VibratorZen\nat full power',
                            textAlign: TextAlign.center,
                            style: TextStyles.defaultStyle.bold
                                .setHeight(1.2)
                                .setTextSize(20.sp)
                                .setColor(Colors.black),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          _item('All power levels and he 15 custom massages'),
                          _item(
                              'Improve your sleep with a relaxing music library to doze off to'),
                          _item(
                              'Access the meditation library for inner peace, boosted brainpower and much more!'),
                          _item('Vibration in Background'),
                          _item('All Ads disabled'),
                          SizedBox(
                            height: 20.h,
                          ),
                          Obx(() => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ...controller.packages.value
                                      .asMap()
                                      .entries
                                      .map((e) => Touchable(
                                          onTap: () {
                                            controller.buy(e.key);
                                          },
                                          child: _itemPackage(e.value)))
                                      .toList()
                                ],
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: kElevationToShadow[3],
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.r),
                                    topRight: Radius.circular(30.r))),
                            child: Column(
                              children: [
                                const Spacer(),
                                Touchable(
                                    onTap: () {
                                      controller.buy(1);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.pinkAccent
                                              .withOpacity(0.9),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.pinkAccent
                                                    .withOpacity(0.5),
                                                offset: const Offset(0, 0),
                                                blurRadius: 5,
                                                spreadRadius: 0)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(50.r)),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15.h),
                                      child: Center(
                                        child: Text(
                                          'Try Free and Subscribe',
                                          style: TextStyles.body2.bold
                                              .setTextSize(16.sp)
                                              .setColor(Colors.white),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  'Premium user has unlimited access to the services. Payment will be charged to Google Account at purchase confirmation.',
                                  textAlign: TextAlign.center,
                                  style: TextStyles.defaultStyle
                                      .setTextSize(10.sp),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Center(
                                      child: Touchable(
                                        onTap: () {
                                          controller.openPrivacy();
                                        },
                                        child: Text(
                                          "Privacy Policy",
                                          style: TextStyles.defaultStyle
                                              .setColor(Colors.black)
                                              .copyWith(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 12.sp),
                                        ),
                                      ),
                                    )),
                                    Expanded(
                                        child: Center(
                                      child: Touchable(
                                          onTap: () {
                                            controller.openTerm();
                                          },
                                          child: Text(
                                            "Terms & Conditions",
                                            style: TextStyles.defaultStyle
                                                .setColor(Colors.black)
                                                .copyWith(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: 12.sp),
                                          )),
                                    ))
                                  ],
                                ),
                                const Spacer(),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ))
                  ],
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: ImageHelper.loadFromAsset(AppAssets.icApp,
                      width: 60.w, height: 60.w),
                ),
              ],
            ),
          )
        ],
      ),
      hideAppBar: true,
      paddingTop: 0,
    );
  }
}

extension on Premiumscreen {
  _item(String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle_rounded,
            color: Colors.pinkAccent,
            size: 15.w,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: Text(
            title,
            style:
                TextStyles.defaultStyle.setColor(Colors.black).setHeight(1.3),
          ))
        ],
      ),
    );
  }

  _itemPackage(PackageModel packageModel) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
              color: packageModel.isSelected == true
                  ? Colors.red.withOpacity(0.8)
                  : Colors.transparent,
              width: packageModel.isSelected == true ? 1 : 0)),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: packageModel.isSelected != true
                    ? const Color.fromRGBO(235, 241, 248, 1)
                    : Colors.redAccent.withOpacity(0.2)),
            child: Center(
              child: Text(
                packageModel.title ?? '',
                textAlign: TextAlign.center,
                style: TextStyles.defaultStyle.setTextSize(10.sp).setColor(
                    packageModel.isSelected == true
                        ? Colors.pink
                        : AppColors.neutralColor2),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            packageModel.unit ?? '',
            style: TextStyles.defaultStyle
                .setColor(Colors.black)
                .setTextSize(12.sp),
          ),
          SizedBox(height: 3.h),
          Text(
            packageModel.price ?? '',
            style: TextStyles.defaultStyle
                .setTextSize(12.sp)
                .semiBold
                .setColor(Colors.black),
          )
        ],
      ),
    );
  }
}
