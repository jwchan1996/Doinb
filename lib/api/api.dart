// 接口地址类

class Api {
  static final String _baseUrl = 'https://api.github.com';

  static String getUser(String name) {
      return '$_baseUrl/users/$name';
  }
}