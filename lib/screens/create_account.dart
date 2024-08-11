import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quote_app/screens/home_page.dart';
import 'package:my_quote_app/screens/login.dart';
import '../controller/auth_controller.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/images.dart';
import '../utils/constants/sizes.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});

  final controller = Get.put(AuthController());

  final _fullNameController = TextEditingController();
  final _emailController1 = TextEditingController();
  final _passwordController1 = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void dispose() {
    _fullNameController.dispose();
    _emailController1.dispose();
    _passwordController1.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImage.splashImage,
                          height: 120,
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: AppSizes.fontSizeLg,
                            fontWeight: AppSizes.fontWeightBold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSizes.smallDefaultSpace,
                    ),
                    InputFieldWidget(
                      title: 'Name',
                      controller: _fullNameController,
                      onChanged: (value) {
                        controller.fullNameChanged(fullName: value);
                      },
                    ),
                    Text(
                      controller.fullNameErrorText,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(
                      height: AppSizes.smallDefaultSpace,
                    ),
                    InputFieldWidget(
                      title: 'Email',
                      controller: _emailController1,
                      onChanged: (value) {
                        controller.loginEmailChanged(email: value);
                      },
                    ),
                    Text(
                      controller.emailErrorText,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(
                      height: AppSizes.smallDefaultSpace,
                    ),
                    InputFieldWidget(
                      title: 'Password',
                      controller: _passwordController1,
                      obscureText: !controller.isPasswordVisible,
                      isPasswordField: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.togglePasswordVisibility();
                        },
                        icon: controller.isPasswordVisible
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_rounded),
                      ),
                      onChanged: (value) {
                        controller.loginPasswordChanged(password: value);
                      },
                    ),
                    Text(
                      controller.passwordErrorText,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(
                      height: AppSizes.smallDefaultSpace,
                    ),
                    InputFieldWidget(
                      title: 'Confirm Password',
                      controller: _confirmPasswordController,
                      obscureText: !controller.isPasswordVisible,
                      isPasswordField: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.togglePasswordVisibility();
                        },
                        icon: controller.isPasswordVisible
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_rounded),
                      ),
                      onChanged: (value) {
                        controller.confirmPasswordChanged(
                          password: _passwordController1.text,
                          confirmPassword: value,
                        );
                      },
                    ),
                    Text(
                      controller.confirmPasswordErrorText,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(
                      height: AppSizes.fontSizeXlg,
                    ),
                    PrimaryButton(
                      title: 'Create Account',
                      isLoading: controller.isAuthLoading,
                      onTap: () {
                        if (controller.isFullNameValid &&
                            controller.isEmailValid &&
                            controller.isPasswordValid &&
                            controller.isConfirmPasswordValid) {
                          controller
                              .registerUser(
                                  email: _emailController1.text.trim(),
                                  password: _passwordController1.text,
                                  fullName: _fullNameController.text)
                              .then((value) {
                            if (value) {
                              Get.offAll(() => HomePage());
                            }
                          });
                        }
                      },
                    ),
                    const SizedBox(
                      height: AppSizes.mediumDefaultSpace,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => LoginPage());
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already Have an Account?',
                            style: TextStyle(
                              fontSize: AppSizes.fontSizeMd,
                              color: black,
                            ),
                          ),
                          Text(
                            ' Login',
                            style: TextStyle(
                              fontSize: AppSizes.fontSizeMd,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwSectionsXLg,
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
