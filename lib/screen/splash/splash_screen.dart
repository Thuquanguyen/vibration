import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:vibration_strong/core/assets/app_assets.dart';
import 'package:vibration_strong/core/theme/app_colors.dart';
import 'package:vibration_strong/utils/app_scaffold.dart';
import 'package:get/get.dart';
import 'package:vibration_strong/widget/progress_bar.dart';
import '../../core/common/imagehelper.dart';
import 'splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({Key? key}) : super(key: key);
  bool isCheck = true;

  @override
  Widget build(BuildContext context) {
    if (isCheck) {
      isCheck = false;
      controller.onInitApp();
    }
    return AppScaffold(
      paddingTop: 0,
      color: Color.fromRGBO(245, 245, 245, 1),
      body: Container(
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              ImageHelper.loadFromAsset(
                AppAssets.icSplat,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              Obx(() => Visibility(
                    visible: controller.isShowLoading.value,
                    child: Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 10,
                        child: CustomLinearProgressIndicator(
                          backgroundColor: AppColors.neutralColor6,
                          color: AppColors.customColor9,
                          maxProgressWidth: 100,
                        ),
                      ),
                    ),
                  )),
            ],
          )),
      appBarHeight: 0,
      hideAppBar: true,
      hideBackButton: true,
    );
  }
}
