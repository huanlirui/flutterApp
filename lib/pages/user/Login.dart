import 'package:flutter/material.dart';
import 'package:myapp/pages/Tabs.dart';
import 'package:myapp/utils/request.dart';
import 'package:myapp/config/serviceUrl.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/components/Toast.dart';
import 'package:myapp/provider/UserInfo.dart';
import 'dart:convert';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _username = new TextEditingController();
  var _password = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _username.text = '';
    _password.text = '';
  }

  void _setToken(String token) async {
    if (token != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
    }
  }

  void _setUserInfo(Map userInfo) async {
    if (userInfo != null) {
      String jsonString = json.encode(userInfo);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userInfo', jsonString);
      UserInfo.setUserInfo(jsonString);
    }
  }

  void _login() {
    print(_username.text);
    print(_password.text);
    if (_username.text != '' && _password.text != '') {
      var param = {
        "deviceToken": '123',
        "password": _password.text,
        "username": _username.text
      };

      DioUtils.requestHttp(
        Api.login,
        parameters: param,
        method: 'post',
        onSuccess: (data) async {
          ToastInfo.toastSuccess('登录成功！');
          _setToken(data["token"]);
          await _setUserInfo(data);
          // print(data.toString());

          // 返回 tabs主页
          Navigator.of(context).pushAndRemoveUntil(
              new MaterialPageRoute(builder: (context) => new Tabs(index: 0)),
              (route) => false);
        },
        onError: (error) {
          print(error);
          ToastInfo.toastError(error);
        },
      );
    } else {
      ToastInfo.toastError('请输入账号密码');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录页面'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            TextField(
              controller: _username,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(
                  Icons.assignment_ind,
                  size: 30,
                ),
                labelText: "用户名",
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.visibility,
                  size: 30,
                ),
                labelText: "密码",
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              width: double.infinity,
              child: RaisedButton(
                child: Text('登录'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: () {
                  _login();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
