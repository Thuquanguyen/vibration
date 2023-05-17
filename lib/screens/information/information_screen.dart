import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vibration_strong/core/assets/app_assets.dart';
import 'package:vibration_strong/core/common/imagehelper.dart';
import 'package:vibration_strong/core/theme/textstyles.dart';
import 'package:vibration_strong/utils/app_scaffold.dart';

import '../in_app_manage.dart';
import 'information_controller.dart';

class InformationScreen extends GetView<InformationController> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Information',
      titleStyle: TextStyles.title1,
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: ImageHelper.loadFromAsset(AppAssets.icPremium),
              title: const Text(
                "Vibration Strong: Vibrator App",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Email: support.vibrator@gmail.com"),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "     Application Infomation:",
              style: TextStyle(fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: const Text('''Vibrate massager simulated for you!
This applications will helps your phone is will vibrating almost like a massage device handy. It is simulated application.
Enabling applications with the features and select the mode:  - You can customize some interface components.
- Vibrate the phone constantly, constant vibration. 
- Vibrate the phone for a long hnbfhf, long vibrations. 
- Vibrate the phone intermittent vibration rhythm.
- Now you can choose 2 Option. And 8 modes to choose incoming. And more in future. - Can custom time vibration
- The level of vibration depends on the hardware of the phone. 

Note: This application is like a joke on the phone, it is only complementary solution, not a substitute for professional massage equipment. Using applications with long time could affect device hardw

are, as well as the battery life of the device.'''),
            )),
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
          ],
        ),
      ),
    );
  }
}
