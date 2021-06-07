import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../customText.dart';

class CustomDialog {
  void success({required String msg}) {
    return Get.snackbar(
      "",
      "",
      titleText: CustomText(
        text: "SUCCESS",
        color: Colors.green[900],
        weight: FontWeight.w700,
      ),
      messageText: CustomText(
        text: msg,
        size: 3.w,
        color: Colors.green[900],
        weight: FontWeight.w500,
      ),
      padding: EdgeInsets.fromLTRB(15.w, 2.5.h, 5.w, 2.5.h),
      icon: Icon(
        Icons.check_circle,
        size: 15.w,
      ),
      backgroundColor: Colors.lightGreen[300],
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      margin: EdgeInsets.all(0),
      borderRadius: 0,
    );
  }

  void failed({required String msg}) {
    return Get.snackbar(
      "",
      "",
      titleText: CustomText(
        text: "FAILED",
        color: Colors.green[900],
        weight: FontWeight.w700,
      ),
      messageText: CustomText(
        text: msg,
        size: 3.w,
        color: Colors.green[900],
        weight: FontWeight.w500,
      ),
      padding: EdgeInsets.fromLTRB(15.w, 2.5.h, 5.w, 2.5.h),
      icon: Icon(
        Icons.close_rounded,
        size: 15.w,
      ),
      backgroundColor: Colors.lightGreen[300],
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      margin: EdgeInsets.all(0),
      borderRadius: 0,
    );
  }

  void notify({required String msg}) {
    return Get.snackbar(
      "",
      "",
      titleText: CustomText(
        text: "NOTIFICATION",
        color: Colors.blue[200],
        weight: FontWeight.w700,
      ),
      messageText: CustomText(
        text: msg,
        size: 3.w,
        color: Colors.green[900],
        weight: FontWeight.w500,
      ),
      padding: EdgeInsets.fromLTRB(15.w, 2.5.h, 5.w, 2.5.h),
      icon: Icon(
        Icons.notifications_on_outlined,
        size: 15.w,
      ),
      backgroundColor: Colors.lightGreen[300],
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
