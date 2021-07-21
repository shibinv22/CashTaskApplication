import 'package:flutter/material.dart';
import 'package:untitled1/ui/pages/home/dashboard.dart';
import 'package:untitled1/utils/constants.dart';

class Copy extends StatefulWidget {
  const Copy({Key? key}) : super(key: key);

  @override
  _CopyState createState() => _CopyState();
}

class _CopyState extends State<Copy> {
  late int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Bar"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    child: Column(
                      children: [
                        InkWell(
                          child: Text(
                            'Dashboard',
                            style: TextStyle(
                              fontSize: 20.0,
                              // color: currentSelection == 1
                              //     ? AppColors.appColor
                              //     : Colors.grey,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10.0),
                          decoration: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              // color: currentSelection == 1
                              //     ? AppColors.appColor
                              //     : Colors.white,
                              width: 3.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  FlatButton(
                    splashColor: Colors.blueAccent,
                    color: Colors.blue,
                    onPressed: () {
                      pageController.animateToPage(1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                    child: Text(
                      "Two",
                    ),
                  ),
                  FlatButton(
                    splashColor: Colors.blueAccent,
                    color: Colors.blue,
                    onPressed: () {
                      pageController.animateToPage(2,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                    child: Text(
                      "Three",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 40,
              child: PageView(
                controller: pageController,
                children: [
                  // Dashboard(),
                  Text("Page Two"),
                  Text("Page Three"),
                  Text("Page 4"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
