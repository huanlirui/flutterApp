import 'package:flutter/material.dart';
import 'package:myapp/pages/user/UserInfo.dart';

import '../pages/Tabs.dart';
// import '../pages/tabs/Message.dart';
// import '../pages/Messagefull.dart';
import '../pages/user/Login.dart';
import '../pages/user/Register.dart';
import '../pages/punchCard/PunchCard.dart';
import '../pages/tabs/TabBarConTroller.dart';
import '../pages/user/UserInfo.dart';
import 'package:myapp/pages/firstPage/FirstPage.dart';
import 'package:myapp/pages/dialog/DialogPage.dart';
import 'package:myapp/pages/punchCard/PunchDetail.dart';
//配置路由
final routes = {
  '/firstPage': (context) => FirstPage(),
  '/': (context, {arguments}) => Tabs(),
  '/punchcard': (context) => PunchCard(),
  '/login': (context) => Login(),
  '/register': (contex) => Register(),
  '/tabBarControllerPage': (context) => TabBarControllerPage(),
  '/userInfo': (context) => UserInfo(),
  '/dialog': (context) => DialogPage(),
  '/punchDetail':(context, {arguments}) => PunchDetail(arguments: arguments)
  // '/message': (context) => Message(),
  // '/messagefull': (context, {arguments}) => MessageFull(arguments: arguments)
};
// 固定写法
var onGenerateRoute = (RouteSettings settings) {
  //统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];

  if (settings.arguments != null) {
    final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments));
    return route;
  } else {
    final Route route =
        MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    return route;
  }
};
