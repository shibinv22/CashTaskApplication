import 'package:flutter/material.dart';
import 'package:untitled1/model/recentTransactions.dart';
import 'package:untitled1/network/api.dart';
import 'package:untitled1/ui/widgets/holdingsCards.dart';
import 'package:untitled1/ui/widgets/customWidgets.dart';
import 'package:untitled1/ui/widgets/transactionCategories.dart';
import 'package:untitled1/utils/constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ApiService api = ApiService();
  late Future<RecentTransactions> recentTransactions;

  @override
  void initState() {
    super.initState();
    recentTransactions = getRecentTransactions();
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
                    HoldingsCards(),
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
            child: FutureBuilder<RecentTransactions>(
              future: recentTransactions,
              builder: (context, AsyncSnapshot<RecentTransactions> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data == null &&
                    snapshot.hasData) {
                  List<RecentTransactions> recent = <RecentTransactions>[];
                  for (int i = 0; i < 100; i++) {
                    recent.add(
                      RecentTransactions(
                        data: [
                          Datum(
                            currency: snapshot.data?.data![i].currency,
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView(
                    children: recent
                        .map((e) => userRecentTransactions(e.data![0]))
                        .toList(),
                  );
                } else {
                  return Loading();
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
            child: CustomButton(
              text: 'Profile',
              padding: 15.0,
              onPressed: () {
                print('Profile clicked...');
              },
            ),
          ),
        ],
      ),
    );
  }

  getRecentTransactions() async {
    var res = await api.userRecentTransactions();
    print(res);
  }
}

Widget userRecentTransactions(data) {
  return ListView.builder(
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Column(
          children: [
            Text(data.currency),
          ],
        ),
      );
    },
  );
}
