import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/buttons/customBorderButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mgt_app/getX/controller/employeListController.dart';

class EmployeeTypeButton extends StatelessWidget {
  final EmployeListController userListController =
      Get.find<EmployeListController>();
  final String btnName;
  final int value;

  EmployeeTypeButton({Key? key, required this.btnName, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBorderButton(
      title: btnName,
      width: 35.w,
      callback: () {
        userListController.onTabPressed(value);
      },
      isSelect: userListController.currentIntex.value == value ? true : false,
    );
  }
}
