import 'package:flutter/material.dart';
import 'package:doinb/api/api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

  // http数据存储
  Map _user = {};
  // 页面是否已经加载数据请求标志位
  bool _request = false;
  // 正在请求标志位
  bool _loading = false;
  // http数据请求完成标志位
  bool _data = false;
  // http请求错误标志位
  bool _error = false;
  // 搜索用户名
  String _username;

  void _getUser() async {

    if(_loading){
      return;
    }

    setState(() {
      _loading = true;
    });

    print('获取数据');
    final res = await Api.getUser(_username);

    print(res);
    print(res['login']);
    print(res['status']);

    if(res['status'] == 200 || res['status'] == null){
      setState(() {
        _data = true;
        _user = res;
//        _user['avatar_url'] = 'https://cdn.jsdelivr.net/gh/jwchan1996/blog@gh-pages/logo.png';
      });
      print(_user);
    }else{
      setState(() {
        _error = true;
        _user = res;
      });
    }

    setState(() {
      _loading = false;
    });

  }

  // 重试
  void _onRetry() {
    setState(() {
      _user = {};
      _request = true;
      _data = false;
      _error = false;
    });
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    final login = _user['login'] == null ? '无' : _user['login'];
    final name = _user['name'] == null ? '无' : _user['name'];
    final blog = _user['blog'] == null ? '无' : _user['blog'];
    final company = _user['company'] == null ? '无' : _user['company'];
    final location = _user['location'] == null ? '无' : _user['location'];
    final avatar = _user['avatar_url'] == null ? '' : _user['avatar_url'];

    return Scaffold(
      appBar: AppBar(title: Text('搜索'), centerTitle: true),
      // 这里使用 SingleChildScrollView 是为了避免键盘弹出导致布局溢出的警告
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "Github用户名",
                prefixIcon: Icon(Icons.person),
              ),
              onChanged: (value) {
                this.setState(() {
                  this._username = value;
                });
              },
            ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text('搜索'),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: _onRetry,
            ),
            _error ?
            Image(
              image: NetworkImage(
                  'https://cdn.jsdelivr.net/gh/cliclitv/clicli-dark@master/assets/error.png'),
              width: 100.0,
            ) :
            !_data ?
              (
                _request ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SpinKitDoubleBounce(color: Colors.teal),
                  ],
                ) :
                Text(
                    ''
                )
              ) :
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.palette,
                      color: Colors.teal,
                    ),
                    Text(
                        '用户名: $login'
                    ),
                  ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.palette,
                        color: Colors.teal,
                      ),
                      Text(
                          '昵称: $name'
                      ),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.palette,
                        color: Colors.teal,
                      ),
                      Text(
                          'blog: $blog'
                      ),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.palette,
                        color: Colors.teal,
                      ),
                      Text(
                          'company: $company'
                      ),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.palette,
                        color: Colors.teal,
                      ),
                      Text(
                          'location: $location'
                      ),
                    ]
                ),
                Image(
                  image: NetworkImage(
                      '$avatar'),
                  width: 100.0,
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}