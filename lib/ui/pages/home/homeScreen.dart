import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:untitled1/ui/pages/home/dashboard.dart';
import 'package:untitled1/ui/widgets/customRepeatingTexts.dart';
import 'package:untitled1/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late PageController pageController;

  int currentSelection = 1;
  double selectorPositionX = 16.0;
  final double selectorWidth = 30;

  bool colorTab = false;

  GlobalKey _key1 = GlobalKey();
  GlobalKey _key2 = GlobalKey();
  GlobalKey _key3 = GlobalKey();
  GlobalKey _key4 = GlobalKey();
  GlobalKey _key5 = GlobalKey();
  GlobalKey _key6 = GlobalKey();
  GlobalKey _key7 = GlobalKey();
  GlobalKey _key8 = GlobalKey();
  GlobalKey _key9 = GlobalKey();
  GlobalKey _key10 = GlobalKey();
  GlobalKey _key11 = GlobalKey();

  selectedItem(int id) {
    currentSelection = id;
    late GlobalKey selectedGlobalKey;
    switch (id) {
      case 1:
        selectedGlobalKey = _key1;
        break;
      case 2:
        selectedGlobalKey = _key2;
        break;
      case 3:
        selectedGlobalKey = _key3;
        break;
      case 4:
        selectedGlobalKey = _key4;
        break;
      case 5:
        selectedGlobalKey = _key5;
        break;
      case 6:
        selectedGlobalKey = _key6;
        break;
      case 7:
        selectedGlobalKey = _key7;
        break;
      case 8:
        selectedGlobalKey = _key8;
        break;
      case 9:
        selectedGlobalKey = _key9;
        break;
      case 10:
        selectedGlobalKey = _key10;
        break;
      case 11:
        selectedGlobalKey = _key11;
        break;

      default:
    }
    setWidgetPositionX(selectedGlobalKey);
    setState(() {});
  }

  setWidgetPositionX(GlobalKey selectedGlobalKey) {
    final RenderBox renderBox =
        selectedGlobalKey.currentContext!.findRenderObject() as RenderBox;
    final widgetPosition = renderBox.localToGlobal(Offset.zero);
    selectorPositionX = widgetPosition.dx;
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => setWidgetPositionX(_key1));
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 110.0,
        title: Container(
          color: Colors.white,
          child: ApplicationName(),
        ),
        elevation: 0.0,
        bottomOpacity: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.message,
            color: AppColors.appColor,
          ),
          onPressed: () {
            final snackBar = SnackBar(
              content: Text('Feature coming soon...'),
              backgroundColor: AppColors.appColor,
              duration: const Duration(seconds: 1),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none_sharp,
              color: Colors.grey[300],
              size: 25.0,
            ),
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('Feature coming soon...'),
                backgroundColor: AppColors.appColor,
                duration: const Duration(seconds: 1),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 55.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 12.0,
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 130),
                          FlatButton(
                            onPressed: () {
                              pageController.animateToPage(0,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            child: Container(
                              width: 100.0,
                              child: Column(
                                children: [
                                  InkWell(
                                    key: _key1,
                                    onTap: () {
                                      selectedItem(1);
                                      pageController.animateToPage(0,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease);
                                    },
                                    child: Text(
                                      'Dashboard',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: currentSelection == 1
                                              ? AppColors.appColor
                                              : Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10.0),
                                    decoration: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                        color: currentSelection == 1
                                            ? AppColors.appColor
                                            : Colors.white,
                                        width: 3.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              pageController.animateToPage(1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            child: Container(
                              width: 50.0,
                              child: Column(
                                children: [
                                  InkWell(
                                    key: _key2,
                                    onTap: () {
                                      selectedItem(2);
                                      pageController.animateToPage(1,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease);
                                    },
                                    child: Text(
                                      'Send',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: currentSelection == 2
                                              ? AppColors.appColor
                                              : Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10.0),
                                    decoration: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                        color: currentSelection == 2
                                            ? AppColors.appColor
                                            : Colors.white,
                                        width: 3.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              pageController.animateToPage(2,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            child: Container(
                              width: 110.0,
                              child: Column(
                                children: [
                                  InkWell(
                                    key: _key3,
                                    onTap: () {
                                      selectedItem(3);
                                      pageController.animateToPage(2,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease);
                                    },
                                    child: Text(
                                      'Batch Send',
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: currentSelection == 3
                                              ? AppColors.appColor
                                              : Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10.0),
                                    decoration: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                        color: currentSelection == 3
                                            ? AppColors.appColor
                                            : Colors.white,
                                        width: 3.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              pageController.animateToPage(3,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            child: Container(
                              width: 70.0,
                              child: Column(
                                children: [
                                  InkWell(
                                    key: _key4,
                                    onTap: () {
                                      selectedItem(4);
                                      pageController.animateToPage(3,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease);
                                    },
                                    child: Text(
                                      'Deposit',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: currentSelection == 4
                                              ? AppColors.appColor
                                              : Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10.0),
                                    decoration: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                        color: currentSelection == 4
                                            ? AppColors.appColor
                                            : Colors.white,
                                        width: 3.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              pageController.animateToPage(4,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            child: Container(
                              width: 80.0,
                              child: Column(
                                children: [
                                  InkWell(
                                    key: _key5,
                                    onTap: () {
                                      selectedItem(5);
                                      pageController.animateToPage(4,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease);
                                    },
                                    child: Text(
                                      'Buy/Sell',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: currentSelection == 5
                                              ? AppColors.appColor
                                              : Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10.0),
                                    decoration: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                        color: currentSelection == 5
                                            ? AppColors.appColor
                                            : Colors.white,
                                        width: 3.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              pageController.animateToPage(5,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            child: Container(
                              width: 70.0,
                              child: Column(
                                children: [
                                  InkWell(
                                    key: _key6,
                                    onTap: () {
                                      selectedItem(6);
                                      pageController.animateToPage(5,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease);
                                    },
                                    child: Text(
                                      'Wallets',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: currentSelection == 6
                                              ? AppColors.appColor
                                              : Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10.0),
                                    decoration: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                        color: currentSelection == 6
                                            ? AppColors.appColor
                                            : Colors.white,
                                        width: 3.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              pageController.animateToPage(6,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            child: Container(
                              width: 90.0,
                              child: Column(
                                children: [
                                  InkWell(
                                    key: _key7,
                                    onTap: () {
                                      selectedItem(7);
                                      pageController.animateToPage(6,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease);
                                    },
                                    child: Text(
                                      'Contacts',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: currentSelection == 7
                                              ? AppColors.appColor
                                              : Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10.0),
                                    decoration: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                        color: currentSelection == 7
                                            ? AppColors.appColor
                                            : Colors.white,
                                        width: 3.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              pageController.animateToPage(7,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            child: Container(
                              width: 110.0,
                              child: Column(
                                children: [
                                  InkWell(
                                    key: _key8,
                                    onTap: () {
                                      selectedItem(8);
                                      pageController.animateToPage(7,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease);
                                    },
                                    child: Text(
                                      'Statements',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: currentSelection == 8
                                              ? AppColors.appColor
                                              : Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10.0),
                                    decoration: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                        color: currentSelection == 8
                                            ? AppColors.appColor
                                            : Colors.white,
                                        width: 3.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              pageController.animateToPage(8,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            child: Container(
                              width: 120.0,
                              child: Column(
                                children: [
                                  InkWell(
                                    key: _key9,
                                    onTap: () {
                                      selectedItem(9);
                                      pageController.animateToPage(8,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease);
                                    },
                                    child: Text(
                                      'Transactions',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: currentSelection == 9
                                              ? AppColors.appColor
                                              : Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10.0),
                                    decoration: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                        color: currentSelection == 9
                                            ? AppColors.appColor
                                            : Colors.white,
                                        width: 3.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              pageController.animateToPage(9,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            child: Container(
                              width: 80.0,
                              child: Column(
                                children: [
                                  InkWell(
                                    key: _key10,
                                    onTap: () {
                                      selectedItem(10);
                                      pageController.animateToPage(9,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease);
                                    },
                                    child: Text(
                                      'Settings',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: currentSelection == 10
                                              ? AppColors.appColor
                                              : Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10.0),
                                    decoration: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                        color: currentSelection == 10
                                            ? AppColors.appColor
                                            : Colors.white,
                                        width: 3.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              pageController.animateToPage(10,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            child: Container(
                              width: 90.0,
                              child: Column(
                                children: [
                                  InkWell(
                                    key: _key11,
                                    onTap: () {
                                      selectedItem(11);
                                      pageController.animateToPage(10,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease);
                                    },
                                    child: Text(
                                      'Referrals',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: currentSelection == 11
                                              ? AppColors.appColor
                                              : Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10.0),
                                    decoration: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                        color: currentSelection == 11
                                            ? AppColors.appColor
                                            : Colors.white,
                                        width: 3.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 100.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 100,
            child: PageView(
              controller: pageController,
              children: [
                SimpleGestureDetector(
                  onHorizontalSwipe: _onHorizontalSwipe,
                  child: Dashboard(),
                ),
                SimpleGestureDetector(
                  onHorizontalSwipe: _onHorizontalSwipe,
                  child: Text("Send"),
                ),
                Text("Batch Send"),
                Text("Deposit"),
                Text("Buy/Sell"),
                Text("Wallets"),
                Text("Contacts"),
                Text("Statements"),
                Text("Transactions"),
                Text("Settings"),
                Text("Referrals"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onHorizontalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.left) {
        pageController.animateToPage(currentSelection,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
        setState(() {
          
        });
        print('Swiped left!');
      } else {
        pageController.animateToPage((currentSelection - 1),
            duration: Duration(milliseconds: 500), curve: Curves.ease);
        print('Swiped right!');
      }
    });
  }
}
