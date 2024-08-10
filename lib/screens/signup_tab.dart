import 'package:final_task_kquotes/widget/custom_text_field.dart';
import 'package:final_task_kquotes/widget/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupTaPage extends StatefulWidget {
  const SignupTaPage({super.key});

  @override
  State<SignupTaPage> createState() => _SignupTaPageState();
}

class _SignupTaPageState extends State<SignupTaPage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool dev = true;

/*   saveInfoToFireStoreAndLocally(User currentUser) async {
// save to firestore
/* 
    FirebaseFirestore.instance.collection("sellers").doc(currentUser.uid).set({
      "uid": currentUser.uid,
      "email": currentUser.email,
      "name": namecontroller.text.trim(),
      "photoUrl": downloadUrlImage,
      "phone": phoneController.text.trim(),
      "address": locationController.text.trim(),
      "earnings": 0.0,
      "status": "approved",
    }); */
    print(" saving to firebase");
/* Navigator.push(context,
            MaterialPageRoute(builder: (c) => const MySplashScreen());
 */
    print(" saving locally & redirecting to MySplashScreen");
// route to home page
  } */

  saveInformationToDatabase(email, password) async {
    //authenticating the user using firebase
    //  print(" creating user");

    // User? currentSeller;
/*     await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((auth) {
      currentSeller = auth.user;
    }).catchError((errorMessage) {
      print(" creating user-- error occured");

      Navigator.of(context).pop();
      Fluttertoast.showToast(msg: "Error Occured: \n $errorMessage");
    });

    if (currentSeller != null) {
      print(" logged in");
      //save the user information to Database n save locally
      saveInfoToFireStoreAndLocally(currentSeller!);
    } */
  }

  formValidation() async {
    if (emailController.text.isNotEmpty &&
        locationController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        namecontroller.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      // print(' form filled ');
      // email n name, password, confirmatio n given
      if (passwordController.text == confirmPasswordController.text) {
        //password n confirmation field are same
        //   print(' password == confirmPassword');

        showDialog(
            context: context,
            builder: (c) {
              return const LoadingDialogWidget(
                message: "Registering your Account",
              );
            });

        saveInformationToDatabase(
            emailController.text.trim(), passwordController.text.trim());
      } else {
        // password n confirmation field are not match
        Fluttertoast.showToast(
            msg: "Password and Password Confirmaion do not match");
      }
    } else {
      //either email n name, password, confirmatio isnt given
      Fluttertoast.showToast(msg: "kindly complete the form");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      color: const Color.fromARGB(91, 167, 156, 156),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 12),

          const SizedBox(height: 12),
          //input Field
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                    namecontroller, Icons.person, false, true, "Name"),
                CustomTextField(
                    emailController, Icons.email, false, true, "Email"),
                CustomTextField(
                    passwordController, Icons.lock, true, true, "Password"),
                CustomTextField(confirmPasswordController, Icons.lock, true,
                    true, "Confirm Password"),
                CustomTextField(
                    phoneController, Icons.phone, false, true, "Phone Number"),
                CustomTextField(
                    locationController, Icons.home, false, true, "Address"),
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
              formValidation();
            },
            child: const Text(
              "Signup",
              style: TextStyle(color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}
