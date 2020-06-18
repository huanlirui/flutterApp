import 'package:flutter/material.dart';


class BaiduMap extends StatefulWidget {
  BaiduMap({Key key}) : super(key: key);

  @override
  _BaiduMapState createState() => _BaiduMapState();
}

class _BaiduMapState extends State<BaiduMap> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('百度地图'),
    );
  }
}