import 'package:flutter/material.dart';
import 'package:untitled1/utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final double toolbarHeight;

  CustomAppBar({
    this.toolbarHeight = 20.0,
  }) : preferredSize = Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: toolbarHeight,
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
    );
  }
}
