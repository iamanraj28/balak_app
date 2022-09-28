// ignore_for_file: unused_label, unnecessary_statements

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:stud_app/blocs/featured_bloc.dart';
import 'package:stud_app/blocs/notification_bloc.dart';
import 'package:stud_app/blocs/popular_articles_bloc.dart';
import 'package:stud_app/blocs/recent_articles_bloc.dart';
import 'package:stud_app/blocs/tab_index_bloc.dart';
import 'package:stud_app/config/config.dart';
import 'package:stud_app/pages/notifications.dart';
import 'package:stud_app/pages/search.dart';
import 'package:stud_app/utils/balak.dart';
import 'package:stud_app/utils/next_screen.dart';
import 'package:stud_app/widgets/drawer.dart';
import 'package:stud_app/widgets/tab_medium.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class Explore extends StatefulWidget {
  Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TabController? _tabController;

  List<Tab> _tabs = [
    Tab(
      text: "All Events".tr(),
    ),
    Tab(
      text: Config().initialCategories[0],
    ),
    Tab(
      text: Config().initialCategories[1],
    ),
    Tab(
      text: Config().initialCategories[2],
    ),
    Tab(
      text: Config().initialCategories[3],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController!.addListener(() {
      context.read<TabIndexBloc>().setTabIndex(_tabController!.index);
    });
    Future.delayed(Duration(milliseconds: 0)).then((value) {
      context.read<FeaturedBloc>().getData();
      context.read<PopularBloc>().getData();
      context.read<RecentBloc>().getData(mounted);
    });
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      drawer: DrawerMenu(),
      key: scaffoldKey,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          new SliverAppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            titleSpacing: 0,
            title: AppName(fontSize: 19.0),
            leading: IconButton(
              icon: Icon(
                Feather.menu,
                size: 25,
              ),
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
            ),
            elevation: 1,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  AntDesign.search1,
                  size: 22,
                ),
                onPressed: () {
                  nextScreen(context, SearchPage());
                },
              ),
              Badge(
                position: BadgePosition.topEnd(top: 14, end: 15),
                badgeColor: Colors.redAccent,
                animationType: BadgeAnimationType.fade,
                showBadge: context.watch<NotificationBloc>().savedNlength <
                        context.watch<NotificationBloc>().notificationLength
                    ? true
                    : false,
                badgeContent: Container(),
                child: IconButton(
                  icon: Icon(
                    LineIcons.bell,
                    size: 25,
                  ),
                  onPressed: () {
                    context.read<NotificationBloc>().saveNlengthToSP();
                    nextScreen(context, NotificationsPage());
                  },
                ),
              ),
              SizedBox(
                width: 5,
              )
            ],
            pinned: true,
            floating: true,
            forceElevated: innerBoxIsScrolled,
            bottom: TabBar(
              labelStyle: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Color(0xff5f6368), //niceish grey
              isScrollable: true,
              indicator: MD2Indicator(
                //it begins here
                indicatorHeight: 3,
                indicatorColor: Theme.of(context).primaryColor,
                indicatorSize: MD2IndicatorSize.normal,
              ),
              tabs: _tabs,
            ),
          ),
        ];
      }, body: Builder(
        builder: (BuildContext context) {
          final innerScrollController = PrimaryScrollController.of(context);
          return TabMedium(
            sc: innerScrollController,
            tc: _tabController,
          );
        },
      )),
      floatingActionButton: FloatingActionButton.extended(
          label:
              Row(children: [Icon(Icons.face), Text(' Greetings, Wanderer')]),
          backgroundColor: Colors.deepPurple,
          onPressed: () async {
            {
              dynamic conversationObject = {
                'appId':
                    '13df5b0cdd20d41fc772ca348725dcb59', // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
              };

              KommunicateFlutterPlugin.buildConversation(conversationObject)
                  .then((clientConversationId) {
                print("Conversation builder success : " +
                    clientConversationId.toString());
              }).catchError((error) {
                print("Conversation builder error : " + error.toString());
              });
            }
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
