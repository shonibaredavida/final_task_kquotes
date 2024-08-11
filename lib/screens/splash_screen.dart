import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splash_screen_controller.dart';
import '../utils/constants/images.dart';
import '../utils/constants/sizes.dart';
import '../utils/constants/text.dart';

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
              AppImage.splashImage,
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
              height: AppSizes.iconSize,
            )
          ],
        ),
      ),
    );
  }
}
