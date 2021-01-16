import 'package:flutter/material.dart';

class MainSreen extends StatefulWidget {
  final String title;

  const MainSreen({Key key, this.title}) : super(key: key);
  
  @override
  _MainSreenState createState() => _MainSreenState();
}

class _MainSreenState extends State<MainSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),

    );
  }
}
