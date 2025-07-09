import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nap_nest/core/utils/app_colors.dart';

class CustomToast {
  static void show({required String message, required bool isError}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: isError ? Colors.red : AppColors.secondaryColor2,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
