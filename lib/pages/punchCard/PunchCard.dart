import 'package:flutter/material.dart';
import 'package:myapp/components/NowDate.dart';

class PunchCard extends StatefulWidget {
  PunchCard({Key key}) : super(key: key);

  @override
  _PunchCardState createState() => _PunchCardState();
}

class _PunchCardState extends State<PunchCard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("考勤打卡"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: NowDate(),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  color: Colors.blueAccent,
                  //z轴的高度，设置card的阴影
                  elevation: 20.0,
                  //设置shape，这里设置成了R角
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.zero,
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.circular(20.0)),
                  ),
                  //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
                  clipBehavior: Clip.antiAlias,
                  semanticContainer: false,
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 130,
                    alignment: Alignment.center,
                    child: Text(
                      "上班打卡",
                      style: TextStyle(fontSize: 28, color: Colors.blueAccent),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  color: Colors.blueAccent,
                  //z轴的高度，设置card的阴影
                  elevation: 20.0,
                  //设置shape，这里设置成了R角
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.zero,
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.circular(20.0)),
                  ),
                  //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
                  clipBehavior: Clip.antiAlias,
                  semanticContainer: false,
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 130,
                    alignment: Alignment.center,
                    child: Text(
                      "下班打卡",
                      style: TextStyle(fontSize: 28, color: Colors.blueAccent),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Card(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    color: Colors.blueAccent,
                    //z轴的高度，设置card的阴影
                    elevation: 20.0,
                    //设置shape，这里设置成了R角
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
                    clipBehavior: Clip.antiAlias,
                    semanticContainer: false,
                    child: Container(
                      color: Colors.white,
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      child: Text(
                        "外勤打卡",
                        style:
                            TextStyle(fontSize: 20, color: Colors.blueAccent),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
