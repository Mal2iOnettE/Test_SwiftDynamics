import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_contacts/Screen/New_Contact.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  QuerySnapshot querySnapshot;
  List<String> name = List<String>();

  final databaseRef = FirebaseFirestore.instance;
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  CollectionReference users = FirebaseFirestore.instance.collection('userInfo');
  @override
  void initState() {
    //getLawyerList();
    getUserInfo();
    setState(() {
      getData();
    });
    super.initState();
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {});
    _refreshController.refreshCompleted();
  }

  getUserInfo() {
    FirebaseFirestore.instance.collection('userInfo').get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            print("get user: " + doc["name"]);
            name.add(doc["name"]);
            print(name);
          })
        });
  }

  Widget getData() {
    return ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index) {
          return Card(
            child: FutureBuilder(
              future: users.doc('${name[index].toString()}').get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                } else if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data = snapshot.data.data();
                  return ListTile(
                    onTap: () {},
                    title: Text(
                      "Name: ${data["name"]}",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      "Descriptions: ${data["email"]}",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  );
                }

                return Center(child: Text("loading..."));
              },
            ),
          );
        });
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
        body: SmartRefresher(
          enablePullDown: true,
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: ListView.builder(
              itemCount: name.length,
              itemBuilder: (context, index) {
                return Card(
                  child: FutureBuilder(
                    future: users.doc('${"${name[index].toString()}"}').get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("Something went wrong");
                      } else if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data = snapshot.data.data();
                        return ListTile(
                          onTap: () {},
                          title: Text(
                            "Name: ${data["name"]}",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          subtitle: Text(
                            "Descriptions: ${data["description"]}",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        );
                      }

                      return Center(child: Text("loading..."));
                    },
                  ),
                );
              }),
        )
        );
  }
}
