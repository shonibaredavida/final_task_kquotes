import 'package:flutter/material.dart';

class CustomInputButton extends StatefulWidget {
  final String title;

  final Color? buttonColor;

  final Color? textColor;

  const CustomInputButton(this.title, this.buttonColor, this.textColor,
      {Key? key})
      : super(key: key);

  @override
  State<CustomInputButton> createState() => _CustomInputButtonState();
}

class _CustomInputButtonState extends State<CustomInputButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.buttonColor,
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: () {},
      child: Text(
        widget.title,
        style: TextStyle(color: widget.textColor ?? Colors.white),
      ),
    );
  }
}
