import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.style,
    this.bColor,
    this.minimumsize,
  });

  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;
  final Color? bColor;
  final Size? minimumsize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF3056D3),
            elevation: 10,
            minimumSize: minimumsize,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )));
  }
}
