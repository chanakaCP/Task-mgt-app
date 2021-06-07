import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/buttons/custombutton.dart';
import 'package:task_mgt_app/getX/controller/drawerController.dart';

class CustomDrawerButton extends StatelessWidget {
  final String btnName;
  final VoidCallback onTap;
  final int index;

  final drawerController = Get.find<CustomDrawerController>();

  CustomDrawerButton({
    required this.btnName,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      marginTop: 2.5.h,
      height: 5.5.h,
      width: 60.w,
      title: btnName,
      fontsize: 2.25.h,
      textColor: (drawerController.currentIndex.value == index)
          ? Colors.white
          : Colors.blue,
      buttonColor: (drawerController.currentIndex.value == index)
          ? Colors.blue
          : Colors.white,
      borderColor: Colors.blue,
      borderRadius: BorderRadius.circular(15),
      borderWidth: 2,
      callback: () {
        drawerController.changeView(index);
        Get.back();
        Timer(Duration(milliseconds: 400), () {
          onTap();
        });
      },
    );
  }
}
