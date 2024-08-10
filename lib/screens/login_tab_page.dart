import 'package:final_task_kquotes/screens/login_tab_page%202.dart';
import 'package:final_task_kquotes/utils/constants/colors.dart';
import 'package:final_task_kquotes/utils/constants/sizes.dart';
import 'package:final_task_kquotes/utils/validators/validators.dart';
import 'package:final_task_kquotes/widget/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:final_task_kquotes/functions/form_validation.dart';

class LoginTabPage extends StatefulWidget {
  const LoginTabPage({super.key});

  @override
  State<LoginTabPage> createState() => _LoginTabPageState();
}

class _LoginTabPageState extends State<LoginTabPage> {
  bool showPass = false;
  bool passChecker = false;
  final formKey = GlobalKey<FormState>();
  bool inAgreement = false;
  final nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: ListView(
                children: [
                  const SizedBox(height: AppSizes.spaceBtwSectionsLg),
                  FormEntry(
                    textController: emailController,
                    entryTitle: "Email address",
                    keyboardType: TextInputType.emailAddress,
                    validator: AppValidator.validEmail(emailController.text),
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwSectionsSm * 0.5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  FormEntry(
                    textController: passwordController,
                    entryTitle: "Password",
                    obscurePassword: !showPass,
                    onChanged: (value) {
                      setState(() {
                        if (value.length > 7) {
                          passChecker = true;
                        } else {
                          passChecker = false;
                        }
                      });
                    },
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            showPass = !showPass;
                          });
                        },
                        child: showPass
                            ? const Icon(Icons.remove_red_eye_outlined)
                            : const Icon(Icons.remove_red_eye)),
                    isPasswordField: true,
                    validator:
                        AppValidator.validatePassword(passwordController.text),
                  ),
                  /*   TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      //  validatepassword(value);
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length < 8) {
                        return "Password Contain atleast 8 characters";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        if (value.length > 7) {
                          passChecker = true;
                        } else {
                          passChecker = false;
                        }
                      });
                    },
                    obscureText: !showPass,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              showPass = !showPass;
                            });
                          },
                          child: showPass
                              ? const Icon(Icons.remove_red_eye_outlined)
                              : const Icon(Icons.remove_red_eye)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                 */
                  const SizedBox(
                    height: 6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    title: "Login",
                    link: () {
                      validateForm(
                        context: context,
                        key: formKey,
                      );
                    },
                    horizontalPadding: 0,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
