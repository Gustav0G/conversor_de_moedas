import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyle {
  var boxDecoration = BoxDecoration(
      color: AppColors().backgroundColor,
      borderRadius: BorderRadius.circular(20));

  var inputDecoration = const InputDecoration(
    border: InputBorder.none,
    contentPadding: EdgeInsets.all(0.8),
  );

  var buttonBoxDecoration = BoxDecoration(
      color: const Color(0xff212121),
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(blurRadius: 5, offset: Offset(3, 2)),
      ]);

  var buttonBoxDecorationSelected = BoxDecoration(
    color: const Color(0xff212121),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(width: 2, color: Colors.white),
  );

  var buttonTextStyleSelected = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
  );
  var buttonTextStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.2,
  );

  var cardTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.2,
  );

  AppStyle._i();
  static final AppStyle _instance = AppStyle._i();
  factory AppStyle() {
    return _instance;
  }
}
