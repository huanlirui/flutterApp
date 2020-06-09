import 'package:flutter/material.dart';
import 'package:myapp/config/serviceUrl.dart';

class MenuItem extends StatelessWidget {
  final Map data;
// final MenuItemViewModel = data;
  MenuItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 5),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.network(Api.imgUrl + this.data['icon']),
          ),
          Text(
            this.data['title'],
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }
}

// class MenuItemViewModel {
//   /// 图标
//   final String icon;

//   /// 标题
//   final String title;

//   final String iconId;
//   final String type;

//   const MenuItemViewModel({
//     this.icon,
//     this.title,
//     this.iconId,
//     this.type,
//   });
// }
