import 'package:flutter/material.dart';

class HoldingsCards extends StatelessWidget {
  final String amount;
  final String title;
  final Image image;
  final String subTitle;
  final TabController? tabcontroller;

  HoldingsCards({
    required this.amount,
    required this.title,
    required this.image,
    this.subTitle = '',
    this.tabcontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 10.0,
        left: 10.0,
        right: 30.0,
      ),
      child: Container(
        width: 300.0,
        height: 175.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5.0,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  left: 5.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    image,
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      subTitle,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17.0,
                      ),
                    ),
                    // TabBar(
                    //   controller: tabcontroller,
                    //   isScrollable: true,
                    //   labelColor: AppColors.appColor,
                    //   unselectedLabelColor: Colors.grey,
                    //   indicatorColor: AppColors.appColor,
                    //   labelStyle: TextStyle(
                    //     fontSize: 10.0,
                    //     fontWeight: FontWeight.bold,
                    //     color: AppColors.appColor,
                    //   ),
                    //   tabs: <Widget>[
                    //     Tab(text: "Dashboard"),
                    //     Tab(text: "Send"),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HoldingsCardsGradient extends StatelessWidget {
  final String amount;
  final String title;
  final Image image;
  final TextStyle? amountStyle;
  final String subTitle;
  final TabController? tabcontroller;

  HoldingsCardsGradient({
    required this.amount,
    required this.title,
    required this.image,
    this.amountStyle,
    this.subTitle = '',
    this.tabcontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 10.0,
        left: 10.0,
        right: 30.0,
      ),
      child: Container(
        width: 300.0,
        height: 175.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue,
              Colors.green,
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5.0,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  left: 5.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    image,
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      subTitle,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17.0,
                      ),
                    ),
                    // TabBar(
                    //   controller: tabcontroller,
                    //   isScrollable: true,
                    //   labelColor: AppColors.appColor,
                    //   unselectedLabelColor: Colors.grey,
                    //   indicatorColor: AppColors.appColor,
                    //   labelStyle: TextStyle(
                    //     fontSize: 10.0,
                    //     fontWeight: FontWeight.bold,
                    //     color: AppColors.appColor,
                    //   ),
                    //   tabs: <Widget>[
                    //     Tab(text: "Dashboard"),
                    //     Tab(text: "Send"),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
