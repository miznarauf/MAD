import 'package:flutter/material.dart';
import 'widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/second');
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
