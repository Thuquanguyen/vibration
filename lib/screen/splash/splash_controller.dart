import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:vibration_strong/core/base/base_controller.dart';
import 'package:vibration_strong/core/common/app_func.dart';
import 'package:vibration_strong/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibration/vibration.dart';
import '../../admod_handle.dart';
import '../../ads/app_lifecircle_factory.dart';
import '../../ads/open_app_ads_manage.dart';
import '../../constants.dart';
import '../../core/local_storage/localStorageHelper.dart';
import '../../core/model/data_model.dart';
import '../../core/theme/dimens.dart';
import '../../in_app_manage.dart';
import '../../vibrator_manage.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';

class SplashController extends BaseController {
  RxBool isWelcome = false.obs;
  AppOpenAdManager? appOpenAdManager;
  late AnimationController controller;
  late Rx<Animation<double>> animation;
  RxBool isShowLoading = true.obs;

  void onInitApp() async{
    // TODO: implement onInit
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    requestPermission();
    if (Get.context != null) {
      Dimens.init(Get.context!);
    }
    Vibration.vibrate(duration: 1000, amplitude: 255);
    checkDirect();
    super.onInit();
  }

  void checkDirect() async {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    String? data = await SharePreferencesHelper.getString(KEY_PURCHASE);
    bool isLanguage =
        await SharePreferencesHelper.getBool(KEY_LANGUAGE) ?? false;
    isWelcome.value =
        await SharePreferencesHelper.getBool(KEY_WELCOME) ?? false;
    if(data != null){
      DateTime dateTime = dateFormat.parse(data ?? '');
      if (dateTime.isBefore(DateTime.now())) {
        IAPConnection().isAvailable = false;
      } else {
        IAPConnection().updateAvailable();
      }
    }
    AppFunc.setTimeout(() {
      Get.offAndToNamed((!isWelcome.value || !isLanguage)
          ? Routes.LANGUAGE
          : Routes.MAIN);
    }, 3000);
  }

  requestPermission() async {
    PermissionStatus status = await Permission.notification.request();
    print("status = ${status}");
    if (status.isGranted) {
      // notification permission is granted
    } else {
      // Open settings to enable notification permission
    }
  }
}
