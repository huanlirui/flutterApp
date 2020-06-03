import 'package:flutter/material.dart';

import 'routes/Routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myapp/pages/Tabs.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        //此处
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        //此处
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      home: Tabs(),
      debugShowCheckedModeBanner: false, //去掉debugger图标
      initialRoute: '/firstPage', //初始化的时候加载路由
      onGenerateRoute: onGenerateRoute,
    );
  }
}

class PassArgumentsScreen {}
