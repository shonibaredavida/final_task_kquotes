import 'package:flutter/material.dart';
import 'package:my_quote_app/models/quote_response_model.dart';
import 'package:my_quote_app/utils/constants/colors.dart';
import 'package:my_quote_app/utils/constants/sizes.dart';

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

// Card(
// color: Colors.purple.shade50,
// child: Column(children: [Icon(Icons.format_quote_rounded),
// Row(children: [
// Container(
// padding: const EdgeInsets.all(10.0),
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// color: Colors.white,
// border: Border.all(color: primaryColor)
// ),
// child: Text(quoteItem.id.toString()),
// ),
// SizedBox(width: AppSizes.smallDefaultSpace,),
// Text(quoteItem.quote)
// ],),
//
// Text(quoteItem.author,style: TextStyle(color: grey,fontSize: AppSizes.fontSizeXxs,fontWeight: AppSizes.fontWeightNormal),textAlign: TextAlign.end,,),
// ],),
// );
