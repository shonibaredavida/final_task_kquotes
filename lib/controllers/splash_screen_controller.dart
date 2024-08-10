import 'package:final_task_kquotes/screens/homepage_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    navigateToAuthScreen();
    super.onInit();
  }

  void navigateToAuthScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.off(const HomePageScreen());
      },
    );
  }
}
