import 'package:flutter/material.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: DrawerHeader(
                      child: Column(
                    children: <Widget>[
                      Center(
                        child: ClipOval(
                          child: Image.asset(
                            'images/avator.jpg',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Center(
                          child: Text(
                            '一拳超人',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          '格泰科技-研发部-前端开发工程师',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )),
                )
              ],
            ),
            Divider(color: Colors.white),
            ListTile(
              title: Text(
                '个人资料',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              onTap: () {
                Navigator.of(context).pop(); // 隐藏侧边栏
                Navigator.pushNamed(context, '/userInfo');
              },
            ),
            Divider(color: Colors.white),
            ListTile(
              title: Text(
                '设置',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
            ),
            Divider(color: Colors.white),
            ListTile(
              title: Text(
                '切换部门',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: CircleAvatar(
                child: Icon(Icons.compare_arrows),
              ),
            ),
            Divider(color: Colors.white),
            ListTile(
              title: Text(
                '人脸自助采集',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: CircleAvatar(
                child: Icon(Icons.face),
              ),
            ),
            Divider(color: Colors.white),
            ListTile(
              title: Text(
                '退出登录',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: CircleAvatar(
                child: Icon(Icons.reply),
              ),
              onTap: () {
                Navigator.of(context).pop(); // 隐藏侧边栏
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
            Divider(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
