import 'package:flutter/material.dart';
import 'package:doinb/api/api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GithubUserPage extends StatefulWidget {
  @override
  _GithubUserPageState createState() => _GithubUserPageState();
}

class _GithubUserPageState extends State<GithubUserPage> {
  @override
  void initState() {
    super.initState();
    _getUser();
  }

  // http数据存储
  Map _user = {};
  // http数据请求完成标志位
  bool _data = false;
  // http请求错误标志位
  bool _error = false;

  void _getUser() async {

    print('获取数据');
    final res = await Api.getUser('jwchan1996');

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
        _error = true;
        _user = res;
      });
    }

  }

  // 重试
  void _onRetry() {
    setState(() {
      _user = {};
      _data = false;
      _error = false;
    });
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    final name = _user['name'] == null ? '' : _user['name'];
    final blog = _user['blog'] == null ? '' : _user['blog'];

    return Scaffold(
      appBar: AppBar(title: Text('github_user'), centerTitle: true),
      body: Center(
        child:
          _error ?
          RaisedButton.icon(
            icon: Icon(Icons.refresh),
            label: Text('重试'),
            onPressed: _onRetry,
          ) :
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
                '$name'
              ),
              Text(
                '$blog'
              ),
            ],
          ),
      ),
    );
  }
}