import 'package:flutter/material.dart';

class PunchCard extends StatefulWidget {
  PunchCard({Key key}) : super(key: key);

  @override
  _PunchCardState createState() => _PunchCardState();
}

class _PunchCardState extends State<PunchCard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("打卡页面"),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: '正常打卡'),
              Tab(text: '外勤打卡'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('第一个tab'),
                ),
                ListTile(
                  title: Text('第一个tab'),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('第2个tab'),
                ),
                ListTile(
                  title: Text('第2个tab'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
