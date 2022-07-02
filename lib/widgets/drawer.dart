import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stud_app/blocs/theme_bloc.dart';
import 'package:stud_app/config/config.dart';
import 'package:stud_app/models/custom_color.dart';
import 'package:stud_app/pages/bookmarks.dart';
import 'package:stud_app/services/app_service.dart';
import 'package:stud_app/utils/balak.dart';
import 'package:stud_app/utils/next_screen.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List titles = [
      'Bookmarks',
      'Our Website',
      'Privacy Policy',
      'Contact Us',
      'Instagram Page',
      'Youtube Channel',
      'Twitter'
    ];

    final List icons = [
      Feather.bookmark,
      Feather.info,
      Feather.lock,
      Feather.mail,
      Feather.instagram,
      Feather.youtube,
      Feather.twitter
    ];

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                alignment: Alignment.center,
                //color: context.watch<ThemeBloc>().darkTheme == false ? CustomColor().drawerHeaderColorLight : CustomColor().drawerHeaderColorDark,
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppName(fontSize: 25.0),
                    Text(
                      'Made with 💜 by Aman Raj',
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(bottom: 30),
                itemCount: titles.length,
                shrinkWrap: true,
                separatorBuilder: (ctx, idx) => Divider(
                  height: 0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      titles[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ).tr(),
                    leading: CircleAvatar(
                        radius: 20,
                        backgroundColor:
                            context.watch<ThemeBloc>().darkTheme == false
                                ? CustomColor().drawerHeaderColorLight
                                : CustomColor().drawerHeaderColorDark,
                        child: Icon(
                          icons[index],
                          color: Colors.grey[600],
                        )),
                    onTap: () async {
                      Navigator.pop(context);
                      if (index == 0) {
                        nextScreen(context, BookmarkPage());
                      } else if (index == 1) {
                        AppService().openLinkWithCustomTab(
                            context, Config().ourWebsiteUrl);
                      } else if (index == 2) {
                        AppService().openLinkWithCustomTab(
                            context, Config().privacyPolicyUrl);
                      } else if (index == 3) {
                        AppService().openEmailSupport(context);
                      } else if (index == 4) {
                        AppService().openLink(context, Config.instagramPageUrl);
                      } else if (index == 5) {
                        AppService()
                            .openLink(context, Config.youtubeChannelUrl);
                      } else if (index == 6) {
                        AppService().openLink(context, Config.twitterUrl);
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
