import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  void success({required String msg}) {
    return Get.snackbar(
      "Success",
      msg,
      icon: Icon(Icons.check),
      backgroundColor: Colors.lightGreen,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      margin: EdgeInsets.all(0),
      borderRadius: 0,
    );
  }

  void failed({required String msg}) {
    return Get.snackbar(
      "Failed",
      msg,
      icon: Icon(Icons.close),
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      margin: EdgeInsets.all(0),
      borderRadius: 0,
    );
  }

  void loading({required String msg}) {
    return Get.snackbar(
      "Loading",
      msg,
      icon: Icon(Icons.watch_later_outlined),
      backgroundColor: Colors.blueAccent[300],
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: false,
      margin: EdgeInsets.all(0),
      borderRadius: 0,
    );
  }

  void notify({required String msg}) {
    return Get.snackbar(
      "Notification",
      msg,
      icon: Icon(Icons.watch_later_outlined),
      backgroundColor: Colors.grey[300],
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
    );
  }
}
