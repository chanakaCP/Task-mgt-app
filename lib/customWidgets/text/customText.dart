import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight? weight;
  final Color? color;
  final double? size;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLine;
  CustomText({
    required this.text,
    this.weight,
    this.color,
    this.size,
    this.textAlign,
    this.overflow,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxLine ?? null,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        fontWeight: weight ?? FontWeight.w500,
        fontSize: size ?? 5.w,
        color: color ?? Colors.black,
      ),
      softWrap: true,
    );
  }
}
