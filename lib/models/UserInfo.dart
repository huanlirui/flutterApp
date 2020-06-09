class UserInfoModel {
  int age;
  List<AppMenus> appMenus;
  String avatar;
  String birthday;
  List<Departs> departs;
  String email;
  int gender;
  String id;
  String mobile;
  String multiDepart;
  String phone;
  String realname;
  List<Roles> roles;
  int sex;
  String token;
  String username;

  UserInfoModel(
      {this.age,
      this.appMenus,
      this.avatar,
      this.birthday,
      this.departs,
      this.email,
      this.gender,
      this.id,
      this.mobile,
      this.multiDepart,
      this.phone,
      this.realname,
      this.roles,
      this.sex,
      this.token,
      this.username});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    if (json['appMenus'] != null) {
      appMenus = new List<AppMenus>();
      json['appMenus'].forEach((v) {
        appMenus.add(new AppMenus.fromJson(v));
      });
    }
    avatar = json['avatar'];
    birthday = json['birthday'];
    if (json['departs'] != null) {
      departs = new List<Departs>();
      json['departs'].forEach((v) {
        departs.add(new Departs.fromJson(v));
      });
    }
    email = json['email'];
    gender = json['gender'];
    id = json['id'];
    mobile = json['mobile'];
    multiDepart = json['multiDepart'];
    phone = json['phone'];
    realname = json['realname'];
    if (json['roles'] != null) {
      roles = new List<Roles>();
      json['roles'].forEach((v) {
        roles.add(new Roles.fromJson(v));
      });
    }
    sex = json['sex'];
    token = json['token'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    if (this.appMenus != null) {
      data['appMenus'] = this.appMenus.map((v) => v.toJson()).toList();
    }
    data['avatar'] = this.avatar;
    data['birthday'] = this.birthday;
    if (this.departs != null) {
      data['departs'] = this.departs.map((v) => v.toJson()).toList();
    }
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['mobile'] = this.mobile;
    data['multiDepart'] = this.multiDepart;
    data['phone'] = this.phone;
    data['realname'] = this.realname;
    if (this.roles != null) {
      data['roles'] = this.roles.map((v) => v.toJson()).toList();
    }
    data['sex'] = this.sex;
    data['token'] = this.token;
    data['username'] = this.username;
    return data;
  }
}

class AppMenus {
  String icon;
  String iconId;
  String title;
  String type;

  AppMenus({this.icon, this.iconId, this.title, this.type});

  AppMenus.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    iconId = json['iconId'];
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['iconId'] = this.iconId;
    data['title'] = this.title;
    data['type'] = this.type;
    return data;
  }
}

class Departs {
  String address;
  String createBy;
  String createTime;
  String delFlag;
  String departName;
  String departNameAbbr;
  String departNameEn;
  int departOrder;
  String description;
  String fax;
  String id;
  String memo;
  String mobile;
  String officeType;
  String orgCode;
  String orgType;
  String parentId;
  String status;
  String updateBy;
  String updateTime;

  Departs(
      {this.address,
      this.createBy,
      this.createTime,
      this.delFlag,
      this.departName,
      this.departNameAbbr,
      this.departNameEn,
      this.departOrder,
      this.description,
      this.fax,
      this.id,
      this.memo,
      this.mobile,
      this.officeType,
      this.orgCode,
      this.orgType,
      this.parentId,
      this.status,
      this.updateBy,
      this.updateTime});

  Departs.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    createBy = json['createBy'];
    createTime = json['createTime'];
    delFlag = json['delFlag'];
    departName = json['departName'];
    departNameAbbr = json['departNameAbbr'];
    departNameEn = json['departNameEn'];
    departOrder = json['departOrder'];
    description = json['description'];
    fax = json['fax'];
    id = json['id'];
    memo = json['memo'];
    mobile = json['mobile'];
    officeType = json['officeType'];
    orgCode = json['orgCode'];
    orgType = json['orgType'];
    parentId = json['parentId'];
    status = json['status'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['createBy'] = this.createBy;
    data['createTime'] = this.createTime;
    data['delFlag'] = this.delFlag;
    data['departName'] = this.departName;
    data['departNameAbbr'] = this.departNameAbbr;
    data['departNameEn'] = this.departNameEn;
    data['departOrder'] = this.departOrder;
    data['description'] = this.description;
    data['fax'] = this.fax;
    data['id'] = this.id;
    data['memo'] = this.memo;
    data['mobile'] = this.mobile;
    data['officeType'] = this.officeType;
    data['orgCode'] = this.orgCode;
    data['orgType'] = this.orgType;
    data['parentId'] = this.parentId;
    data['status'] = this.status;
    data['updateBy'] = this.updateBy;
    data['updateTime'] = this.updateTime;
    return data;
  }
}

class Roles {
  String bizScope;
  String createBy;
  String createTime;
  String dataScope;
  String description;
  String id;
  String isSys;
  String orgCode;
  String roleCode;
  String roleName;
  String roleType;
  String updateBy;
  String updateTime;

  Roles(
      {this.bizScope,
      this.createBy,
      this.createTime,
      this.dataScope,
      this.description,
      this.id,
      this.isSys,
      this.orgCode,
      this.roleCode,
      this.roleName,
      this.roleType,
      this.updateBy,
      this.updateTime});

  Roles.fromJson(Map<String, dynamic> json) {
    bizScope = json['bizScope'];
    createBy = json['createBy'];
    createTime = json['createTime'];
    dataScope = json['dataScope'];
    description = json['description'];
    id = json['id'];
    isSys = json['isSys'];
    orgCode = json['orgCode'];
    roleCode = json['roleCode'];
    roleName = json['roleName'];
    roleType = json['roleType'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bizScope'] = this.bizScope;
    data['createBy'] = this.createBy;
    data['createTime'] = this.createTime;
    data['dataScope'] = this.dataScope;
    data['description'] = this.description;
    data['id'] = this.id;
    data['isSys'] = this.isSys;
    data['orgCode'] = this.orgCode;
    data['roleCode'] = this.roleCode;
    data['roleName'] = this.roleName;
    data['roleType'] = this.roleType;
    data['updateBy'] = this.updateBy;
    data['updateTime'] = this.updateTime;
    return data;
  }
}
