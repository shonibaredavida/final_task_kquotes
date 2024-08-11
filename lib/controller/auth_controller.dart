import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/firebase_service.dart';

class AuthController extends GetxController {
  var _isFullNameValid = false.obs;
  var _isEmailValid = false.obs;
  var _isPasswordValid = false.obs;
  var _isConfirmPasswordValid = false.obs;

  bool get isFullNameValid => _isFullNameValid.value;
  bool get isEmailValid => _isEmailValid.value;
  bool get isPasswordValid => _isPasswordValid.value;
  bool get isConfirmPasswordValid => _isConfirmPasswordValid.value;

  var _fullNameErrorText = ''.obs;
  var _emailErrorText = ''.obs;
  var _passwordErrorText = ''.obs;
  var _confirmPasswordErrorText = ''.obs;

  String get fullNameErrorText => _fullNameErrorText.value;
  String get emailErrorText => _emailErrorText.value;
  String get passwordErrorText => _passwordErrorText.value;
  String get confirmPasswordErrorText => _confirmPasswordErrorText.value;

  var _isPasswordVisible = false.obs;
  bool get isPasswordVisible => _isPasswordVisible.value;

  void fullNameChanged({required String fullName}) {
    if (fullName.isNotEmpty) {
      _isFullNameValid.value = true;
      _fullNameErrorText.value = '';
    } else {
      _isFullNameValid.value = false;
      _fullNameErrorText.value = 'Full name cannot be empty.';
    }
    update();
  }

  void loginEmailChanged({required String email}) {
    if (email.isNotEmpty && email.contains('@')) {
      _isEmailValid.value = true;
      _emailErrorText.value = '';
    } else {
      _isEmailValid.value = false;
      _emailErrorText.value = 'Please enter a valid email address.';
    }
    update();
  }

  void loginPasswordChanged({required String password}) {
    if (password.length >= 8) {
      _isPasswordValid.value = true;
      _passwordErrorText.value = '';
    } else {
      _isPasswordValid.value = false;
      _passwordErrorText.value = 'Password must be at least 8 characters long.';
    }
    update();
  }

  void confirmPasswordChanged(
      {required String password, required String confirmPassword}) {
    if (confirmPassword == password) {
      _isConfirmPasswordValid.value = true;
      _confirmPasswordErrorText.value = '';
    } else {
      _isConfirmPasswordValid.value = false;
      _confirmPasswordErrorText.value = 'Passwords do not match.';
    }
    update();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
    update();
  }

  final _firebaseService = FirebaseService();
  var _isAuthLoading = false.obs;
  bool get isAuthLoading => _isAuthLoading.value;

  Future<bool> registerUser(
      {required String email,
      required String password,
      required String fullName}) async {
    _isAuthLoading.value = true;
    update();
    try {
      final result =
          await _firebaseService.registerUser(email: email, password: password);
      if (result != null && result.user?.uid != null) {
        await _firebaseService.saveUserToFireStore(
            fullName: fullName, email: email);
        _isAuthLoading.value = false;
        update();
        return true;
      } else {
        _isAuthLoading.value = false;
        update();
        return false;
      }
    } catch (e) {
      _isAuthLoading.value = false;
      update();
      return false;
    }
  }

  Future<bool> loginUser(
      {required String email, required String password}) async {
    _isAuthLoading.value = true;
    update();
    try {
      final result =
          await _firebaseService.loginUser(email: email, password: password);
      if (result != null && result.user?.uid != null) {
        _isAuthLoading.value = false;
        update();
        return true;
      } else {
        _isAuthLoading.value = false;
        update();
        return false;
      }
    } catch (e) {
      _isAuthLoading.value = false;
      update();
      return false;
    }
  }
/*   Future<bool> loginUser(
      {required String email, required String password}) async {
    _isAuthLoading.value = true;
    update();
    try {
      final result =
          await _firebaseService.loginUser(email: email, password: password);
      if (result != null && result.user?.uid != null) {
        _isAuthLoading.value = false;
        update();
        return true;
      } else {
        _isAuthLoading.value = false;
        /*   showQdialog(
          titleText: "Error Occured !!!",
          contentWidget: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Do you have an Account?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(
                    CreateAccountPage(),
                  );
                },
                child: const Text(
                  "If no, click here to signup",
                  style: TextStyle(fontSize: 16, color: primaryColor),
                ),
              ),
            ],
          ),
        );
       */
        update();
        return false;
      }
    } catch (e) {
      _isAuthLoading.value = false;
      /*    showQdialog(
        titleText: "Error!!!",
        contentWidget: Text(
          showErrorMessgae(e),
          textAlign: TextAlign.center,
        ),
      ); */
      print(e);
      update();
      return false;
    }
  } */

  Future<void> logoutUser() async {
    await _firebaseService.logOutUser();
  }
}

Future<void> showQdialog({titleText, contentWidget}) {
  return Get.dialog(
    AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        titleText,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      content: contentWidget,
    ),
  );
}
