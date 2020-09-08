import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('组件基础'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _ListItem(title: '1',),
            _ListItem(title: '2',),
            _ListItem(title: '3',),
            _ListItem(title: '4',),
            _ListItem(title: '5',),
            _ListItem(title: '6',),
          ],
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {

  final String title;

  const _ListItem({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final vpSize = MediaQuery.of(context).size;

    return Card(
      child: Container(
        height: 45,
        alignment: Alignment.center,
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            width: vpSize.width,
            height: 45,
            color: Colors.teal,
            child: Text("$title"),
          ),
          onTap: () {
            print(title);
          },
        )
      ),
    );
  }
}