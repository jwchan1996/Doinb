import 'package:doinb/utils/http.dart';

// 接口地址类
class Api {
  static final String _baseUrl = 'https://api.github.com';

  static getUser(String name) {
    return HttpUtils.get('$_baseUrl/users/$name');
  }
}