import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String name;

  const Details({Key key, this.name}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Card(
        child: ListTile(
          title: Text('${widget.name}'),
        ),
      ),
    );
  }
}
