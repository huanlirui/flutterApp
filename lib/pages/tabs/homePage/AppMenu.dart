import 'package:flutter/material.dart';
import 'MenuItem.dart';
import 'package:myapp/provider/UserInfo.dart';

class AppMenu extends StatelessWidget {
  List appMenuList = UserInfo.getUserInfo()['appMenus'];
  AppMenu() {
    print(appMenuList);
  }
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.symmetric(vertical: 0),
      children: appMenuList.map((item) => MenuItem(data: item)).toList(),
    );
  }
}
