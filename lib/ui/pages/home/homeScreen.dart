import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/ui/pages/home/dashboard.dart';
import 'package:untitled1/ui/widgets/customRepeatingTexts.dart';
import 'package:untitled1/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 12, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 130.0,
        title: Container(
          color: Colors.white,
          child: ApplicationName(),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.message,
            color: AppColors.appColor,
          ),
          onPressed: () {
            final snackBar = SnackBar(
              content: Text('Feature coming soon...'),
              backgroundColor: AppColors.appColor,
              duration: const Duration(seconds: 1),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none_sharp,
              color: Colors.grey[300],
              size: 25.0,
            ),
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('Feature coming soon...'),
                backgroundColor: AppColors.appColor,
                duration: const Duration(seconds: 1),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 130.0),
            child: TabBar(
              controller: _tabcontroller,
              isScrollable: true,
              labelColor: AppColors.appColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColors.appColor,
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppColors.appColor,
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: 5.0),
              tabs: <Widget>[
                Tab(text: " "),
                Tab(text: "Dashboard"),
                Tab(text: "Send"),
                Tab(text: "Batch Send"),
                Tab(text: "Deposit"),
                Tab(text: "Buy/Sell"),
                Tab(text: "Wallets"),
                Tab(text: "Contacts"),
                Tab(text: "Statements"),
                Tab(text: "Transactions"),
                Tab(text: "Settings"),
                Tab(text: "Referral"),
              ],
            ),
          ),
        ),

        // bottom: TabBar(
        //   controller: _tabcontroller,
        //   isScrollable: true,
        //   labelColor: AppColors.appColor,
        //   unselectedLabelColor: Colors.grey,
        //   indicatorColor: AppColors.appColor,
        //   labelStyle: TextStyle(
        //     fontSize: 15.0,
        //     fontWeight: FontWeight.bold,
        //     color: AppColors.appColor,
        //   ),
        //   tabs: <Widget>[
        //     Tab(text: "Dashboard"),
        //     Tab(text: "Send"),
        //     Tab(text: "Batch Send"),
        //     Tab(text: "Deposit"),
        //     Tab(text: "Buy/Sell"),
        //     Tab(text: "Wallets"),
        //     Tab(text: "Contacts"),
        //     Tab(text: "Statements"),
        //     Tab(text: "Transactions"),
        //     Tab(text: "Settings"),
        //     Tab(text: "Referral"),
        //   ],
        // ),
      ),
      body: DefaultTabController(
        length: 12,
        child: TabBarView(
          controller: _tabcontroller,
          children: [
            Container(),
            Dashboard(),
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
          ],
        ),
      ),
    );
  }
}
