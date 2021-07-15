import 'package:flutter/material.dart';

class HoldingsCards extends StatelessWidget {
  final String amount;
  final String title;
  final Image image;
  final Decoration? decoration;
  final TextStyle? style;
  final TextStyle? amountStyle;
  final Icon? icon;
  final String subTitle;
  final TabController? tabcontroller;

  HoldingsCards({
    required this.amount,
    required this.title,
    required this.image,
    this.decoration,
    this.style,
    this.amountStyle,
    this.icon,
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
        decoration: decoration,
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
                      style: style,
                    ),
                    Icon(
                      Icons.more_horiz,
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
                      style: amountStyle,
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
