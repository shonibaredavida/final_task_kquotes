import 'package:get/get.dart';

import '../screens/login.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    navigateToAuthScreen();
    super.onInit();
  }

  void navigateToAuthScreen() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.off(LoginPage());
      },
    );
  }
}
