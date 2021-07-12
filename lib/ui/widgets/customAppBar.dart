import 'package:flutter/material.dart';
import 'package:untitled1/utils/constants.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final double toolbarHeight;

  CustomAppBar({
    this.toolbarHeight = 20.0,
  }) : preferredSize = Size.fromHeight(toolbarHeight);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 11, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: widget.toolbarHeight,
        title: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'mercury.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0),
              ),
              Text(
                'cash',
                style: TextStyle(
                    color: AppColors.appColor,
                    fontSize: 25.0,
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
        bottom: TabBar(
          controller: _tabcontroller,
          isScrollable: true,
          labelColor: AppColors.appColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: AppColors.appColor,
          labelStyle: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: AppColors.appColor),
          tabs: <Widget>[
            Tab(
              text: "Dashboard",
            ),
            Tab(
              text: "Send",
            ),
            Tab(
              text: "Batch Send",
            ),
            Tab(
              text: "Deposit",
            ),
            Tab(
              text: "Buy/Sell",
            ),
            Tab(
              text: "Wallets",
            ),
            Tab(
              text: "Contacts",
            ),
            Tab(
              text: "Statements",
            ),
            Tab(
              text: "Transactions",
            ),
            Tab(
              text: "Settings",
            ),
            Tab(
              text: "Referral",
            ),
          ],
        ),
      ),
    );
  }
}
