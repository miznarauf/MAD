import 'package:cs_174_quiz2/tabbedPage.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'second.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/second': (context) => SecondPage(),
        '/tabbed': (context) => TabbedPage(),
      },
    );
  }
}
