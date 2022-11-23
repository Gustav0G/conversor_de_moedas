import 'package:flutter/cupertino.dart';

class AppColors {
  var backgroundColor = const Color(0xff484848);
  var primaryColor = const Color(0xff212121);

  AppColors._i();

  static final AppColors _instance = AppColors._i();
  factory AppColors() {
    return _instance;
  }
}
