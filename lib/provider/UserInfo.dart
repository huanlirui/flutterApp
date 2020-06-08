import 'package:flutter/material.dart';
import 'package:myapp/models/UserInfo.dart';

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

  void setUserInfo(Map value) {
    _userInfo = value;
  }

  static getUserInfo() {
    return _userInfo;
  }

  get appMenus {
    return _appMenu;
  }

  set appMenus(value) {
    _appMenu = value;
  }

  get avator {
    return _avatar;
  }

  set avator(value) {
    _avatar = value;
  }

  get departs {
    return _departs;
  }

  set departs(value) {
    _departs = value;
  }

  get realName {
    return _realName;
  }

  set realName(value) {
    _realName = value;
  }

  get userId {
    return _userId;
  }

  set userId(value) {
    _userId = value;
  }

  get userName {
    return _userName;
  }

  set userName(value) {
    _userName = value;
  }
}
