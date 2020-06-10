import 'package:flutter/material.dart';
import 'package:myapp/components/NowDate.dart';
import 'CardInfo.dart';

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
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Card(
                      color: Colors.blueAccent,

                      //设置shape，这里设置成了R角
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
                      clipBehavior: Clip.antiAlias,
                      semanticContainer: false,
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.event_note,
                              color: Colors.indigo[400],
                            ),
                            Text('考勤记录'),
                          ],
                        ),
                      ),
                    )
                  ],
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
                  child: CardInfo(
                      normalTime: '08:00',
                      clockType: '上班',
                      exceptionText: '正常打卡',
                      exceptionTime: '07:50',
                      status: '0'),
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
                  child: CardInfo(
                      normalTime: '17:00',
                      clockType: '下班',
                      exceptionText: '早退打卡',
                      exceptionTime: '14:06:53',
                      status: '2'),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Card(
                          color: Colors.blueAccent,

                          //设置shape，这里设置成了R角
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
                          clipBehavior: Clip.antiAlias,
                          semanticContainer: false,
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(10),
                            height: 100,
                            width: 130,
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  size: 30,
                                  color: Colors.indigo[400],
                                ),
                                Text(
                                  '新建外勤',
                                  style: TextStyle(
                                      color: Colors.indigo[900],
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '外勤打卡',
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
