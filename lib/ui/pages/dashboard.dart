import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled1/ui/widgets/transactioncategories.dart';
import 'package:untitled1/utils/constants.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
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
      appBar: AppBar(
        toolbarHeight: 60.0,
        title: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'mercury.',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0),
              ),
              Text(
                'cash',
                style: TextStyle(
                    color: AppColors.appColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0),
              ),
            ],
          ),
        ),
        leading: Icon(
          Icons.message,
          color: AppColors.appColor,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none_sharp,
              color: Colors.grey[300],
              size: 25.0,
            ),
            onPressed: () {},
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, bottom: 50.0, left: 20.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 150.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                              colors: [Colors.pinkAccent, Colors.purple],
                              begin: Alignment.topLeft,
                              end: Alignment.topRight),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 5.0,
                                offset: Offset(0, 5))
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 10.0),
                            child: Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/mercury_logo.png'),
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  'Total Holdings (USD)',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 25.0, left: 15.0),
                            child: Text(
                              'A 265,498,446,545.00',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
                child: Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Recent Transactions',
                  style: TextStyle(
                    color: AppColors.appColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            )),
            Categories(),
            Container(
              height: 270.0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    Text('Hi'),
                    Text('Hi'),
                    Text('Hi'),
                    Text('Hi'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MaterialButton(
                color: AppColors.appColor,
                shape: const StadiumBorder(),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        )),
                    Text(
                      'Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TileInfo {
  final String HoldingName;
  final String Amount;
  final Color startColor;
  final Color endColor;

  TileInfo(this.HoldingName, this.Amount, this.startColor, this.endColor);
}
