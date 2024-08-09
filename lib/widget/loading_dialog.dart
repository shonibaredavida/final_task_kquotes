import 'package:flutter/material.dart';

class LoadingDialogWidget extends StatelessWidget {
  const LoadingDialogWidget({super.key, this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 14, bottom: 8),
            child: const CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation(Color.fromARGB(255, 32, 112, 115)),
            ),
          ),
          Text(
            "$message, Please wait....",
          )
        ],
      ),
    );
  }
}
