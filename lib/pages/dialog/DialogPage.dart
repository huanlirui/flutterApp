import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/components/Mydialog.dart';

class DialogPage extends StatefulWidget {
  DialogPage({Key key}) : super(key: key);

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  _alertDialog() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示信息'),
          content: Text('您确定要删除吗？'),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  print('取消');
                  Navigator.pop(context, 'Cancle');
                },
                child: Text('取消')),
            FlatButton(
                onPressed: () {
                  print('确定');
                  Navigator.pop(context, 'Ok');
                },
                child: Text('确定'))
          ],
        );
      },
    );
    print(result);
  }

  _simpleDialog() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('选择内容'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('option A'),
              onPressed: () {
                print('A');
                Navigator.pop(context, 'A');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('option B'),
              onPressed: () {
                print('B');
                Navigator.pop(context, 'B');
              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text('option C'),
              onPressed: () {
                print('C');
                Navigator.pop(context, 'C');
              },
            ),
            Divider(),
          ],
        );
      },
    );
    print(result);
  }

  _modelBottomSheet() async {
    var result = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('分享 A'),
                onTap: () {
                  print('A');
                  Navigator.pop(context, 'A');
                },
              ),
              ListTile(
                title: Text('分享 B'),
                onTap: () {
                  print('B');
                  Navigator.pop(context, 'B');
                },
              ),
              ListTile(
                title: Text('分享 C'),
                onTap: () {
                  print('C');
                  Navigator.pop(context, 'C');
                },
              )
            ],
          ),
        );
      },
    );
    print(result);
  }

  _toast() {
    Fluttertoast.showToast(
      msg: "提示信息",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  _showMydialog() {
    showDialog(
      context: context,
      builder: (context) {
        return MyDialog(title: "标题", content: "我是内容");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('弹窗页面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('alert弹出框'),
              onPressed: _alertDialog,
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('simpleDialog弹出框'),
              onPressed: _simpleDialog,
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('底部弹出框modelBottomSheet'),
              onPressed: _modelBottomSheet,
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('toast-fluttertoast第三方库'),
              onPressed: _toast,
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('自定义dialog'),
              onPressed: _showMydialog,
            )
          ],
        ),
      ),
    );
  }
}
