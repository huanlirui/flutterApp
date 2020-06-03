import 'package:flutter/material.dart';

class MyInfo extends StatefulWidget {
  MyInfo({Key key}) : super(key: key);

  @override
  _MyInfoState createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('跳转到登录页面'),
            onPressed: () {
              //路由入栈
              // Navigator.pushNamed(context, '/login');
              //替换路由 替换当前路由。
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
          RaisedButton(
            child: Text('跳转到注册页面'),
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
          )
        ],
      ),
    );
  }
}
