import 'package:flutter/material.dart';
import 'package:my_quote_app/screens/create_account.dart';
import 'package:my_quote_app/screens/home_page.dart';
import 'package:my_quote_app/utils/constants/images.dart';
import '../controller/auth_controller.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.put(AuthController());

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSizes.iconSize * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImage.splashImage,
                          height: 150,
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login to KQuotes ',
                          style: TextStyle(
                              color: black,
                              fontSize: AppSizes.fontSizeLg,
                              fontWeight: AppSizes.fontWeightBold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 23),
                    const SizedBox(
                      height: AppSizes.fontSizeMd,
                    ),
                    InputFieldWidget(
                      title: 'Email Address',
                      controller: _emailController,
                      onChanged: (value) {
                        controller.loginEmailChanged(email: value);
                      },
                    ),
                    Text(
                      controller.emailErrorText,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(
                      height: AppSizes.fontSizeMd,
                    ),
                    InputFieldWidget(
                      title: 'Password',
                      controller: _passwordController,
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
                      height: AppSizes.fontSizeXlg,
                    ),
                    PrimaryButton(
                      title: 'Login',
                      // isLoading: true,
                      onTap: () {
                        // print("1 1 1 1->" + _emailController.text);

                        // print("1 1 1 1->" + _passwordController.text);
                        if (controller.isEmailValid &&
                            controller.isPasswordValid) {
                          controller
                              .loginUser(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text)
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
                        Get.to(() =>
                            CreateAccountPage()); // Navigate to CreateAccountPage
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t Have an Account?',
                            style: TextStyle(
                              fontSize: AppSizes.fontSizeMd,
                              color: black,
                            ),
                          ),
                          Text(
                            ' Create Account',
                            style: TextStyle(
                              fontSize: AppSizes.fontSizeMd,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
