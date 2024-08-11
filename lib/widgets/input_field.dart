import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget(
      {super.key,
      required this.title,
      required this.controller,
      this.obscureText = false,
      this.isPasswordField = false,
      this.suffixIcon,
      this.onChanged});

  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final bool isPasswordField;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: AppSizes.fontSizeMd, color: black),
        ),
        const SizedBox(
          height: AppSizes.spaceBfrFields,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.regularSpace),
            ),
            suffixIcon: isPasswordField ? suffixIcon : null,
          ),
        ),
      ],
    );
  }
}
