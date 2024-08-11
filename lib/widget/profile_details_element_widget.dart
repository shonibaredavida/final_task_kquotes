import 'package:flutter/material.dart';

import '../models/quote_response_model.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';

class QuoteListItem extends StatelessWidget {
  const QuoteListItem({super.key, required this.quoteItem});
  final Quote quoteItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
        right: 16,
        left: 16,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple.shade50,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: primaryColor),
              ),
              child: Text(quoteItem.id.toString()),
            ),
            title: Text(
              quoteItem.quote,
              style: const TextStyle(
                  color: black,
                  fontSize: AppSizes.fontSizeMd,
                  fontWeight: FontWeight.w300),
            ),
            subtitle: Text(
              quoteItem.author,
              style: const TextStyle(
                  color: Colors.black45,
                  fontSize: AppSizes.fontSizeXs,
                  fontWeight: AppSizes.fontWeightNormal),
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ),
    );
  }
}
