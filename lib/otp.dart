import 'package:flutter/material.dart';
import 'package:untitled1/custom_widgets.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 140.0),
            Container(
                child: Image(image: AssetImage('assets/correct_otp.png'))),
            SizedBox(height: 10.0),
            MaterialButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(200.0),
                child: Text('******4578'),
              ),
            ),
            SizedBox(height: 10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter the  digit code sent to your',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Text(
                  'mobile number',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Didn't get your code?,",
                      maxLines: 1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 2.0),
                    Text(
                      "Click here",
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.lightBlue),
                    ),
                    SizedBox(width: 2.0),
                    Text(
                      "to send a",
                      maxLines: 1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 2.0),
                Text(
                  "new one",
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30.0),
                CustomButton(btnText: 'Verify', onBtnPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
