import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  SwiperPage({Key key}) : super(key: key);

  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  List<Map> imgList = [
    {
      "url": "images/bg.jpg",
    },
    {
      "url": "images/bg1.jpg",
    },
    {
      "url": "images/bg2.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.asset(
            imgList[index]["url"],
            fit: BoxFit.fill,
          );
        },
        itemCount: imgList.length,
        pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
  }
}
