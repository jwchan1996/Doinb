import 'package:dio/dio.dart';
import 'package:doinb/utils/toast.dart';
import 'dart:convert';

Map<String, dynamic> optHeader = {
  'accept-language': 'zh-cn',
  'content-type': 'application/json'
};

var dio = new Dio(BaseOptions(connectTimeout: 15000, headers: optHeader));

class HttpUtils {

  static get(
      String url, {
        Map<String, dynamic> params,
      }) async {
    try {
      var response;
      print(url);
      if (params != null) {
        response = await dio.get(url, queryParameters: params);
      } else {
        response = await dio.get(url);
      }
      return jsonDecode(response.toString());
    } catch (exception) {
      showErrorSnackBar('网络似乎出了一点问题');
      print('http request fail: $url ==> $exception');
      return jsonDecode(jsonEncode({'status': false}).toString());
    }
  }

  static post(
      String url,
      Map<String, dynamic> params
      ) async {
    try {
      var response = await dio.post(url, data: params);
      return jsonDecode(response.toString());
    } catch (exception) {
      showErrorSnackBar('网络似乎出了一点问题');
      print('http request fail: $url ==> $exception');
      return jsonDecode(jsonEncode({'status': false}).toString());
    }
  }
}
