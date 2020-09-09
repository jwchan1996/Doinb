import 'package:flutter/material.dart';

class MyListItem extends StatelessWidget {
  final String title;
  final String route;

  const MyListItem({Key key, this.title, this.route}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 50,
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(5, 8, 5, 8),
          child: RaisedButton(
            child: Text('$title',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14.0,
                )),
            color: Color(0xffecf5ff),
            highlightColor: Colors.blue[100],
            splashColor: Color(0xff409eff),
            onPressed: () {
              Navigator.pushNamed(context, '$route');
            },
          )),
    );
  }
}