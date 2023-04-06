import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration_strong/core/common/app_func.dart';
import 'package:vibration_strong/core/common/app_utils.dart';
import 'package:vibration_strong/core/service/notification_service.dart';
import 'package:vibration_strong/routes/app_pages.dart';

import '../../core/base/base_controller.dart';
import '../../core/theme/dimens.dart';

class SplashController extends BaseController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    requestPermission();
    if (Get.context != null) {
      Dimens.init(Get.context!);
    }
    Vibration.vibrate(duration: 1000, amplitude: 255);
    AppFunc.setTimeout((){
      Get.offAndToNamed(Routes.HOME);
    }, 3000);

  }

  requestPermission()async{
    PermissionStatus status = await Permission.notification.request();
    print("status = ${status}");
    if (status.isGranted) {
      // notification permission is granted
    }
    else {
      // Open settings to enable notification permission
    }
  }
}
