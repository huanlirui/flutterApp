import 'package:flutter/material.dart';
import 'package:myapp/components/BaiduMap.dart';

class PunchDetail extends StatefulWidget {
  final Map arguments;
  PunchDetail({Key key, this.arguments}) : super(key: key);

  @override
  _PunchDetailState createState() =>
      _PunchDetailState(arguments: this.arguments);
}

class _PunchDetailState extends State<PunchDetail> {
  Map arguments;
  _PunchDetailState({this.arguments});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("打卡详情页"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              BaiduMap(),
              Container(
                  child: Center(
                child: Image.asset(
                  'images/face.gif',
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ))
            ],
          ),
          padding: EdgeInsets.all(10),
        ));
  }
}
