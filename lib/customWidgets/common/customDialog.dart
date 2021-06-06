import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../customText.dart';

class CustomDialog {
  void success({required String msg}) {
    return Get.snackbar(
      "Success",
      msg,
      icon: Icon(Icons.check),
      backgroundColor: Colors.lightGreen[300],
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
      backgroundColor: Colors.grey[300],
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: false,
    );
  }

  void notify({required String msg}) {
    return Get.snackbar(
      "Notification",
      msg,
      icon: Icon(Icons.notifications),
      backgroundColor: Colors.blue[200],
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      margin: EdgeInsets.all(0),
      borderRadius: 0,
    );
  }

  showLoadingDialog(msg) {
    return Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Container(
          height: 6.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 5,
              ),
              CircularProgressIndicator(),
              SizedBox(
                width: 40,
              ),
              Wrap(children: [Text(msg)])
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  Future<bool> showConfirmDialog(
      {required String content,
      required String yesText,
      required String cancelText}) async {
    return await Get.dialog(
      AlertDialog(
        content: CustomText(
          text: content,
          color: Colors.black,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(result: true);
            },
            style: TextButton.styleFrom(
              primary: Colors.blue,
              shadowColor: Colors.black12,
              backgroundColor: Colors.blue[300],
              elevation: 2,
            ),
            child: CustomText(
              text: yesText,
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: false);
            },
            child: CustomText(
              text: cancelText,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
