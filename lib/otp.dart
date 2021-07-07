import 'package:flutter/material.dart';
import 'package:untitled1/custom_widgets.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 80.0),
              Container(
                  child: Image(image: AssetImage('assets/correct_otp.png'))),
              SizedBox(height: 5.0),
              MaterialButton(
                height: 10.0,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    '+91 ***** *4578',
                    style: TextStyle(fontSize: 8.0),
                  ),
                ),
                color: Colors.pinkAccent,
                shape: const StadiumBorder(),
              ),
              SizedBox(height: 10.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('We Sent A SMS Code To',
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  SizedBox(height: 2.0),
                  Text('Your Phone Number',
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  SizedBox(height: 30.0),
                  Text('Enter the 6 digit code sent to your',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text('mobile number',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              //OTP BOXES
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: TextFormField(
                  maxLength: 6,
                  cursorHeight: 20.0,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey[200],
                      filled: true),
                ),
              ),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2FC3C5),
                      ),
                    ),
                    SizedBox(width: 2.0),
                    Text(
                      "to send a",
                      maxLines: 1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(height: 2.0),
              Text(
                "new one",
                maxLines: 1,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: CustomButton(btnText: 'Verify', onBtnPressed: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
