import 'package:flutter/material.dart';
import 'package:untitled1/model/recentTransactions.dart';
import 'package:untitled1/model/swipeCardsResponse.dart';
import 'package:untitled1/network/api.dart';
import 'package:untitled1/ui/widgets/customWidgets.dart';
import 'package:untitled1/ui/widgets/holdings.dart';
import 'package:untitled1/ui/widgets/transactionCategories.dart';
import 'package:untitled1/utils/constants.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ApiService api = ApiService();
  late Future<RecentTransactions>? recentTransactions;
  late Future<SwipeResponse>? swipeCards;

  List<String> list = [];
  int perPageItem = 1;
  late int pageCount;
  int selectedIndex = 0;
  late int lastPageItemLength;
  late PageController pageController;

  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    swipeCards = api.swipeCardsBalance();
    recentTransactions = api.userRecentTransactions();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0),
                child: Container(
                  height: size.height * 0.275,
                  child: FutureBuilder<SwipeResponse>(
                    future: swipeCards,
                    builder: (context, snapshot) {
                      if (snapshot.data != null && snapshot.hasData) {
                        List<SwipeResponse> balance = <SwipeResponse>[];
                        for (int i = 0; i < 1; i++) {
                          balance.add(
                            SwipeResponse(
                              data: BalanceDatum(
                                USD: snapshot.data!.data!.USD,
                                EUR: snapshot.data!.data!.EUR,
                                SGD: snapshot.data!.data!.SGD,
                                GBP: snapshot.data!.data!.GBP,
                                CLP: snapshot.data!.data!.CLP,
                                ARS: snapshot.data!.data!.ARS,
                                //
                                ETH: snapshot.data!.data!.ETH,
                                DASH: snapshot.data!.data!.DASH,
                                BTC: snapshot.data!.data!.BTC,
                                total: Total(),
                              ),
                            ),
                          );
                        }
                        return ListView(
                          children:
                              balance.map((e) => userBalance(e.data)).toList(),
                        );
                      } else {
                        return Loading(
                          text: 'Checking your holdings..Please wait',
                          color: Colors.purple,
                        );
                      }
                    },
                  ),
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
            ),
          ),
          Categories(),
          Container(
            height: size.height * 0.3,
            child: FutureBuilder<RecentTransactions>(
              future: recentTransactions,
              builder: (context, snapshot) {
                if (snapshot.data != null && snapshot.hasData) {
                  List<RecentTransactions> recent = <RecentTransactions>[];
                  for (int i = 0; i < snapshot.data!.data!.length; i++) {
                    recent.add(
                      RecentTransactions(
                        data: [
                          Datum(
                            currency: snapshot.data!.data![i].currency,
                            fee: snapshot.data!.data![i].fee,
                            source: snapshot.data!.data![i].source,
                            operationType:
                                snapshot.data!.data![i].operationType,
                            operationTotal:
                                snapshot.data!.data![i].operationTotal,
                            amountUsd: snapshot.data!.data![i].amountUsd,
                            status: snapshot.data!.data![i].status,
                            transactionId:
                                snapshot.data!.data![i].transactionId,
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
                  return Loading(
                    text: 'Loading  your transactions...',
                  );
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

  Widget userRecentTransactions(data) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RecentTransactionsTextField(
                      text: data.currency,
                    ),
                    SizedBox(width: 5.0),
                    RecentTransactionsTextField(
                      text: data.operationType,
                    ),
                  ],
                ),
                SizedBox(width: 5.0),
                Row(
                  children: [
                    RecentTransactionsTextField(
                      text: 'To : ',
                      fontSize: 10.0,
                    ),
                    SizedBox(width: 5.0),
                    RecentTransactionsTextField(
                      text: data.transactionId,
                      fontSize: 10.0,
                    ),
                  ],
                ),
                SizedBox(width: 5.0),
                RecentTransactionsTextField(
                  text: '(€CommentInputOrFileTitle)',
                  fontSize: 15.0,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    RecentTransactionsTextField(
                      text: data.operationTotal,
                      fontSize: 13.0,
                    ),
                    SizedBox(width: 3.0),
                    RecentTransactionsTextField(
                      text: data.currency,
                      fontSize: 13.0,
                    ),
                  ],
                ),
                Row(
                  children: [
                    RecentTransactionsTextField(
                      text: '\$',
                      fontSize: 10.0,
                    ),
                    SizedBox(width: 3.0),
                    RecentTransactionsTextField(
                      text: data.amountUsd,
                      fontSize: 10.0,
                    ),
                    SizedBox(width: 3.0),
                    RecentTransactionsTextField(
                      text: 'USD',
                      fontSize: 10.0,
                    ),
                  ],
                ),
                Row(
                  children: [
                    RecentTransactionsTextField(
                      text: (data.status == 1) ? 'Success' : 'Failure',
                      fontSize: 15.0,
                    ),
                    SizedBox(width: 3.0),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget userBalance(data) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        //Total holdings
        HoldingsCardsGradient(
          amount: '€ ' + data.EUR.toString(),
          title: ('Total Holdings (EUR)'),
          image: Image.asset(
            Images.eurWhite,
            height: 40.0,
            width: 40.0,
          ),
        ),
        //Euro Wallet
        HoldingsCards(
          amount: '€ ' + data.EUR.toString(),
          title: 'Euro Wallet',
          image: Image.asset(
            Images.eurGreen,
            height: 40.0,
            width: 40.0,
          ),
        ),
        //USD Wallet
        HoldingsCards(
          amount: '\$ ' + data.USD.toString(),
          title: 'USD Wallet',
          image: Image.asset(
            Images.dollar,
            height: 40.0,
            width: 40.0,
          ),
        ),
        //Ethereum
        HoldingsCards(
          amount: data.ETH.toString() + ' ETH',
          title: 'Ethereum',
          subTitle: '€ ' + data.EUR.toString(),
          image: Image.asset(
            Images.ethren,
            height: 40.0,
            width: 40.0,
          ),
        ),
        //Dash
        HoldingsCards(
          amount: data.DASH.toString() + ' DASH',
          title: 'Dash',
          subTitle: '€ ' + data.EUR.toString(),
          image: Image.asset(
            Images.dash,
            height: 40.0,
            width: 40.0,
          ),
        ),
        //Bitcoin
        HoldingsCards(
          amount: data.BTC.toString() + ' BTC',
          title: 'Bitcoin',
          subTitle: '€ ' + data.EUR.toString(),
          image: Image.asset(
            Images.bitcoin,
            height: 40.0,
            width: 40.0,
          ),
        ),
      ],
    ),
  );
}
