import 'package:final_task_kquotes/screens/homepage_screen.dart';
import 'package:final_task_kquotes/utils/constants/images.dart';
import 'package:final_task_kquotes/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void validateForm({context, key, bool loginPage = true}) {
  if (key.currentState!.validate()) {
    showDialog(
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
    Future.delayed(const Duration(seconds: 2), () {
      key.currentState!.save();
      Get.to(const HomePageScreen());
    });
  }
}
