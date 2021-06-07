import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_mgt_app/customWidgets/container/customContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mgt_app/customWidgets/text/customText.dart';

class CustomSwitchBadge extends StatelessWidget {
  final String title;
  final bool value;
  final Function(dynamic) onChange;

  const CustomSwitchBadge({
    required this.title,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CustomText(
              text: title,
              size: 4.w,
              color: Colors.black54,
            ),
          ),
          SizedBox(width: 2.5.w),
          Transform.scale(
            scale: 1,
            child: CupertinoSwitch(
              value: value,
              activeColor: Colors.blue,
              onChanged: (value) {
                onChange(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
