import 'package:flutter/cupertino.dart';

class VibrationModel {
  String? icon;
  IconData? iconData;
  String? title;
  bool? isPremium;
  Function? onTap;

  VibrationModel({this.icon, this.title, this.onTap,this.iconData,this.isPremium = true});
}
