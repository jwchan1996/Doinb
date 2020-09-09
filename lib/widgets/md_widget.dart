import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MdWidget extends StatefulWidget {
  final String data;

  MdWidget(
    this.data, {
      Key key,
    } 
  ) : super(key: key);

  @override
  MdWidgetState createState() => MdWidgetState();
}

class MdWidgetState extends State<MdWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: widget.data,
      styleSheet: MarkdownStyleSheet(
        code: TextStyle(
          color: Colors.black87,
          backgroundColor: Color(0xfff2f2f2)
        ),
        blockquote: TextStyle(color: Colors.blue),
        codeblockPadding: const EdgeInsets.all(8.0),
        codeblockDecoration: BoxDecoration(
          color: Color(0xfff2f2f2),
          borderRadius: BorderRadius.circular(2.0),
        ),
      ),
    );
  }
}