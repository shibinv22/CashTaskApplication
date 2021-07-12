import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:untitled1/ui/pages/dashboard.dart';
import 'package:untitled1/ui/widgets/customAppBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var items = {
    TileInfo(
        'Total Holdings', '454,654,123', Color(0xff2FC3C5), Color(0xff2FC3C5)),
    TileInfo(
        'Total Holdings', '454,654,123', Color(0xff2FC3C5), Color(0xff2FC3C5)),
    TileInfo(
        'Total Holdings', '454,654,123', Color(0xff2FC3C5), Color(0xff2FC3C5)),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        toolbarHeight: 130.0,
      ),
      body: DefaultTabController(
        length: 11,
        child: TabBarView(children: [
          DashBoard(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
        ]),
      ),
    );
  }
}

class TileInfo {
  final String holdingName;
  final String amount;
  final Color startColor;
  final Color endColor;

  TileInfo(this.holdingName, this.amount, this.startColor, this.endColor);
}
