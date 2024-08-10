import 'package:final_task_kquotes/screens/signup_tab_page.dart';
import 'package:final_task_kquotes/utils/constants/sizes.dart';
import 'package:final_task_kquotes/utils/validators/validators.dart';
import 'package:final_task_kquotes/widget/custom_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_task_kquotes/functions/form_validation.dart';

import '../firebase_auth/firebase_functions.dart';
import '../widget/form_element.dart';

class LoginTabPage extends StatefulWidget {
  const LoginTabPage({super.key});

  @override
  State<LoginTabPage> createState() => _LoginTabPageState();
}

class _LoginTabPageState extends State<LoginTabPage> {  
  final FirebaseAuthServices _auth= FirebaseAuthServices();  
 
  bool showPass = false;
  bool passChecker = false;
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

    @override
  void dispose() {
    passwordController.dispose();  
    emailController.dispose();
    super.dispose();
  } 
  
   void _signIn( context) async{
       String email=emailController.text;
    String password= passwordController.text;
       User? user=await  _auth.signinWithEmailAndPassword(email, password);
       if(user!=null){
        print("User logged in Successfully");
       authDialog(context, true);
       }else{
        print ("some error occured");
       }
                                                                                                                                   
  }
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
                      if(formKey.currentState!.validate()){
_signIn(context);
                          }
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
