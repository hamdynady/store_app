import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.labelText,
    this.onChanged,
    this.obSecuredText = false,
    this.suffixIcon,
    this.Keyboard = TextInputType.text,
  });

  bool? obSecuredText;

  String labelText;
  Function(String)? onChanged;
  Widget? suffixIcon;
  TextInputType Keyboard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: obSecuredText!,
        keyboardType: Keyboard,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 16, color: Colors.grey),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          suffixIcon: suffixIcon,
        ),
        cursorColor: Colors.blueAccent,
      ),
    );
  }
}
