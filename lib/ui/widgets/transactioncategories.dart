import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedCategoryIndex = 0;

  Widget _buildCategory(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategoryIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(right: 0, left: 0),
        child: Container(
          width: size.width * 0.20,
          decoration: BoxDecoration(
              color: selectedCategoryIndex == index
                  ? Color(0xff2FC3C5)
                  : Colors.white,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              categoryList[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedCategoryIndex == index
                      ? Colors.white
                      : Color(0xff2FC3C5)),
            ),
          ),
        ),
      ),
    );
  }

  final categoryList = [
    'All',
    'In',
    'Out',
    'Buy',
    'Sell',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
      child: Container(
        height: size.height * 0.04,
        color: Colors.white,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return _buildCategory(context, index);
            }),
      ),
    );
  }
}
