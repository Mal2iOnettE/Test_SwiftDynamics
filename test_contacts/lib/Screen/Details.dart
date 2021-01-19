import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String name;
  final String surname;
  final String phone;
  final String email;

  const Details({Key key, this.name, this.surname, this.phone, this.email}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Container(
        width: double.infinity,
        height: 500.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                
              ),
                Text(
                  'NAME: ${widget.name}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  'SURNAME: ${widget.surname}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  'EMAIL: ${widget.email}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  'PHONE: ${widget.phone}',
                  style: Theme.of(context).textTheme.headline2,
                ),
            ],
          ),
              )),
        ),
      ),
    );
  }
}
