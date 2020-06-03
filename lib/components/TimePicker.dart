import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  TimePicker({Key key}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  var _time = TimeOfDay(hour: 12, minute: 00);
  _showTimePicker() async {
    var result = await showTimePicker(context: context, initialTime: _time);
    if (result != null) {
      setState(() {
        _time = result;
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
          Text(_time.format(context)),
          Icon(Icons.arrow_drop_down),
        ],
      ),
      onTap: () {
        _showTimePicker();
      },
    );
  }
}
