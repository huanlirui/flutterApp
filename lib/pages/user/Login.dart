import 'package:flutter/material.dart';
import 'package:myapp/pages/Tabs.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录页面'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
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
                  print(_username.text);
                  print(_password.text);
                  // 返回 tabs主页
                  Navigator.of(context).pushAndRemoveUntil(
                      new MaterialPageRoute(
                          builder: (context) => new Tabs(index: 0)),
                      (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
