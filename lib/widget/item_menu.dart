import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibration_strong/core/assets/app_assets.dart';
import 'package:vibration_strong/core/common/imagehelper.dart';
import 'package:vibration_strong/core/model/vibration_model.dart';
import 'package:vibration_strong/core/theme/textstyles.dart';
import 'package:vibration_strong/screens/setting/setting_controller.dart';
import 'package:vibration_strong/utils/touchable.dart';

import '../screens/in_app_manage.dart';

class ItemMenu extends StatelessWidget {
  ItemMenu({Key? key, this.vibrationModel,this.settingController}) : super(key: key);
  VibrationModel? vibrationModel;
  SettingController? settingController;

  @override
  Widget build(BuildContext context) {
    return Touchable(
      onTap: () {
        if (vibrationModel?.title == 'Not Vibrating?' && !IAPConnection().isAvailable) {
          settingController?.handleReward();
        } else {
          vibrationModel?.onTap?.call();
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
        margin: EdgeInsets.symmetric(vertical: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.pinkAccent.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16.r)),
              padding: EdgeInsets.all(6.w),
              child: Center(
                child: Icon(
                  vibrationModel?.iconData ?? Icons.info_outline,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
                child: Text(
              vibrationModel?.title ?? '',
              style: TextStyles.defaultStyle,
            )),
            const Icon(
              Icons.navigate_next,
              color: Colors.black26,
            )
          ],
        ),
      ),
    );
  }
}
