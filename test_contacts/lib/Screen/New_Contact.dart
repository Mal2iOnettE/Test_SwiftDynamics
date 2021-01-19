import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNewContact extends StatefulWidget {
  AddNewContact({Key key}) : super(key: key);

  @override
  _AddNewContactState createState() => _AddNewContactState();
}

class _AddNewContactState extends State<AddNewContact> {
  final name = TextEditingController();
  final surname = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('userInfo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add item"),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: "Name"),
                    controller: name,
                  ),
                  Padding(padding: const EdgeInsets.all(10)),
                  TextField(
                    decoration: InputDecoration(labelText: "Surname"),
                    controller: surname,
                  ),
                  Padding(padding: const EdgeInsets.all(10)),
                  TextField(
                    decoration: InputDecoration(labelText: "phone"),
                    controller: phone,
                  ),
                  Padding(padding: const EdgeInsets.all(10)),
                  TextField(
                    decoration: InputDecoration(labelText: "email"),
                    controller: email,
                  ),
                  Padding(padding: const EdgeInsets.all(10)),
                  RaisedButton(
                    child: Text("Add items"),
                    onPressed: () {
                      if (name.text == "" || surname.text == "") {
                      } else {
                        addNew(
                            context,
                            {
                              "name": name.text,
                              "surname": surname.text,
                              "phone": phone.text,
                              "email": email.text,
                            },
                            name.text);
                        name.text = "";
                        surname.text = "";
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  Future<void> addNew(BuildContext context, Map<String, dynamic> data, String documentName) {
    return FirebaseFirestore.instance.collection("userInfo").doc(documentName).set(data).then((returnData) {}).catchError((e) {
      e(e);
    });
  }
}
