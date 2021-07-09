import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final bool validate;
  final String? Function(String?) validation;
  final TextEditingController controller;
  final String? hintText;

  CustomTextFormField({
    this.validate = true,
    required this.validation,
    required this.controller,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidate: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.grey[200],
        filled: true,
        hintText: hintText,
      ),
      controller: controller,
      validator: validation,
    );
  }
}
