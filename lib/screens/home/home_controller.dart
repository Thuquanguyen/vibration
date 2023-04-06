import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration_strong/core/assets/app_assets.dart';
import 'package:vibration_strong/core/base/base_controller.dart';
import 'package:vibration_strong/core/service/notification_service.dart';
import 'package:vibration_strong/core/theme/dimens.dart';

import '../../core/model/vibration_model.dart';

class HomeController extends BaseController {

 List<VibrationModel> vibrations = [
   VibrationModel(title: 'Sunny',icon: AppAssets.icSunny,onTap: (){
     Vibration.vibrate(
         pattern: [100, 8000, 100, 8000, 100, 8000, 100, 8000],
         intensities: [0,255],
         repeat: 1,
         amplitude: 255
     );
   },isPremium: false),
   VibrationModel(title: 'Heart',icon: AppAssets.icHeart,onTap: (){
     Vibration.vibrate(
         pattern: [100, 40, 100, 40, 100, 40,100, 40,100, 40,100, 40,100, 40,100, 40,100, 40],
         intensities: [1,255],
         repeat: 1,
         amplitude: 128
     );
   },isPremium: false),
   VibrationModel(title: 'Wave',icon: AppAssets.icWave,onTap: (){
     Vibration.vibrate(
         pattern: [100, 50, 100, 200, 100, 500, 100, 2000],
         intensities: [1,128],
         repeat: 1,
         amplitude: 128
     );
   },isPremium: false),
   VibrationModel(title: 'Magic',icon: AppAssets.icMagic,onTap: (){
     Vibration.vibrate(
         pattern: [100, 20, 50, 200, 10, 500, 100, 10,100, 2000, 100, 2000, 100, 2000, 100, 2000],
         intensities: [1,255],
         repeat: 1,
         amplitude: 20
     );
   },isPremium: true),
   VibrationModel(title: 'Dry',icon: AppAssets.icDry,onTap: (){
     Vibration.vibrate(
         pattern: [30, 40, 30, 40, 30, 40,30, 40,30, 40,30, 40,30, 40,30, 40,30, 40],
         intensities: [1,255],
         repeat: 1,
         amplitude: 255
     );
   },isPremium: true),
     VibrationModel(title: 'Expand',icon: AppAssets.icExpand,onTap: (){
       Vibration.vibrate(
           pattern: [100, 500, 100, 1000, 100, 2000,100, 3000,100, 4000,100, 5000,100, 6000,100, 7000,100, 8000],
           intensities: [1,255],
           repeat: 1,
           amplitude: 255
       );
   },isPremium: true),
   VibrationModel(title: 'Refresh',icon: AppAssets.icRefresh,onTap: (){

   },isPremium: true),
   VibrationModel(title: 'Breeze',icon: AppAssets.icBreeze,onTap: (){
     Vibration.vibrate(
         pattern: [100,80,100,80,100,80,100,80,100,80,100,40,100,40,100,40,100,40,100,40,100,40],
         intensities: [1,255],
         repeat: 1,
         amplitude: 128
     );
   },isPremium: true),
   VibrationModel(title: 'Rise',icon: AppAssets.icRise,onTap: (){
     Vibration.vibrate(
         pattern: [50,50,50,50,50,50,100,2000,50,50,50,50,50,50,50,50,100,2000,50,50,50,50,50,50,50,50,100,2000,50,50,50,50,50,50,50,50,100,2000,50,50,50,50,50,50,50,50],
         intensities: [1,10],
         repeat: 1,
         amplitude: 10
     );
   },isPremium: true),
   VibrationModel(title: 'Dramatic',icon: AppAssets.icDrammatic,onTap: (){
     Vibration.vibrate(
         pattern: [50,4000,50,50,50,4000,50,50,50,4000,50,50,50,50,4000,50,50,50,4000,50,4000],
         intensities: [1,255],
         repeat: 1,
         amplitude: 128
     );
   },isPremium: true),
   VibrationModel(title: 'Heavy',icon: AppAssets.icHeavy,onTap: (){
     Vibration.vibrate(
         pattern: [50,40,50,40,50,40,50,40,50,40,50,40,50,40,50,40,50,40,50,40],
         intensities: [1,10],
         repeat: 1,
         amplitude: 10
     );

   },isPremium: true),
   VibrationModel(title: 'Snow',icon: AppAssets.icSnow,onTap: (){
     Vibration.vibrate(
         pattern: [10, 60, 10, 10,120, 10, 120, 10,120, 10],
         intensities: [1,255],
         repeat: 1,
         amplitude: 128
     );
   },isPremium: true),
   VibrationModel(title: 'Tingle',icon: AppAssets.icTingle,onTap: (){
     Vibration.vibrate(
         pattern: [120, 60, 120, 40,120, 60, 120, 40,120, 60, 120, 40,120, 1000,120, 60, 120, 40,120, 60, 120, 40,120, 60, 120,2000,120, 60, 120, 40,120, 1000],
         intensities: [1,255],
         repeat: 1,
         amplitude: 128
     );
   },isPremium: true),
   VibrationModel(title: 'Dotted',icon: AppAssets.icDotted,onTap: (){
     Vibration.vibrate(
         pattern: [50,500,50,500,50,500,50,500,50,500,50,500,50,500,50,500,50,500],
         intensities: [1,10],
         repeat: 1,
         amplitude: 10
     );
   },isPremium: true),
   VibrationModel(title: 'Warn',icon: AppAssets.icWarn,onTap: (){
     Vibration.vibrate(
         pattern: [50, 50, 50, 50],
         intensities: [1,255],
         repeat: 1,
         amplitude: 128
     );
   },isPremium: true),
 ];

 RxDouble progress = 0.0.obs;
 RxDouble initValue = 0.0.obs;
 getTitle(double value){
   if(value < 500){
     return 'Low';
   }else if(value >=500 && value < 1000){
     return 'Medium';
   }else{
     return 'High';
   }
 }

 @override
  void onInit() {
    // TODO: implement onInit
   NotificationService().showNotification();
    super.onInit();
  }
}
