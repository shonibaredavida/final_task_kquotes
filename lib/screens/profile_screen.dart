import 'package:final_task_kquotes/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../controller/home_page_controller.dart';
import '../services/quote_services.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/images.dart';
import '../utils/constants/sizes.dart';
import '../widgets/my_drawer_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final AuthController authController = Get.find();
  final homePageController =
      Get.put(HomePageController(quoteService: QuoteService()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAll(HomePage());
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: const Text(
          'User Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: AppSizes.fontSizeLg,
              fontWeight: AppSizes.fontWeightBold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: AppSizes.mediumDefaultSpace,
                      ),
                      CircleAvatar(
                        child: Image.asset(
                          AppImage.profileimage,
                          fit: BoxFit.cover,
                        ),
                        radius: 100.0,
                      ),
                      const SizedBox(
                        height: AppSizes.mediumDefaultSpace,
                      ),
                      Text(
                        homePageController.userModel.value.fullName,
                        style: const TextStyle(
                            fontSize: AppSizes.fontSizeMd,
                            fontWeight: AppSizes.fontWeightW400,
                            color: black),
                      ),
                      Text(
                        homePageController.userModel.value.email,
                        style: const TextStyle(
                            fontSize: AppSizes.fontSizeSm,
                            fontWeight: AppSizes.fontWeightNormal,
                            color: black),
                      ),
                      const Text(
                        'Edit Your Profile',
                        style: TextStyle(
                          fontSize: AppSizes.fontSizeMd,
                          fontWeight: AppSizes.fontWeightNormal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSizes.defaultSpace),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
