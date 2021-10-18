import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';

class ColorfulTextField extends StatelessWidget {
  final Color fillColor;
  final Color textColor;
  final String label;
  final bool isPassword;
  const ColorfulTextField({
    required this.fillColor,
    required this.textColor,
    required this.label,
    this.isPassword = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var labelStyle = TextStyle(color: textColor.lighter(20));
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          TextField(
            style: TextStyle(color: textColor),
            cursorColor: textColor,
            obscureText: isPassword,
            decoration: InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              filled: false,
              labelStyle: labelStyle,
              floatingLabelStyle: labelStyle,
            ),
          ),
        ],
      ),
    );
  }
}
