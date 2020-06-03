import 'package:flutter/material.dart';

class MessageFull extends StatefulWidget {
 final Map arguments;
  MessageFull({Key key, this.arguments}) : super(key: key);

  @override
  _MessageFullState createState() =>
      _MessageFullState(arguments: this.arguments);
}

class _MessageFullState extends State<MessageFull> {
  Map arguments;
  _MessageFullState({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息中心full组件"),
      ),
      body: Text('消息Id=${arguments['id']}'),
    );
  }
}
