
import 'package:flutter/material.dart';

import '../utils/constants/sizes.dart';

class FormEntry extends StatelessWidget {
  const FormEntry({
    super.key,
    required this.textController,
    this.keyboardType,
    required this.entryTitle,
    required this.validator,
    this.onChanged,
    this.isPasswordField = false,
    this.obscurePassword = false,
    this.suffixIcon,
  });
  final TextInputType? keyboardType;
  final String entryTitle;
  final TextEditingController textController;
  final String? validator;
  final void Function(String)? onChanged;
  final bool isPasswordField;
  final bool obscurePassword;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          entryTitle,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: AppSizes.md,
        ),
        TextFormField(
          controller: textController,
          keyboardType: keyboardType ?? TextInputType.name,
          validator: (value) {
            return validator;
          },
          onChanged: onChanged,
          obscureText: obscurePassword,
          decoration: InputDecoration(
            suffixIcon: isPasswordField ? suffixIcon : null,
            //  label: const Text('Name'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
