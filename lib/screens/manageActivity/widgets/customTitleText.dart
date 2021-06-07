import 'package:flutter/material.dart';
import 'package:task_mgt_app/customWidgets/customText.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitleText extends StatelessWidget {
  final String text;

  const CustomTitleText({required this.text});
  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      color: Colors.blueGrey,
      weight: FontWeight.w700,
      size: 4.5.sp,
    );
  }
}
