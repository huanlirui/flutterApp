import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final arguments;
  Message({this.arguments});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Expanded(
                child: TabBar(
                  // isScrollable: true, //是否可滚动
                  tabs: <Widget>[
                    Tab(text: '公告'),
                    Tab(text: '汇报'),
                    Tab(text: '审批'),
                    Tab(text: '合同'),
                    Tab(text: '报备'),
                  ],
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('公告列表'),
                ),
                ListTile(
                  title: Text('公告列表'),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('汇报'),
                ),
                ListTile(
                  title: Text('汇报'),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('审批'),
                ),
                ListTile(
                  title: Text('审批'),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('合同'),
                ),
                ListTile(
                  title: Text('合同'),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('报备'),
                ),
                ListTile(
                  title: Text('报备'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
