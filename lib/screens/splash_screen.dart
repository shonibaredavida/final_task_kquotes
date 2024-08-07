import 'package:final_task_kquotes/splash_screen_controller.dart';
import 'package:final_task_kquotes/utils/constants/images.dart';
import 'package:final_task_kquotes/utils/constants/sizes.dart';
import 'package:final_task_kquotes/utils/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.splashImage,
              height: 150,
            ),
            Text(
              QuoteString.appName,
              style: const TextStyle(
                  fontSize: 2 * AppSizes.fontSizeMd,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 0.5),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSectionsSm,
            )
          ],
        ),
      ),
    );
  }
}
