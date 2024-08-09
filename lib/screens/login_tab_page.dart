import 'package:final_task_kquotes/widget/custom_text_field.dart';
import 'package:final_task_kquotes/widget/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginTabPage extends StatefulWidget {
  const LoginTabPage({super.key});

  @override
  State<LoginTabPage> createState() => _LoginTabPageState();
}

class _LoginTabPageState extends State<LoginTabPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  validateForm() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      print('initiating login ');
    } else if (emailController.text.isEmpty) {
      print('form validation-- kindly enter mail ');
      Fluttertoast.showToast(msg: "Kindly enter your email");
    } else if (passwordController.text.isEmpty) {
      print('form validation-- kindly enter password ');
      Fluttertoast.showToast(msg: "KIindly enter your password");
    } else {
      print('form validation-- kindly enter mail n password ');
      Fluttertoast.showToast(
          msg: "Kindly enter your email and password details");
    }
  }

/*   loginnow() async {
    User? currentSeller;

    print('form log in Checking your credentials from firebse');
    showDialog(
        context: context,
        builder: (c) => const LoadingDialogWidget(
              message: "Checking your credentials ",
            ));

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((auth) => currentSeller = auth.user)
        .catchError((errorMessage) {
      print('hecking your credentials..error occured');

      Navigator.of(context).pop();
      Fluttertoast.showToast(msg: "Error occured \n $errorMessage");
      return null;
    });
    if (currentSeller != null) {
      print('Checking your credentials.. found user');

      checkIfSellerRecordExist(currentSeller);
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      color: const Color.fromARGB(91, 167, 156, 156),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                    emailController, Icons.email, false, true, "Email"),
                CustomTextField(
                    passwordController, Icons.lock, true, true, "Password"),
                const SizedBox(height: 20),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
            ),
            onPressed: () {
              print('initiating the form validation ');
              validateForm();
            },
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
