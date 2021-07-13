import 'package:flutter/material.dart';
import 'package:untitled1/network/api.dart';
import 'package:untitled1/ui/pages/holdingCards.dart';
import 'package:untitled1/ui/widgets/customWidgets.dart';
import 'package:untitled1/ui/widgets/transactionCategories.dart';
import 'package:untitled1/utils/constants.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final ApiService api = ApiService();

  @override
  void initState() {
    super.initState();
    getRecentTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 30.0, bottom: 50.0, left: 20.0),
                child: Stack(
                  children: [
                    HoldingCards(),
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
                children: [],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
            child: CustomButton(
              text: 'Profile',
              padding: 15.0,
              onPressed: getRecentTransactions,
            ),
          ),
        ],
      ),
    );
  }

  void getRecentTransactions() async {
    var res = await api.userRecentTransactions();
    print(res);
  }
}
