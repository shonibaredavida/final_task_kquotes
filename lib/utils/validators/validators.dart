import 'package:flutter/material.dart';

class AppValidator {
  static String? validEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }

    return null;
  }

  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validatePassword(String? value,
      {bool cpassword = false, String? pswString}) {
    if (value == null || value.isEmpty) {
      if (cpassword) {
        return 'Password is required';
      } else {
        return "Confirm Password is required";
      }
    }

    if (!cpassword && value.length < 8) {
      return 'Password must be at least 8 Characters long';
    }

    if (!cpassword && !value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!cpassword && !value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    if (!cpassword && !value.contains(RegExp(r'[!@#$%^&*(),.?:{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    if (cpassword && pswString != value) {
      return "should be same as in Password, ";
    }

    return null;
  }
}
