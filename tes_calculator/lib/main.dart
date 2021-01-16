import 'package:flutter/material.dart';
import 'package:tes_calculator/Pages/calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'ProductSans',
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(elevation: 0, foregroundColor: Colors.white),
        accentColor: Colors.black87,
        textTheme: TextTheme(
          headline5: TextStyle(fontSize: 22.0, color: Colors.black, height: 1.3),
          headline4: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Color(0xFFCCCCCC), height: 1.1),
          headline3: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w700, color: Color(0xDD000000), height: 1.3),
          headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: Color(0xFF859566), height: 1.3),
          headline1: TextStyle(fontSize: 80.0, fontWeight: FontWeight.w300, color: Color(0xFF456268), height: 1.4),
          subtitle1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Color(0xFFCCCCCC), height: 1.3),
          headline6: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700, color: Color(0xFFCCCCCC), height: 1.2),
          bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xFFCCCCCC), height: 1.2),
          bodyText1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: Color(0xFFCCCCCC), height: 1.2),
          caption: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Color(0xFFCCCCCC), height: 1.2),
        ),
      ),
      home: Caculator(),
    );
  }
}
