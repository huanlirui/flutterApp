import 'package:dio/dio.dart';

getAction(url, data) async {
  try {
    Response response = await Dio().get(url, queryParameters: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

postAction(url, data) async {
  try {
    Response response = await Dio().post(url, queryParameters: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//https://github.com/flutterchina/dio/blob/master/README-ZH.md
