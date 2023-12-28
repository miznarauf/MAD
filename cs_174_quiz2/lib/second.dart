import 'package:flutter/material.dart';
import 'widgets.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child: Hero(
            tag: 'imageTag',
            child: Image.asset('assets/image.png'),
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
      drawer: MyDrawer(),
    );
  }
}
