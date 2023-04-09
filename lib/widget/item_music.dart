import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:vibration_strong/core/theme/textstyles.dart';
import 'package:vibration_strong/routes/app_pages.dart';
import 'package:vibration_strong/screens/audio_player.dart';
import 'package:vibration_strong/screens/home/home_controller.dart';
import 'package:vibration_strong/utils/state_builder.dart';
import 'package:vibration_strong/utils/touchable.dart';

import '../core/assets/app_assets.dart';
import '../core/common/imagehelper.dart';
import '../core/model/music_model.dart';
import '../screens/in_app_manage.dart';

class ItemMusic extends StatelessWidget {
  ItemMusic({Key? key, this.musicModel, this.controller, this.index})
      : super(key: key);
  MusicModel? musicModel;
  HomeController? controller;
  int? index;

  @override
  Widget build(BuildContext context) {
    return Touchable(
      onTap: () {
        if (!IAPConnection().isAvailable && index != 0 && index != 1) {
          Navigator.of(context).pop();
          Get.toNamed(Routes.PREMIUM);
        } else {
          controller?.changeSelectedMusic(index ?? 0);
          AudioPlayerVibration().currentUrl = musicModel?.path ?? AppAssets.musicCover1;
          AudioPlayerVibration()
              .playAudio();
        }
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        color: Colors.purple.withOpacity(0.8),
        elevation: 0.4,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white70, width: 2)),
                padding: EdgeInsets.all(8.w),
                child: Center(
                  child: Icon(
                    (musicModel?.isSelected ?? false)
                        ? Icons.pause
                        : Icons.my_library_music_outlined,
                    size: 20,
                    color: Colors.white70,
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                  child: Text(
                musicModel?.title ?? '',
                style: TextStyles.body3.regular.setColor(Colors.white),
              )),
              if (!IAPConnection().isAvailable && index != 0 && index != 1)
                SizedBox(
                  width: 15.w,
                ),
              if (!IAPConnection().isAvailable && index != 0 && index != 1)
                ImageHelper.loadFromAsset(AppAssets.icPremium,
                    width: 20, height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
