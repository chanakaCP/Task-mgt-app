import 'package:flutter/material.dart';
import 'package:task_mgt_app/customWidgets/buttons/custombutton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBorderButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final bool isSelect;
  final double? width;

  const CustomBorderButton(
      {required this.title,
      required this.callback,
      required this.isSelect,
      this.width});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      margin: EdgeInsets.symmetric(horizontal: 2.5.w),
      title: title,
      borderRadius: BorderRadius.circular(15),
      borderColor: Colors.blue,
      textColor: isSelect ? Colors.white : Colors.blue,
      buttonColor: isSelect ? Colors.blue : Colors.transparent,
      borderWidth: 2,
      fontsize: 3.5.w,
      callback: callback,
      height: 5.h,
      width: width ?? 30.w,
    );
  }
}
