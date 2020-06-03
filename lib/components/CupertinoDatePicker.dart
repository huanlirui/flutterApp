import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:date_format/date_format.dart';

class CupertinoDatePicker extends StatefulWidget {
  CupertinoDatePicker({Key key}) : super(key: key);

  @override
  _CupertinoDatePickerState createState() => _CupertinoDatePickerState();
}

class _CupertinoDatePickerState extends State<CupertinoDatePicker> {
  String _formatDay = 'yyyy-MMMM-dd';
  String _formatMinutes = 'yy年M月d日    EEE,H时:m分';
  DateTime _dateTime = DateTime.now();
  List _minutes = [yyyy, '-', mm, '-', dd, ' ', HH, ':', mm];
  List _day = [yyyy, '-', mm, '-', dd];
  //日期选择器
  _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: DateTimePickerTheme(
          showTitle: true,
          confirm: Text('确定', style: TextStyle(color: Colors.red)),
          cancel: Text('取消', style: TextStyle(color: Colors.cyan))),
      minDateTime: DateTime.parse("1940-01-01"),
      maxDateTime: DateTime.parse("2050-01-01"),
      initialDateTime: _dateTime,
      dateFormat: _formatDay,
      locale: DateTimePickerLocale.zh_cn,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onChange: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
    );
  }

  //精确到年月日时分选择器
  _showTimePicker() {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: DateTimePickerTheme(
          showTitle: true,
          confirm: Text('确定', style: TextStyle(color: Colors.red)),
          cancel: Text('取消', style: TextStyle(color: Colors.cyan))),
      minDateTime: DateTime.parse("1940-01-01"),
      maxDateTime: DateTime.parse("2050-01-01"),
      initialDateTime: _dateTime,
      dateFormat: _formatMinutes,
      pickerMode: DateTimePickerMode.datetime,
      locale: DateTimePickerLocale.zh_cn,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onChange: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('第三方日期选择器：'),
              Text(formatDate(
                  _dateTime, [yyyy, '-', mm, '-', dd, ' ', HH, ':', mm])),
              Icon(Icons.arrow_drop_down)
            ],
          ),
          onTap: _showTimePicker,
        )
      ],
    );
  }
}
