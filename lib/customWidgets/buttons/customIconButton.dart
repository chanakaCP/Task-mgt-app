import 'package:flutter/material.dart';
import 'package:task_mgt_app/customWidgets/container/customContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.callback,
    this.height,
    this.width,
    this.iconSize,
    this.borderRadius,
    this.iconColor,
    this.bgColor,
  }) : super(key: key);

  final double? height, width, iconSize;
  final IconData icon;
  final BorderRadiusGeometry? borderRadius;
  final Color? iconColor, bgColor;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: CustomContainer(
        height: height ?? 5.h,
        width: width ?? 5.h,
        backgroundColor: bgColor ?? Colors.blue,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        child: Icon(
          icon,
          color: iconColor ?? Colors.white,
          size: iconSize ?? 3.h,
        ),
      ),
      onTap: callback,
    );
  }
}
