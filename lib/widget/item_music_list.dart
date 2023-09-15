import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../admod_handle.dart';
import '../audio_player.dart';
import '../core/assets/app_assets.dart';
import '../core/common/app_func.dart';
import '../core/common/imagehelper.dart';
import '../core/model/music_model.dart';
import '../core/theme/textstyles.dart';
import '../utils/app_loading.dart';
import '../vibrator_manage.dart';
import '../routes/app_pages.dart';
import '../utils/touchable.dart';

class ItemMusicList extends StatelessWidget {
  ItemMusicList({Key? key, this.musicModel, this.controller, this.index})
      : super(key: key);
  MusicModel? musicModel;
  dynamic controller;
  int? index;

  @override
  Widget build(BuildContext context) {
    return Touchable(
      onTap: () async {
        // show ads
        if (AdmodHandle().ads.isLimit == false && AdmodHandle().isShowInter) {
          AdmodHandle().loadAdInter();
          if ((index ?? 0) % 2 == 0 &&
              AdmodHandle().interstitialAd != null &&
              index != controller?.indexOld.value) {
            // show ads
            showLoadingAds();
            AppFunc.setTimeout(() {
              hideLoadingAds();
              AdmodHandle().interstitialAd?.show();
            }, 2000);
          } else {
            hideLoadingAds();
          }
        }
        controller?.changeSelectedMusic(index ?? 0);
        musicModel?.onTab?.call();
        AudioPlayerVibration().currentUrl = musicModel?.url ??
            "https://storage.googleapis.com/vibrate/Autumn%20In%20My%20Heart.mp3";
        AudioPlayerVibration().playAudio(title: musicModel?.title ?? '');
      },
      child: Container(
        width: Get.width,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.white38, width: 0.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: ImageHelper.loadFromAsset(
                  musicModel?.thumb ?? AppAssets.img1,
                  fit: BoxFit.cover),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  musicModel?.title ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.caption.regular
                      .setColor(Colors.white)
                      .setFontWeight(FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.person,
                      size: 12,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "${musicModel?.view}",
                      style: TextStyles.defaultStyle
                          .setColor(Colors.white)
                          .setTextSize(9),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                      width: 1,
                      height: 10,
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    const Icon(
                      Icons.account_balance_wallet,
                      size: 12,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "${musicModel?.size} MB",
                      style: TextStyles.defaultStyle
                          .setColor(Colors.white)
                          .setTextSize(9),
                    )
                  ],
                ),
              ],
            )),
            Icon(
              (musicModel?.isSelected ?? false)
                  ? Icons.pause_circle
                  : Icons.play_circle,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
