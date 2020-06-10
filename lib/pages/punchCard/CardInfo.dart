import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final String normalTime;
  final String clockType;
  final String exceptionText;
  final String exceptionTime;
  final String status;

  const CardInfo(
      {Key key,
      this.normalTime,
      this.clockType,
      this.exceptionText,
      this.exceptionTime,
      this.status})
      : super(key: key);
  statusIcon() {
    Map statusType = {
      "-1": {
        'text': "缺卡",
        'color': Colors.red[300],
        'icon': Icons.highlight_off
      },
      "0": {
        'text': "正常",
        'color': Colors.green,
        'icon': Icons.check_circle_outline
      },
      "1": {
        'text': "迟到",
        'color': Colors.red[300],
        'icon': Icons.error_outline
      },
      "2": {
        'text': "早退",
        'color': Colors.red[300],
        'icon': Icons.error_outline
      },
      "3": {
        'text': "旷工",
        'color': Colors.red[300],
        'icon': Icons.highlight_off
      },
      "4": {
        'text': "请假",
        'color': Colors.yellow[700],
        'icon': Icons.error_outline
      },
      "5": {
        'text': "出差",
        'color': Colors.red[300],
        'icon': Icons.error_outline
      },
      "6": {
        'text': "外出",
        'color': Colors.red[300],
        'icon': Icons.error_outline
      },
      "7": {
        'text': "休息",
        'color': Colors.green,
        'icon': Icons.check_circle_outline
      },
      "8": {
        'text': "外情核实中",
        'color': Colors.red[300],
        'icon': Icons.error_outline
      },
      "9": {
        'text': "异常",
        'color': Colors.red[300],
        'icon': Icons.error_outline
      },
      "10": {
        'text': "脱岗",
        'color': Colors.red[300],
        'icon': Icons.error_outline
      },
      "11": {
        'text': "已补卡",
        'color': Colors.yellow[700],
        'icon': Icons.check_circle_outline
      },
      "12": {
        'text': "人脸异常",
        'color': Colors.red[300],
        'icon': Icons.error_outline
      }
    };
    return Icon(
      statusType[status]['icon'],
      color: statusType[status]['color'],
      size: 80,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: double.infinity,
        height: 110,
        padding: EdgeInsets.fromLTRB(30, 10, 0, 5),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    clockType == '上班' ? Icons.wb_sunny : Icons.brightness_3,
                    color: clockType == '上班'
                        ? Colors.yellow[700]
                        : Colors.deepPurple[800],
                  ),
                  Text(
                    clockType == '上班' ? '上班打卡' : '下班打卡',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    normalTime,
                    style: TextStyle(color: Colors.green[500]),
                  ),
                  Row(
                    children: <Widget>[
                      Text(exceptionText),
                      Text(
                        exceptionTime,
                        style: TextStyle(color: Colors.red[200]),
                      ),
                    ],
                  ),
                ],
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(
                child: statusIcon(),
              ),
              flex: 1,
            )
          ],
        ));
  }
}
