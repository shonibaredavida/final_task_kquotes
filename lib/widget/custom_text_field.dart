import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final TextEditingController? textEditingController;
  IconData? iconData;
  bool? isObscure = false;
  bool? enabled = true;
  String? hintText = "";

  CustomTextField(this.textEditingController, this.iconData, this.isObscure,
      this.enabled, this.hintText,
      {super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: TextFormField(
          enabled: widget.enabled,
          obscureText: widget.isObscure!,
          controller: widget.textEditingController,
          //  cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                widget.iconData,
                color: Colors.purpleAccent,
              ),
              //    focusColor: Theme.of(context).primaryColor,
              hintText: widget.hintText),
        ),
      ),
    );
  }
}
