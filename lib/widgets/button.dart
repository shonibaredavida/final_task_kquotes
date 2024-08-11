import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.isDisabled = false,
    this.isLoading = false,
    this.onTap,
  });

  final String title;
  final bool isDisabled;
  final bool isLoading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled || isLoading ? null : onTap,
      child: Container(
        width: Get.width,
        height: 50.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(AppSizes.smallDefaultSpace)),
        child: isLoading
            ? const SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ))
            : Text(
                title,
                style: const TextStyle(
                    fontSize: AppSizes.fontSizeMd,
                    fontWeight: AppSizes.fontWeightW400,
                    color: Colors.white),
              ),
      ),
    );
  }
}
