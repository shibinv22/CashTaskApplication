import 'package:flutter/material.dart';
import 'package:untitled1/utils/constants.dart';

class DashboardCategories extends StatefulWidget {
  @override
  _DashboardCategoriesState createState() => _DashboardCategoriesState();
}

class _DashboardCategoriesState extends State<DashboardCategories> {
  int selectedCategoryIndex = 0;

  Widget _buildCategory(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategoryIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          decoration: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: selectedCategoryIndex == index
                  ? AppColors.appColor
                  : Colors.white,
              width: 3.0,
            ),
            insets: EdgeInsets.only(
              top: 30.0,
              left: 5.0,
            ),
          ),
          child: Center(
            child: Text(
              list[index],
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: selectedCategoryIndex == index
                    ? AppColors.appColor
                    : Colors.grey,
              ),
            ),
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 130),
      child: Padding(
        padding: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
        child: Container(
          height: size.height * 0.04,
          color: Colors.white,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return _buildCategory(context, index);
              }),
        ),
      ),
    );
  }
}
