import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   const CustomButton({
    required this.buttonName,this.onTab
  });
   final String buttonName;
  final VoidCallback? onTab;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTab,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.blueAccent, borderRadius: BorderRadius.circular(8)),
          child: Center(
              child: Text(
            buttonName,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
    );
  }
}
