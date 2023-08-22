import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../core/theme/dimens.dart';
import '../../core/theme/textstyles.dart';
import '../../utils/app_scaffold.dart';
import '../../widget/item_music.dart';
import '../in_app_manage.dart';
import 'sleep_controller.dart';

class SleepScreen extends GetView<SleepController> {
  const SleepScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        paddingTop: 0,
        hideBackButton: true,
        appBarHeight: 0,
        hideAppBar: true,
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: Dimens.topSafeAreaPadding,
              ),
              if (!IAPConnection().isAvailable)
                Obx(() => Visibility(
                  visible: controller.isLoadAds.value,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width:
                      controller.bannerAd.value.size.width.toDouble(),
                      height:
                      controller.bannerAd.value.size.height.toDouble(),
                      child: AdWidget(ad: controller.bannerAd.value),
                    ),
                  ),
                )),
              if (!IAPConnection().isAvailable)
                SizedBox(
                  height: 5.h,
                ),
              Container(
                width: Get.width,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Sleep Music",
                      style: TextStyles.title1
                          .setHeight(0.1)
                          .setColor(Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Sleep music is calm and relaxing music that helps you doze off and sleep effectively.",
                        style: TextStyles.defaultStyle
                            .setTextSize(11)
                            .setColor(Colors.grey)),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Obx(() => MasonryGridView.count(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    itemBuilder: (ctx, index) => ItemMusic(
                      musicModel: controller.listMusics[index],
                      controller: controller,
                      index: index,
                    ),
                    itemCount: controller.listMusics.length,
                    crossAxisCount: 2,
                  ))),
            ],
          ),
        ));
  }
}
