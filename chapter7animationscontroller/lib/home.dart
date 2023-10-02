import 'package:flutter/material.dart';
import 'package:animationscontroller/widgets/animatedBallon.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get flexibleSpace => null;


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
            child: Column(
              children: <Widget>[
                AnimatedBalloonWidget(),
              ],
            ),
        ),
        );
    }
}