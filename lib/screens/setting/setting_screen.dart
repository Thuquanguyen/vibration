import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vibration_strong/core/theme/textstyles.dart';
import 'package:vibration_strong/utils/app_scaffold.dart';
import 'package:vibration_strong/widget/item_menu.dart';

import '../../core/theme/dimens.dart';
import '../../widget/premium_widget.dart';
import '../in_app_manage.dart';
import 'setting_controller.dart';

class SettingScreen extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      color: Colors.cyanAccent.withOpacity(0.05),
      hideBackButton: true,
      appBarHeight: 0,
      hideAppBar: true,
      paddingTop: 0,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!IAPConnection().isAvailable)
              SizedBox(
                height: Dimens.topSafeAreaPadding + 10,
              ),
            if (!IAPConnection().isAvailable)
              Obx(() => Visibility(
                visible: controller.isLoadAds.value,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: controller.bannerAd.value.size.width.toDouble(),
                    height:
                    controller.bannerAd.value.size.height.toDouble(),
                    child: AdWidget(ad: controller.bannerAd.value),
                  ),
                ),
              )),
            SizedBox(
              height: Dimens.topSafeAreaPadding + 10,
            ),
            if (!IAPConnection().isAvailable) const PremiumWidget(),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Menu',
              style: TextStyles.body1.semiBold,
            ),
            SizedBox(
              height: 10.h,
            ),
            ...controller.vibrations.map((e) => ItemMenu(
                  vibrationModel: e,
              settingController: controller,
                )),
          ],
        ),
      ),
    );
  }
}
