import 'package:final_task_kquotes/utils/constants/colors.dart';
import 'package:final_task_kquotes/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProfileDetailsListileWidget extends StatelessWidget {
  const ProfileDetailsListileWidget({
    super.key,
    required this.detailTitle,
    required this.textEntry,
  });
  final String detailTitle;
  final String textEntry;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading:const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Icon(Icons.person),
          ],
        ),
        title: Text(
          detailTitle,
          style: TextStyle(fontSize: AppSizes.fontSizeSmb, color: greyLine),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: AppSizes.sm),
          child: Text(
            textEntry,
            style: TextStyle(fontSize: AppSizes.fontSizeLg, color: blackColor),
          ),
        ),
      ),
    );
  }
}
