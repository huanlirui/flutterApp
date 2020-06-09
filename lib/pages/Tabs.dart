import 'package:flutter/material.dart';
import 'tabs/homePage/Home.dart';

import 'tabs/MyInfo.dart';
import 'tabs/Message.dart';
import 'drawer/UserDrawer.dart';

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key key, this.index = 0}) : super(key: key);

  @override
  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pageList = [
    HomePage(),
    MyInfo(),
    Message(),
  ];
  _TabsState(index) {
    this._currentIndex = index;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('新悦居flutterDemo'),
        // leading: IconButton(
        //     icon: Icon(Icons.menu),
        //     onPressed: () {
        //       print('appbar左上角图标');
        //     }),
        // actions: <Widget>[
        //   IconButton(
        //       icon: Icon(Icons.menu),
        //       onPressed: () {
        //         print('appbar右上角图标');
        //       }),
        // ],
      ),
      body: this._pageList[this._currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70,
        width: 70,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: FloatingActionButton(
          child: Icon(Icons.card_travel),
          onPressed: () {
            Navigator.pushNamed(context, '/punchcard');
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/punchcard');
            return;
          }
          setState(() {
            this._currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind),
            title: Text('打卡'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('消息'),
          ),
        ],
      ),
      drawer: UserDrawer(),
      // endDrawer: Drawer(
      //   child: Text('你好flutter'),
      // ),
    );
  }
}
