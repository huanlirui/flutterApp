import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'dart:async';

class NowDate extends StatefulWidget {
  NowDate({Key key}) : super(key: key);

  @override
  _NowDateState createState() => _NowDateState();
}

class _NowDateState extends State<NowDate> {
  DateTime _nowDate = new DateTime.now();
  Timer _timer;
  String _nowTimeString = '';

  List _weekDay = [
    '一',
    '二',
    '三',
    '四',
    '五',
    '六',
    '天',
  ];
  // String _nowDateString = '';
  void startTimer() {
    //设置 1 秒回调一次
    const period = const Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      //更新界面
      _nowDate = new DateTime.now();
      setState(() {
        _nowTimeString = constructTime(_nowDate);
      });
    });
  }

  //时间格式化，根据总秒数转换为对应的 hh:mm:ss 格式
  String constructTime(DateTime dateTime) {
    return formatDate(dateTime, [HH, ':', mm, ":", ss]);
  }

  //时间格式化，根据总秒数转换为对应的 hh年mm月ss日 格式
  String constructDate(DateTime dateTime) {
    return formatDate(dateTime, [yyyy, '年', mm, '月', dd, '日']);
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              _nowTimeString,
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[500]),
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 10),
              child: Column(
                children: <Widget>[
                  Text(
                    constructDate(_nowDate),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '星期' + _weekDay[_nowDate.weekday - 1],
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    cancelTimer();
  }
}
