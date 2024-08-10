import 'package:final_task_kquotes/utils/constants/colors.dart';
import 'package:final_task_kquotes/utils/constants/sizes.dart';
import 'package:final_task_kquotes/utils/validators/validators.dart';
import 'package:final_task_kquotes/widget/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:final_task_kquotes/functions/form_validation.dart';

class LoginTab2Page extends StatefulWidget {
  const LoginTab2Page({super.key});

  @override
  State<LoginTab2Page> createState() => _LoginTab2PageState();
}

class _LoginTab2PageState extends State<LoginTab2Page> {
  bool showPass = false;
  bool passChecker = false;
  bool cpassChecker = false;
  final formKey2 = GlobalKey<FormState>();
  bool inAgreement = false;
  final cpasswordController = TextEditingController();
  var lNameController = TextEditingController();
  final nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: formKey2,
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: AppSizes.spaceBtwInputFields * 0.5,
                    ),
                    //first name Field
                    FormEntry(
                      textController: nameController,
                      entryTitle: "First Name",
                      keyboardType: TextInputType.name,
                      validator: AppValidator.validateEmptyText(
                          "First Name", nameController.text),
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwSectionsSm * 0.5,
                    ),
                    //Last name field
                    FormEntry(
                      textController: lNameController,
                      entryTitle: "Last Name",
                      keyboardType: TextInputType.name,
                      validator: AppValidator.validateEmptyText(
                          "Last Name", lNameController.text),
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwSectionsSm * 0.5,
                    ),
                    //email entry
                    FormEntry(
                      textController: emailController,
                      entryTitle: "Email address",
                      keyboardType: TextInputType.emailAddress,
                      validator: AppValidator.validEmail(emailController.text),
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwSectionsSm * 0.5,
                    ),
                    //  password field
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
                      validator: AppValidator.validatePassword(
                          passwordController.text),
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwSectionsSm * 0.5,
                    ), //confirm Password
                    FormEntry(
                      textController: cpasswordController,
                      entryTitle: "Confirm Password",
                      obscurePassword: !showPass,
                      onChanged: (value) {
                        setState(() {
                          if (value == passwordController.text) {
                            cpassChecker = true;
                          } else {
                            cpassChecker = false;
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
                      validator: AppValidator.validatePassword(
                          cpasswordController.text,
                          cpassword: true,
                          pswString: passwordController.text),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 17,
                          color: passChecker ? Colors.green : Colors.red,
                        ),
                        const Text(
                          "Password should contain atleast 8 characters.",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "I agree with KQuotes conditions",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Switch(
                            activeColor: primaryColor.withOpacity(0.6),
                            value: inAgreement,
                            onChanged: (val) {
                              setState(() {
                                inAgreement = val;
                              });
                            })
                      ],
                    ),
                    CustomButton(
                      title: "Register",
                      link: () {
                        if (inAgreement) {
                          //  print(name + "newnam10101 byr");

                          validateForm(
                              context: context,
                              key: formKey2,
                              loginPage: false);
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Container(
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  "Kindly Agree with the KQuote Conditions",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      horizontalPadding: 0,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

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
