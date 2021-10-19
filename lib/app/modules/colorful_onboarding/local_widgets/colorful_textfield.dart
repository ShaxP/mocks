import 'package:flutter/material.dart';

class ColorfulTextField extends StatelessWidget {
  final Color? fillColor;
  final Color? textColor;
  final Color? labelColor;
  final String label;
  final bool isPassword;
  const ColorfulTextField({
    this.fillColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
    this.labelColor = const Color(0xFFFFFFFF),
    required this.label,
    this.isPassword = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var labelStyle = TextStyle(color: textColor.lighter(20));
    const radius = 40.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 10),
          child: Text(
            label,
            style: TextStyle(color: labelColor),
          ),
        ),
        TextField(
          style: TextStyle(color: textColor),
          cursorColor: textColor,
          obscureText: isPassword,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 25),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
            filled: true,
            fillColor: fillColor,
          ),
        ),
      ],
    );
  }
}
