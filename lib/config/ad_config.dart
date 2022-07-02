import 'dart:io';

class AdConfig {
  //-- Admob Ads --
  static const String admobAppIdAndroid =
      'ca-app-pub-1567413072789200~9527985559';
  static const String admobAppIdiOS = '';

  static const String admobInterstitialAdUnitIdAndroid =
      'ca-app-pub-1567413072789200/7533249747';
  static const String admobInterstitialAdUnitIdiOS = '';

  static const String admobBannerAdUnitIdAndroid =
      'ca-app-pub-1567413072789200/6327107145';
  static const String admobBannerAdUnitIdiOS = '';

  //-- Fb Ads --
  static const String fbInterstitialAdUnitIdAndroid = '';
  static const String fbInterstitialAdUnitIdiOS = '';

  static const String fbBannerAdUnitIdAndroid = '';
  static const String fbBannerAdUnitIdiOS = '';

  // -- Don't edit these --

  String getAdmobAppId() {
    if (Platform.isAndroid) {
      return admobAppIdAndroid;
    } else {
      return admobAppIdiOS;
    }
  }

  String getAdmobBannerAdUnitId() {
    if (Platform.isAndroid) {
      return admobBannerAdUnitIdAndroid;
    } else {
      return admobBannerAdUnitIdiOS;
    }
  }

  String getAdmobInterstitialAdUnitId() {
    if (Platform.isAndroid) {
      return admobInterstitialAdUnitIdAndroid;
    } else {
      return admobInterstitialAdUnitIdiOS;
    }
  }

  String getFbBannerAdUnitId() {
    if (Platform.isAndroid) {
      return fbBannerAdUnitIdAndroid;
    } else {
      return fbBannerAdUnitIdiOS;
    }
  }

  String getFbInterstitialAdUnitId() {
    if (Platform.isAndroid) {
      return fbInterstitialAdUnitIdAndroid;
    } else {
      return fbInterstitialAdUnitIdiOS;
    }
  }
}
