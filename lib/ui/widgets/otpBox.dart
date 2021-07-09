import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpBox extends StatelessWidget {
  final InputDecoration inputDecoration;

  OtpBox({required this.inputDecoration});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 10.0),
        child: TextFormField(
          maxLength: 6,
          showCursor: false,
          keyboardType: TextInputType.number,
          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
          textAlign: TextAlign.center,
          decoration: inputDecoration,
        ),
      ),
    );
  }
}
