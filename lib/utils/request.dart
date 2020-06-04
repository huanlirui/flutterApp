import 'package:myapp/api/api.dart';
import 'package:dio/dio.dart';

getAction(url, data) async {
  try {
    Response response = await Dio().get(url, queryParameters: data);
    return response;
  } catch (e) {
    print(e);
  }
}

postAction(url, data) async {
  try {
    Response response = await Dio().post(url, queryParameters: data);
    return response;
  } catch (e) {
    print(e);
  }
}

//https://github.com/flutterchina/dio/blob/master/README-ZH.md