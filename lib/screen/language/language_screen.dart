import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vibration_strong/ad_manager.dart';
import 'package:vibration_strong/core/theme/app_colors.dart';
import 'package:vibration_strong/core/theme/textstyles.dart';
import 'package:vibration_strong/language/i18n.g.dart';
import 'package:vibration_strong/routes/app_pages.dart';
import 'package:vibration_strong/utils/app_scaffold.dart';
import 'package:vibration_strong/utils/touchable.dart';
import 'package:vibration_strong/widget/item_language.dart';
import 'package:get/get.dart';

import '../../admod_handle.dart';
import '../../core/theme/dimens.dart';
import 'language_controller.dart';

class LanguageScreen extends GetView<LanguageController> {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hideAppBar: true,
      appBarHeight: 0,
      color: AppColors.customColor30,
      hideBackButton: true,
      body: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Container(
              color: AppColors.customColor41,
              padding: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                  top: Dimens.topSafeAreaPadding + 10,
                  bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                    I18n().selectLanguageStr.tr,
                    style: TextStyles.title3.setColor(Colors.white),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Touchable(
                        onTap: () {
                          Get.toNamed(Routes.WELCOME);
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              I18n().doneStr.tr.toUpperCase(),
                              style: TextStyles.headline2
                                  .setColor(Colors.white)
                                  .setHeight(1.2),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Obx(() => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.white, width: 1),
                            left: BorderSide(color: Colors.white, width: 1),
                            right: BorderSide(color: Colors.white, width: 1),
                          )),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemBuilder: (ctx, index) => ItemLanguage(
                          index: index,
                          languageModel: controller.listLanguages.value[index],
                          controller: controller,
                        ),
                        itemCount: controller.listLanguages.length,
                      ),
                    ))),
            const SizedBox(
              height: 10,
            ),
            if ((AdmodHandle().ads.language == 1) &&
                (AdmodHandle().ads.isLimit == false))
              Obx(() => Container(
                    height: 100,
                    width: Get.width,
                    color: Colors.white,
                    child: AdmodHandle().nativeAdIsLoaded.value
                        ? AdWidget(ad: AdmodHandle().nativeAdSmall!)
                        : Center(
                            child: Container(
                              width: 20,
                              height: 20,
                              child: const CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            ),
                          ),
                  )),
            if ((AdmodHandle().ads.language == 2) &&
                (AdmodHandle().ads.isLimit == false))
              Obx(() => Visibility(
                  child: Container(
                    width:
                        AdmodHandle().bannerAdLanguage!.size.width.toDouble(),
                    height:
                        AdmodHandle().bannerAdLanguage!.size.height.toDouble(),
                    child: AdWidget(ad: AdmodHandle().bannerAdLanguage!),
                  ),
                  visible: AdmodHandle().isLoadedBannerLanguage.value)),
            if ((AdmodHandle().ads.language == 3) &&
                (AdmodHandle().ads.isLimit == false))
              Obx(() => Container(
                    height: 350,
                    width: Get.width,
                    color: Colors.white,
                    child: AdmodHandle().nativeAdIsLoaded.value
                        ? AdWidget(ad: AdmodHandle().nativeAd!)
                        : Center(
                            child: Container(
                              width: 20,
                              height: 20,
                              child: const CircularProgressIndicator(
                                color: Colors.black,
                              ),
                            ),
                          ),
                  )),
          ],
        ),
      ),
    );
  }
}
