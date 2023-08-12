import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration_strong/screens/home/home_controller.dart';
import 'package:vibration_strong/screens/home/home_screen.dart';
import 'package:vibration_strong/screens/setting/setting_screen.dart';
import '../../core/base/base_controller.dart';
import '../meditate/meditate_screen.dart';
import '../music/music_screen.dart';
import '../sleep/sleep_screen.dart';
import 'component/tab_nav.dart';
import 'keep_alive_page.dart';
import 'model/screen_model.dart';

class MainController extends BaseController {

  final screensData = <ScreenModel>[
    ScreenModel(
        name: "Massage",
        screen: KeepAlivePage(child: const Homescreen()),
        navKey: 1,
        icon: Icons.vibration),
    ScreenModel(
        name: "Sounds",
        screen: KeepAlivePage(child: const MusicScreen()),
        navKey: 2,
        icon: Icons.music_note_outlined),
    ScreenModel(
        name: "Meditate",
        screen: KeepAlivePage(child: const MeditateScreen()),
        navKey: 3,
        icon: Icons.ac_unit),
    ScreenModel(
        name: "Sleep",
        screen: KeepAlivePage(child: const SleepScreen()),
        navKey: 4,
        icon: Icons.access_time_rounded),
    ScreenModel(
        name: "Settings",
        screen: KeepAlivePage(child:  SettingScreen()),
        navKey: 5,
        icon: Icons.settings),
  ];

  final navMenuIndex = 0.obs;

  ScreenModel get currentScreenModel => screensData[navMenuIndex()];

  // store the pages stack.
  List<Widget>? _pages;

  // get navigators.
  List<Widget> get menuPages => _pages ??= screensData.map((e) => TabNav(e)).toList();

  // widget stuffs.
  List<BottomNavigationBarItem> get navMenuItems => screensData.map((e) {
    return BottomNavigationBarItem(
        icon: Icon(e.icon),
        label: e.name);
  }).toList();

  void onTapBottomBar(int index) {
    navMenuIndex.value = index;
  }

  void popToRoot() {
    (currentScreenModel.screen as KeepAlivePage).popToRoot();
  }
}