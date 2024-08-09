import 'package:flutter/material.dart';

linearProgressIndicator() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 14),
    child: const LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
    ),
  );
}
