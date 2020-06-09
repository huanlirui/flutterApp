import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/pages/user/Login.dart';

const BaseRoot = "http://192.168.1.253:8080/jeecg-boot/";

/*
 * 封装 restful 请求
 *
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */
class DioUtils {
  /// global dio object
  static Dio dio;

  /// default options
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  /// 创建 dio 实例对象
  static Dio createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
          connectTimeout: 150000,
          receiveTimeout: 150000,
          responseType: ResponseType.json,
          validateStatus: (status) {
            // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
            return true;
          },
          baseUrl: BaseRoot,
          headers: httpHeaders);

      dio = new Dio(options);
    }

    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }

  /// request Get、Post 请求
  //url 请求链接
  //parameters 请求参数
  //method 请求方式
  //onSuccess 成功回调
  //onError 失败回调
  static void requestHttp<T>(String url,
      {parameters,
      method,
      Function(Map t) onSuccess,
      Function(String error) onError}) async {
    parameters = parameters ?? {};
    method = method ?? 'GET';
    //参数处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    try {
      Response response;
      Dio dio = createInstance();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = await prefs.getString('token');
      dio.options.headers['token'] = token ?? '';
      dio.options.headers['Authorization'] = 'Bearer ' + (token ?? '');

      if (method == DioUtils.GET) {
        response = await dio.get(url, queryParameters: parameters);
      } else if (method == DioUtils.POST) {
        response = await dio.post(url, data: parameters);
      }

      var responseData = response.data;

      if (response.statusCode == 200) {
        if (response.statusCode == 700) {
          Router.navigatorKey.currentState
              .pushNamedAndRemoveUntil("/login", ModalRoute.withName("/"));
          onError('token过期,请重新登录');
        } else if (responseData['code'] == 200 || responseData['success']) {
          if (onSuccess != null) {
            var result = responseData['result'];
            onSuccess(result);
          }
        } else {
          onError(responseData['message']);
        }
      } else {
        throw Exception('${responseData['message']}');
      }
      // print('响应数据：' + response.toString());
    } catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
    }
  }
}

/// 自定义Header
Map<String, dynamic> httpHeaders = {
  'Accept': 'application/json,*/*',
  'Content-Type': 'application/json',
  // 'token': DioUtils.TOKEN,
  // 'Authorization': 'Bearer ${DioUtils.TOKEN}'
};

//https://github.com/flutterchina/dio/blob/master/README-ZH.md

// 使用
// var param = {
//       'taskCode ': 'XC202001020003'};
//     DioUtils.requestHttp(
//       Api.verificationSurvey,
//       parameters: param,
//       method:DioUtils.GET,
//       onSuccess: (data) {

//       },
//       onError: (error) {

//       },
//     );
//   }
class Router {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
}
