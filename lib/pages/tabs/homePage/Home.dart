import 'package:flutter/material.dart';
import 'package:myapp/components/SwiperPage.dart';
import '../../Form.dart';
import 'AppMenu.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: SwiperPage(),
        ),
        // Container(
        //   height: 300,
        //   child: GridView.count(
        //     crossAxisCount: 3, //列数
        //     crossAxisSpacing: 20.0, //水平之间间距
        //     mainAxisSpacing: 20.0, //垂直之间间距
        //     padding: EdgeInsets.all(20),
        //     childAspectRatio: 1.0, //宽和高的比例
        //     children: <Widget>[
        //       RaisedButton(
        //         child: Text('跳转到打卡页面'),
        //         onPressed: () {
        //           //路由跳转
        //           Navigator.pushNamed(
        //             context,
        //             '/punchcard',
        //           );
        //         },
        //         color: Theme.of(context).accentColor,
        //         textTheme: ButtonTextTheme.primary,
        //       ),
        //       RaisedButton(
        //         child: Text('路由传值到表单页面'),
        //         onPressed: () {
        //           //路由跳转
        //           Navigator.of(context).push(
        //             MaterialPageRoute(
        //               builder: (context) => FormPage(
        //                 title: '表单页面',
        //               ),
        //             ),
        //           );
        //         },
        //         color: Theme.of(context).accentColor,
        //         textTheme: ButtonTextTheme.primary,
        //       ),
        //       RaisedButton(
        //         child: Text('跳转到顶部tab切换组件'),
        //         onPressed: () {
        //           //路由跳转
        //           Navigator.pushNamed(context, '/tabBarControllerPage');
        //         },
        //         color: Theme.of(context).accentColor,
        //         textTheme: ButtonTextTheme.primary,
        //       ),
        //       RaisedButton(
        //         child: Text('跳转到弹窗页面'),
        //         onPressed: () {
        //           //路由跳转
        //           Navigator.pushNamed(context, '/dialog');
        //         },
        //         color: Theme.of(context).accentColor,
        //         textTheme: ButtonTextTheme.primary,
        //       ),
        //     ],
        //   ),
        // ),
        Container(
          height: 300,
          // margin: EdgeInsets.only(bottom: 100),
          child: AppMenu(),
        ),
      ],
    );
  }
}
