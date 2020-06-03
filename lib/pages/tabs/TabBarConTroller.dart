import 'package:flutter/material.dart';

class TabBarControllerPage extends StatefulWidget {
  TabBarControllerPage({Key key}) : super(key: key);

  @override
  _TabBarControllerPageState createState() => _TabBarControllerPageState();
}

class _TabBarControllerPageState extends State<TabBarControllerPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override

  void dispose() {   // 生命周期函数-组件销毁
    // TODO: implement dispose 
    super.dispose();
    _tabController.dispose();
  }

  void initState() { //生命周期函数-初始化
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _tabController.addListener(() {
        print(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航菜单"),
        bottom: TabBar(
          controller: this._tabController,
          tabs: <Widget>[
            Tab(text: '第一个tabs'),
            Tab(text: '第二个tabs'),
          ],
        ),
      ),
      body: TabBarView(
        controller: this._tabController,
        children: <Widget>[
          Center(child: Text('第一个')),
          Center(child: Text('第二个')),
        ],
      ),
    );
  }
}
