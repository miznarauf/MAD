import 'package:flutter/material.dart';

class Fly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fly'),
      ),
      body: SafeArea(
        child: Hero(
          tag: 'format_paint',
          child: Icon(
            Icons.format_paint,
            color: Colors.lightGreen,
            size: 120.0,
          ),
        ),
      ),
    );
  }
}
