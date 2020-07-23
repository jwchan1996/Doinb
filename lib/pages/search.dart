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
  // http数据请求完成标志位
  bool _data = true;
  // 用户名
  String _username;

  void _getUser() async {

    print('获取数据');
    final res = await Api.getUser(_username);

    print(res);
    print(res['login']);
    print(res['status']);

    if(res['status'] == 200 || res['status'] == null){
      setState(() {
        _data = true;
        _user = res;
      });
    }else{
      setState(() {
        _data = true;
        _user = res;
      });
    }

  }

  // 重试
  void _onRetry() {
    setState(() {
      _user = {};
      _data = false;
    });
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    final login = _user['login'] == null ? '' : _user['login'];
    final name = _user['name'] == null ? '' : _user['name'];
    final blog = _user['blog'] == null ? '' : _user['blog'];
    final company = _user['company'] == null ? '' : _user['company'];
    final location = _user['location'] == null ? '' : _user['location'];
    final avatar = _user['avatar_url'] == null ? '' : _user['avatar_url'];

    return Scaffold(
      appBar: AppBar(title: Text('搜索'), centerTitle: true),
      body: Center(
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
            !_data ?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitDoubleBounce(color: Colors.teal),
              ],
            ) :
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    '$login'
                ),
                Text(
                    '$name'
                ),
                Text(
                    '$blog'
                ),
                Text(
                    '$company'
                ),
                Text(
                    '$location'
                ),
                Image(
                  image: NetworkImage(
                      '$avatar'),
                  width: 100.0,
                )
              ],
            ),
          ]
        ),
      ),
    );
  }
}