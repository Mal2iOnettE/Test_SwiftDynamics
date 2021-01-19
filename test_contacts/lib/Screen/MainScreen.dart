import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_contacts/Screen/Details.dart';
import 'package:test_contacts/Screen/New_Contact.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    //getLawyerList();
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddNewContact()));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text("User Profile"),
          backgroundColor: Theme.of(context).accentColor,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('userInfo').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<DocumentSnapshot> documents = snapshot.data.docs;
                return ListView(
                    children: documents
                        .map((doc) => Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => Details(
                                            name: doc['name'],
                                            surname: doc['surname'],
                                            email: doc['email'],
                                            phone: doc['phone'],
                                          )));
                                },
                                title: Text(
                                  doc['name'],
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                subtitle: Text(
                                  doc['email'],
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            ))
                        .toList());
              } else if (snapshot.hasError) {
                return Text('Its Error!');
              }
            }));
  }
}
