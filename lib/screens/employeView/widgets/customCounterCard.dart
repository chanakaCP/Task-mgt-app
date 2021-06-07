import 'package:flutter/material.dart';
import 'package:task_mgt_app/customWidgets/container/customContainer.dart';
import 'package:task_mgt_app/customWidgets/text/customText.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCounterCard extends StatelessWidget {
  final String title;
  final String value;

  const CustomCounterCard({required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: 17.5.w,
      padding: EdgeInsets.all(2.w),
      borderRadius: BorderRadius.circular(10),
      backgroundColor: Colors.blue[200],
      child: Column(
        children: [
          CustomText(
            text: title,
            size: 2.5.w,
            weight: FontWeight.w700,
          ),
          SizedBox(height: 0.5.h),
          CustomText(
            text: value,
            size: 5.w,
            weight: FontWeight.w300,
          ),
        ],
      ),
    );
  }
}
