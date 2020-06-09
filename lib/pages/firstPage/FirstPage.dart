import 'package:flutter/material.dart';

import 'package:myapp/pages/user/Login.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/pages/Tabs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/provider/UserInfo.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _currentIndex = 0;
  bool _jumpFlag = false;
  SwiperController _controller;

  List<Map> imgList = [
    {
      "url": "images/bg2.jpg",
    },
    {
      "url": "images/bg1.jpg",
    },
    {
      "url": "images/bg.jpg",
    },
  ];

  void getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userInfo = await prefs.getString('userInfo');
    UserInfo.setUserInfo(userInfo);
  }

  @override
  void initState()  {
    super.initState();
    _controller = new SwiperController();
    getUserInfo();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: _jumpFlag ? FloatButton() : null,
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.asset(
            imgList[index]["url"],
            fit: BoxFit.fill,
          );
        },
        itemCount: imgList.length,
        pagination: new SwiperPagination(),
        autoplay: !_jumpFlag,
        controller: _controller,
        index: _currentIndex,
        onIndexChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 2) {
            setState(() {
              _jumpFlag = true;
            });
          }
        },
        // control: new SwiperControl(),
      ),
    );
  }
}

class FloatButton extends StatelessWidget {
  const FloatButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.only(top: 100.0),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String token = await prefs.getString('token');

          if (token != null) {
            Navigator.of(context).pushAndRemoveUntil(
                new MaterialPageRoute(
                  builder: (context) => new Tabs(),
                ),
                (route) => false);
          } else {
            Navigator.of(context).pushAndRemoveUntil(
                new MaterialPageRoute(
                  builder: (context) => new Login(),
                ),
                (route) => false);
          }
        },
      ),
    );
  }
}
