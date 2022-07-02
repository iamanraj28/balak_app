import 'package:flutter/material.dart';

class Config {
  final String appName = 'Balak';
  final String splashIcon = 'assets/images/splash.png';
  final String supportEmail = 'iamanraj28@gmail.com';
  final String privacyPolicyUrl =
      'https://www.shivalikcollege.edu.in/privacy-policy';
  final String ourWebsiteUrl = 'https://www.shivalikcollege.edu.in/';
  final String iOSAppId = '000000';

  //social links
  static const String instagramPageUrl =
      'https://www.instagram.com/ichillipotato/?hl=en';
  static const String youtubeChannelUrl =
      'https://www.youtube.com/c/ShivalikCollegeOfficial';
  static const String twitterUrl = 'https://twitter.com/chillipotato__';

  //app theme color
  final Color appColor = Colors.deepPurpleAccent;

  //Intro images
  final String introImage1 = 'assets/images/events1.png';
  final String introImage2 = 'assets/images/events6.png';
  final String introImage3 = 'assets/images/events7.png';

  //animation files
  final String doneAsset = 'assets/animation_files/done.json';

  //Language Setup
  final List<String> languages = ['English'];

  //initial categories - 4 only (Hard Coded : which are added already on your admin panel)
  final List initialCategories = [
    'Shiva Fest',
    'College Events',
    'Programming',
    'Other Events'
  ];
}
