import 'dart:io';

class AdManager {

  static final AdManager _singleton = AdManager._internal();

  factory AdManager() {
    return _singleton;
  }

  AdManager._internal();

  static String get bannerAdUnitId {
  if (Platform.isAndroid) {
    return 'ca-app-pub-7602924612279019/5002322962';
  } else if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/2934735716';
  } else {
    throw new UnsupportedError('Unsupported platform');
  }
}

static String get interstitialAdUnitId {
  if (Platform.isAndroid) {
    return "ca-app-pub-7602924612279019/3689241297";
  } else if (Platform.isIOS) {
    return "ca-app-pub-3940256099942544/4411468910";
  } else {
    throw new UnsupportedError("Unsupported platform");
  }
}

static String get rewardedAdUnitId {
  if (Platform.isAndroid) {
    return "ca-app-pub-7602924612279019/2376159627";
  } else if (Platform.isIOS) {
    return "ca-app-pub-3940256099942544/1712485313";
  } else {
    throw new UnsupportedError("Unsupported platform");
  }
}

  static String get nativeAppAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7602924612279019/8362698061";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get openAppAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7602924612279019/3856476845";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  // static String get bannerAdUnitId {
  //   if (Platform.isAndroid) {
  //     return 'ca-app-pub-3940256099942544/6300978111';
  //   } else if (Platform.isIOS) {
  //     return 'ca-app-pub-3940256099942544/2934735716';
  //   } else {
  //     throw new UnsupportedError('Unsupported platform');
  //   }
  // }
  //
  // static String get interstitialAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-3940256099942544/1033173712";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/4411468910";
  //   } else {
  //     throw new UnsupportedError("Unsupported platform");
  //   }
  // }
  //
  // static String get rewardedAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-3940256099942544/5224354917";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/1712485313";
  //   } else {
  //     throw new UnsupportedError("Unsupported platform");
  //   }
  // }
  //
  // static String get nativeAppAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-3940256099942544/2247696110";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/1712485313";
  //   } else {
  //     throw new UnsupportedError("Unsupported platform");
  //   }
  // }
  //
  // static String get openAppAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-3940256099942544/3419835294";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/1712485313";
  //   } else {
  //     throw new UnsupportedError("Unsupported platform");
  //   }
  // }
}
