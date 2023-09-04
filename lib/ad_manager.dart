import 'dart:io';

class AdManager {
  static final AdManager _singleton = AdManager._internal();

  factory AdManager() {
    return _singleton;
  }

  AdManager._internal();

  static String get sdkKey {
    return "hSsRnQ4Zzz5gbaWTKEftwpHxlJucNOpkZeBvEPnogcgWAAB9ERVIFHNG_WHhJTkHCh5AyFcRTF6kN711_nKE3d";
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return '3ea2cdb74fbd86cf';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "34951637fbd5bd2e";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "940926a4280af821";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get openAppAdUnitId {
    if (Platform.isAndroid) {
      return "c0af7f00bd45ab87";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get nativeAppAdUnitId {
    if (Platform.isAndroid) {
      return "110e0318aba19985";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
  static String get nativeAppSmallAdUnitId {
    if (Platform.isAndroid) {
      return "69b38b24dbd2afa3";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
