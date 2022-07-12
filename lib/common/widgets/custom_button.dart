import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final VoidCallback onTap;
  final Color? color;
  final Color? textColor;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        primary: color,
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
