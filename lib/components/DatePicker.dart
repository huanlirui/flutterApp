import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class DatePicker extends StatefulWidget {
  DatePicker({Key key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _nowDate = DateTime.now();
  // String _now = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
  _showDatePick() async {
    // showDatePicker(
    //     context: context,
    //     initialDate: _nowDate,
    //     firstDate: DateTime(1940),
    //     lastDate: DateTime(2050)).then((value) => print(value));  //then调用
    var result = await showDatePicker(
        context: context,
        initialDate: _nowDate,
        firstDate: DateTime(1940),
        lastDate: DateTime(2050)); //异步方法
    print(result);
    if (result != null) {
      setState(() {
        _nowDate = result;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // print(_now);   2020-06-03 09:38:56.000533
    // print(_now.millisecondsSinceEpoch);   1591148418761
    // print(DateTime.fromMillisecondsSinceEpoch(1591148418761)); 2020-06-03 09:38:56.000533
    // print(formatDate(
    //     DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', hh, ':', mm, ":", ss])); 2020-06-03 09:06:11
  }

  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('官方日期选择器：'),
          Text(formatDate(_nowDate, [yyyy, '-', mm, '-', dd])),
          Icon(Icons.arrow_drop_down),
        ],
      ),
      onTap: () {
        _showDatePick();
      },
    );
  }
}
