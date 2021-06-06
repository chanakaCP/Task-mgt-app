import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/customContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mgt_app/customWidgets/customText.dart';
import 'package:task_mgt_app/customWidgets/buttons/custombutton.dart';

class CustomDialog {
  // success dialog box
  showSuccessDialog({required String msg, VoidCallback? callback}) async {
    await Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomContainer(
                borderRadius: BorderRadius.circular(10),
                height: 25.h,
                margin: EdgeInsets.all(10),
                backgroundColor: Colors.lightGreen,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      size: 15.h,
                      color: Colors.black,
                    ),
                    CustomText(
                      text: "SUCCESS",
                      weight: FontWeight.w600,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              CustomContainer(
                borderRadius: BorderRadius.circular(10),
                backgroundColor: Colors.white,
                margin: EdgeInsets.symmetric(
                  vertical: 2.5.h,
                  horizontal: 5.w,
                ),
                child: Column(
                  children: [
                    CustomText(
                      text: msg,
                      color: Colors.black,
                      weight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),
                    CustomButton(
                      marginTop: 5.h,
                      buttonColor: Colors.lightGreen,
                      textColor: Colors.black,
                      height: 5.h,
                      fontsize: 2.5.h,
                      width: 50.w,
                      title: "CONTINUE",
                      elevation: 5,
                      callback: callback ??
                          () {
                            Get.back();
                          },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      barrierDismissible: true,
      transitionDuration: Duration(milliseconds: 500),
      transitionCurve: Curves.easeOutCubic,
    );
  }

// error dialog box
  showErrorDialog({required String msg, VoidCallback? callback}) async {
    await Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomContainer(
                borderRadius: BorderRadius.circular(10),
                height: 25.h,
                margin: EdgeInsets.all(10),
                backgroundColor: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      size: 15.h,
                      color: Colors.black,
                    ),
                    CustomText(
                      text: "WARNING",
                      weight: FontWeight.w600,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              CustomContainer(
                borderRadius: BorderRadius.circular(10),
                backgroundColor: Colors.white,
                margin: EdgeInsets.symmetric(
                  vertical: 2.5.h,
                  horizontal: 5.w,
                ),
                child: Column(
                  children: [
                    CustomText(
                      text: msg,
                      color: Colors.black,
                      weight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),
                    CustomButton(
                      marginTop: 5.h,
                      buttonColor: Colors.red,
                      textColor: Colors.black,
                      height: 5.h,
                      fontsize: 2.5.h,
                      width: 50.w,
                      title: "RETRY",
                      elevation: 5,
                      callback: callback ??
                          () {
                            Get.back();
                          },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      barrierDismissible: true,
      transitionDuration: Duration(milliseconds: 500),
      transitionCurve: Curves.easeOutCubic,
    );
  }

// info dialog box
  showInfoDialog(
      {required String header,
      required String msg,
      required VoidCallback? callback}) async {
    await Get.dialog(
      AlertDialog(
        title: CustomText(
          textAlign: TextAlign.left,
          color: Colors.black,
          text: header,
          weight: FontWeight.w600,
        ),
        content: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: CustomText(
            text: msg,
            textAlign: TextAlign.left,
            color: Colors.black,
            size: 2.h,
            weight: FontWeight.w400,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: CustomText(
              text: "OK",
              size: 5.w,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

// confirmation dialog box
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
}
