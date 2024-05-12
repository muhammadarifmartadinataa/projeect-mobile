import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Info {
  static void snackbar(String message){
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      duration: Duration(milliseconds: 1700),
    );
  }
}