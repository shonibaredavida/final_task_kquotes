import 'package:final_task_kquotes/firebase_auth/firebase_functions.dart';
import 'package:final_task_kquotes/screens/homepage_screen.dart';
import 'package:final_task_kquotes/utils/constants/colors.dart';
import 'package:final_task_kquotes/utils/constants/images.dart';
import 'package:final_task_kquotes/utils/constants/sizes.dart';
import 'package:final_task_kquotes/utils/validators/validators.dart';
import 'package:final_task_kquotes/widget/custom_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_task_kquotes/functions/form_validation.dart';
import 'package:get/get.dart';

import '../widget/form_element.dart';

class SignupTabPage extends StatefulWidget {
  const SignupTabPage({super.key});

  @override
  State<SignupTabPage> createState() => _SignupTabPageState();
}

class _SignupTabPageState extends State<SignupTabPage> {
  final FirebaseAuthServices _auth= FirebaseAuthServices();  
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
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    cpasswordController.dispose(); 
    passwordController.dispose();  
    emailController.dispose();
    super.dispose();
  }

  void _signUp( context) async{
       String email=emailController.text;
    //   String username= nameController.text;
       String password= cpasswordController.text;   
       User? user=await  _auth.signupWithEmailAndPassword(email, password);
       if(user!=null){
        print("User created Successfully");
       authDialog(context, false);
       }else{
        print ("some error occured");
       }
                                                                                                                                   
  }
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
                      entryTitle: "Username",
                      keyboardType: TextInputType.name,
                      validator: AppValidator.validateEmptyText(
                          "Username", nameController.text),
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
                    ), 
                    //confirm Password
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
                          //  print(name + "newnam10101 byr");/*  if (key.currentState!.validate()) {*/
                          if(formKey2.currentState!.validate()){
_signUp(context);
                          }
                          
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

void validateForm({context, key, bool loginPage = true}) {
  if (key.currentState!.validate()) {
    
    authDialog(context, loginPage);
    Future.delayed(const Duration(seconds: 2), () {
      key.currentState!.save();
      Get.to(const HomePageScreen());
    });
  }
}

Future<dynamic> authDialog(context, bool loginPage) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppImages.splashImage,
                height: AppSizes.spaceBtwSectionsLg,
              ),
              const SizedBox(
                height: AppSizes.lg,
              ),
              Text(
                !loginPage
                    ? " Registration Successful !!!"
                    : "Login Successful !!!",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              const Text(" Redirecting you to KQuote")
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
        );
      });
}
