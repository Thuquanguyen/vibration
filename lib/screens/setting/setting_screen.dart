import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vibration_strong/core/theme/textstyles.dart';
import 'package:vibration_strong/utils/app_scaffold.dart';
import 'package:vibration_strong/widget/item_menu.dart';

import '../../widget/premium_widget.dart';
import 'setting_controller.dart';

class SettingScreen extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Settings',
      color: Colors.cyanAccent.withOpacity(0.05),
      titleStyle: TextStyles.title1,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PremiumWidget(),
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
                ))
          ],
        ),
      ),
    );
  }
}
