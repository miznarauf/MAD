
import 'package:customscrollview_silvers/widgets/silver_app_bar.dart';
import 'package:customscrollview_silvers/widgets/silver_grid.dart';
import 'package:customscrollview_silvers/widgets/silver_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomScrollView Slivers'),
        elevation: 0.0,
      ),
    body: const CustomScrollView(
      slivers: <Widget>[
        SliverAppBarWidget(),
        SliverListWidget(),
        SliverGridWidget(),
      ],

    ),
    );
  }
}