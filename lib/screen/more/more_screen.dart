import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vibration_strong/core/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../admod_handle.dart';
import '../../core/theme/dimens.dart';
import '../../core/theme/textstyles.dart';
import '../../in_app_manage.dart';
import '../../vibrator_manage.dart';
import '../../routes/app_pages.dart';
import '../../utils/app_scaffold.dart';
import '../../widget/item_menu.dart';
import '../../widget/premium_widget.dart';
import 'more_controller.dart';

class MoreScreen extends GetView<MoreController> {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hideBackButton: true,
      appBarHeight: 0,
      hideAppBar: true,
      paddingTop: 0,
      color: AppColors.customColor9,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.h),
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimens.topSafeAreaPadding + 50,
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
                  moreController: controller,
                )),
            Spacer(),
            if (AdmodHandle().ads.isLimit == false)
            Obx(() => Visibility(
              child: Container(
                width: Get.width,
                height: AdmodHandle().bannerAd4!.size.height.toDouble(),
                child: AdWidget(ad: AdmodHandle().bannerAd4!),
              ),
              visible: AdmodHandle().isLoadedBanner4.value,
            )),
            if (AdmodHandle().ads.isLimit == false)
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}