import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_quote_app/controller/auth_controller.dart';
import 'package:my_quote_app/function/function.dart';
import 'package:my_quote_app/screens/login.dart';

import '../models/user_model.dart';

class FirebaseService {
  final firebaseAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  Future<UserCredential?> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      showQdialog(
          titleText: "",
          contentWidget: const Text(
            "Account successfully Created",
            textAlign: TextAlign.center,
          ));
      return credential;
    } on FirebaseAuthException catch (e) {
      showQdialog(
          titleText: "Error occured",
          contentWidget: Text(
            showErrorMessgae(e.code),
            textAlign: TextAlign.center,
          ));
      print(" create account level " + e.code);

      // You can either return null or throw an exception.

      return null;
      // Or if you prefer to throw the error:
      //   throw FirebaseAuthException(code: errorMessage);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  /// Logs in a user with the provided email and password.
  Future<UserCredential?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("LOGGED IN ${credential.user!.email}");

      return credential;
    } on FirebaseAuthException catch (e) {
      print("NONONONON");
      String errorMessage = showErrorMessgae(e.code);
      showQdialog(
        titleText: "Error",
        contentWidget: Text(
          errorMessage,
          textAlign: TextAlign.center,
        ),
      );
      print(e.code);
      //Future.delayed(const Duration(seconds: 3), () {});
      print("ERROR CANT GET USER $errorMessage");
      return null;
    } catch (e) {
      showQdialog(
        titleText: "Error",
        contentWidget: Text(
          e.toString(),
          textAlign: TextAlign.center,
        ),
      ); //  showQdialog(titleText: "Error!!!", contentWidget: Text(e.toString()));
      print('1111111Error: $e');
      return null;
    }
  }

  saveUserToFireStore({required String fullName, required String email}) async {
    try {
      final user = firebaseAuth.currentUser;
      if (user != null) {
        await fireStore.collection('USERS').doc(user.uid).set({
          'fullName': fullName,
          'email': email,
        });
        await fireStore.collection('ALLUSEREMAILs').doc(user.uid).set({
          'fullName': fullName,
          'email': email,
        });
      }
    } on FirebaseException catch (e) {
      log('Error saving user to Firestore: $e');
    }
  }

  Future<UserModel?> getUserFromFireStore() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user != null) {
        final documentSnapshot =
            await fireStore.collection('USERS').doc(user.uid).get();
        if (documentSnapshot.exists) {
          final data = documentSnapshot.data();
          log('User data: ${firebaseAuth.currentUser?.photoURL}');
          return UserModel(
              fullName: data?['fullName'],
              email: data?['email'],
              profilePictureUrl: firebaseAuth.currentUser?.photoURL);
        } else {
          log('No user document found for ID: ${user.uid}');
          return null;
        }
      } else {
        log('No user signed in.');
        return null;
      }
    } on FirebaseException catch (e) {
      log('Error retrieving user from Firestore: $e');
      return null;
    }
  }

  Future<void> logOutUser() async {
    await firebaseAuth.signOut();
    Get.off(LoginPage());
  }
}
