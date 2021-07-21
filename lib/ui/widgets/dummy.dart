import 'package:flutter/material.dart';
import 'package:untitled1/utils/constants.dart';

class Dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 150.0),
          DashItems(item: 'Dashboard'),
          SizedBox(width: 5.0),
          DashItems(item: 'Send'),
          SizedBox(width: 5.0),
          DashItems(item: 'Batch Send'),
          SizedBox(width: 5.0),
          DashItems(item: 'Deposit'),
          SizedBox(width: 5.0),
          DashItems(item: 'Buy/Sell'),
          SizedBox(width: 5.0),
          DashItems(item: 'Wallets'),
          SizedBox(width: 5.0),
          DashItems(item: 'Contacts'),
          SizedBox(width: 5.0),
          DashItems(item: 'Statements'),
          SizedBox(width: 5.0),
          DashItems(item: 'Transactions'),
          SizedBox(width: 5.0),
          DashItems(item: 'Settings'),
          SizedBox(width: 5.0),
          DashItems(item: 'Referral'),
          SizedBox(width: 50.0),
        ],
      ),
    );
  }

  final List<String> list = [
    'Dashboard',
    'Send',
    'Batch Send',
    'Deposit',
    'Buy/Sell',
    'Wallets',
    'Contacts',
    'Statements',
    'Transactions',
    'Settings',
    'Referral',
  ];
}

class DashItems extends StatefulWidget {
  final String item;

  DashItems({required this.item});

  @override
  _DashItemsState createState() => _DashItemsState();
}

class _DashItemsState extends State<DashItems> {
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: selectedCategoryIndex == list.indexOf(widget.item)
              ? AppColors.appColor
              : Colors.white,
          width: 3.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.item,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: selectedCategoryIndex == list.indexOf(widget.item)
                ? AppColors.appColor
                : Colors.grey,
          ),
        ),
      ),
    );
  }

  final List<String> list = [
    'Dashboard',
    'Send',
    'Batch Send',
    'Deposit',
    'Buy/Sell',
    'Wallets',
    'Contacts',
    'Statements',
    'Transactions',
    'Settings',
    'Referral',
  ];
}
