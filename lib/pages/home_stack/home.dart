import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _onSearch() {
    Navigator.pushNamed(context, '/search');
  }

  void _onGithubUser() {
    Navigator.pushNamed(context, '/github_user');
  }

  void _onGetUserMedia() {
    Navigator.pushNamed(context, '/get_user_media');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home主页面'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '这里是home主页面',
            ),
            RaisedButton.icon(
              icon: Icon(Icons.search),
              label: Text('搜索'),
              onPressed: _onSearch,
            ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text('github_user'),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: _onGithubUser,
            ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text('getUserMedia'),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: _onGetUserMedia,
            )
          ],
        ),
      ),
    );
  }
}