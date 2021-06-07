import 'package:flutter/material.dart';
import 'package:task_mgt_app/customWidgets/container/customContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget childWidget;
  final EdgeInsetsGeometry? padding;

  const CustomCardWidget({required this.childWidget, this.padding});
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      blurRadius: 5,
      spredRadius: 5,
      shadowColor: Colors.black12,
      backgroundColor: Colors.white,
      borderRadius: BorderRadius.circular(15),
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.h),
      margin: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 1.5.h),
      child: childWidget,
    );
  }
}
