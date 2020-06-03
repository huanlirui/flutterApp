import 'package:flutter/material.dart';
import '../components/DatePicker.dart';
import '../components/TimePicker.dart';
import '../components/CupertinoDatePicker.dart';
class FormPage extends StatefulWidget {
  String title;
  FormPage({Key key, this.title}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState(title: this.title);
}

class _FormPageState extends State<FormPage> {
  String title;
  String username;
  String content;
  bool flag = true;
  int sex = 1;
  List hobby = [
    {
      "checked": true,
      "title": "吃饭",
    },
    {
      "checked": true,
      "title": "睡觉",
    },
    {
      "checked": true,
      "title": "写代码",
    },
    {
      "checked": true,
      "title": "打游戏",
    },
    {
      "checked": false,
      "title": "看电视",
    }
  ];
  List<Widget> _getHobby() {
    List<Widget> templist = [];
    for (var i = 0; i < this.hobby.length; i++) {
      templist.add(Text(this.hobby[i]["title"] + ":"));
      templist.add(Checkbox(
          value: this.hobby[i]["checked"],
          onChanged: (value) {
            setState(() {
              this.hobby[i]["checked"] = value;
            });
          }));
    }
    return templist;
  }

  _FormPageState({this.title});

  void _usernameChange(value) {
    setState(() {
      this.username = value;
    });
  }

  void _sexChange(value) {
    setState(() {
      this.sex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   child: Text('返回'),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        appBar: AppBar(title: Text(this.title)),
        body: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "用户名",
                          ),
                          onChanged: (v) {
                            this._usernameChange(v);
                          },
                        ),
                        SizedBox(height: 20),
                        TextField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: "请输入内容",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Checkbox(
                                value: this.flag,
                                onChanged: (v) {
                                  setState(() {
                                    this.flag = v;
                                  });
                                }),
                            Text(this.flag ? "选中" : "未选中")
                          ],
                        ),
                        SizedBox(height: 20),
                        CheckboxListTile(
                          value: this.flag,
                          title: Text('标题'),
                          subtitle: Text('这是2级标题'),
                          secondary: Icon(Icons.help),
                          onChanged: (v) {
                            setState(() {
                              this.flag = v;
                            });
                          },
                          selected: this.flag,
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Text('性别:'),
                            Radio(
                                value: 1,
                                groupValue: this.sex,
                                onChanged: (v) {
                                  this._sexChange(v);
                                }),
                            Text('男'),
                            Radio(
                                value: 2,
                                groupValue: this.sex,
                                onChanged: (v) {
                                  this._sexChange(v);
                                }),
                            Text('女'),
                          ],
                        ),
                        SizedBox(height: 20),
                        RadioListTile(
                          value: 1,
                          title: Text('男'),
                          subtitle: Text('这是2级标题'),
                          secondary: Image.asset('images/avator.jpg'),
                          groupValue: this.sex,
                          onChanged: (v) {
                            setState(() {
                              this.sex = v;
                            });
                          },
                          selected: this.sex == 1,
                        ),
                        RadioListTile(
                          value: 2,
                          title: Text('女'),
                          subtitle: Text('这是2级标题'),
                          secondary: Icon(Icons.help),
                          groupValue: this.sex,
                          onChanged: (v) {
                            setState(() {
                              this.sex = v;
                            });
                          },
                          selected: this.sex == 2,
                        ),
                        SizedBox(height: 20),
                        Switch(
                          value: this.flag,
                          onChanged: (v) {
                            setState(() {
                              this.flag = v;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        Column(
                          children: _getHobby(),
                        ),
                        DatePicker(),
                        TimePicker(),
                        CupertinoDatePicker(),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          width: double.infinity,
                          child: RaisedButton(
                            child: Text('提交'),
                            color: Theme.of(context).accentColor,
                            textTheme: ButtonTextTheme.primary,
                            onPressed: () {
                              print(this.username);
                              print(this.sex);
                              print(this.hobby.where(
                                  (element) => element["checked"] == true));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ));
  }
}
