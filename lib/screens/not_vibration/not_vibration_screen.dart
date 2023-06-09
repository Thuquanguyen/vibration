import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vibration_strong/utils/app_scaffold.dart';

import 'not_vibration_controller.dart';

class NotVibrationscreen extends GetView<NotVibrationController> {
  const NotVibrationscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        color: Colors.white,
        title: 'Not Vibration?',
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: const Text(
                'Please don`t worry, here are some helpful methods for you:'
                '\n1. Go to Settings>Sound and vibration(Sound/Volume), check Vibration is turned on or off;'
                '\n\n2. Reboot your phone, then check again;'
                '\n\n3. If it happens only to some app, we recommend you remove it, then install it again;'
                '\n\n4. Update your phone to the latest version;'
                '\n\n5. Enter Settings>More settings>Backup & reset>Restore(Reset) all settings. Don`t worry, no data or media will be deleted.'
                '\n\nIf above measures are not effective, please seek help from our service center.'),
          ),
        ));
  }
}
