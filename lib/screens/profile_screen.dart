import 'package:final_task_kquotes/screens/homepage_screen.dart';
import 'package:final_task_kquotes/utils/constants/colors.dart';
import 'package:final_task_kquotes/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: greyLine.withOpacity(0.2),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSizes.lg),
                    child: GestureDetector(
                        onTap: () {
                          Get.to(const HomePageScreen());
                        },
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chevron_left_rounded,
                              size: AppSizes.buttonHeight,
                            ),
                            Text(
                              "Back",
                              style: TextStyle(fontSize: AppSizes.fontSizeLg),
                            )
                          ],
                        )),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundColor: primaryColor,
                        radius: AppSizes.spaceBtwSectionsXLg,
                      ),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItemsLg * 2),
                    Text(
                      "FUllname",
                      style: TextStyle(
                          fontSize: AppSizes.fontSizeXXLg, color: blackColor),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItemsSm),
                    Text(
                      "Email",
                      style: TextStyle(
                          fontSize: AppSizes.fontSizeXLg,
                          color: blackColor.withOpacity(0.5)),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItemsLg * 2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    /*  child:
    Container(
      child: Container(
        color: greyLine.withOpacity(0.2),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: AppSizes.spaceBtwSectionsXLg,
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwItems),
            Text(
              "detailTitle",
              style: TextStyle(fontSize: AppSizes.fontSizeMd, color: greyLine),
            ),
            SizedBox(height: AppSizes.spaceBtwItems),
            Text(
              "detailTitle",
              style: TextStyle(fontSize: AppSizes.fontSizeLg, color: greyLine),
            ),
          ],
        ),
      ),
    );
  */
  }
}
