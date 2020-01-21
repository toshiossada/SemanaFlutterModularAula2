import 'package:flutter/material.dart';

class OtherPage extends StatefulWidget {
  final String name;
  OtherPage({Key key, this.name}) : super(key: key);

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Page'),
      ),
      body: Center(
        child: Text('Nome: ${widget.name}'),
      ),
    );
  }
}
