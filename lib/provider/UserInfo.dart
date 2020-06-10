import 'package:flutter/material.dart';

import 'dart:convert';

class UserInfo with ChangeNotifier {
  static Map _userInfo;
  static List _appMenu;
  static String _avatar;
  static List _departs;
  static String _realName;
  // static String _token;
  static String _userId;
  static String _userName;

  // UserInfo(this._appMenu, this._avatar, this._departs, this._realName,
  //     this._token, this._userId, this._userName);
  // Map get userInfo => _userInfo;
  // set userInfo(Map value) => _userInfo = value;

  static void setUserInfo(String userInfo) async {
    if (userInfo != null) {
      Map userInfoJson = json.decode(userInfo);
      _userInfo = userInfoJson;
      _appMenu = userInfoJson['appMenus'];
      _avatar = userInfoJson['avatar'];
      _departs = userInfoJson['departs'];
      _realName = userInfoJson['realname'];
      _userId = userInfoJson['id'];
      _userName = userInfoJson['username'];
    }
  }

  static getUserInfo() {
    return _userInfo;
  }

  static getAppMenus() {
    return _appMenu;
  }

  static get avator {
    return _avatar;
  }

  static get departs {
    return _departs;
  }

  static get realName {
    return _realName;
  }

  static get userId {
    return _userId;
  }

  static get userName {
    return _userName;
  }
}
