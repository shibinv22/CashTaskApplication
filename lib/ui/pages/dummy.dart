import 'package:flutter/material.dart';

class Dummy extends StatelessWidget {
  const Dummy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              width: 300.0,
              height: 200.0,
              margin: EdgeInsets.only(right: 20.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.pinkAccent, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/mercury_logo.png'),
                            height: 30.0,
                            width: 30.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Total Holdings (USD)',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0, left: 15.0),
                      child: Text(
                        'A 265,498,446,545.00',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
