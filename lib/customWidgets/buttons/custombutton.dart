import 'package:flutter/material.dart';
import 'package:task_mgt_app/customWidgets/text/customText.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final VoidCallback callback;
  final double? height, width, fontsize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? margin;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;
  final double marginTop;
  final EdgeInsetsGeometry? padding;
  final double paddingLeft;
  final double paddingRight;
  final double paddingBottom;
  final double paddingTop;
  final BorderRadiusGeometry? borderRadius;
  final BorderSide? borderSide;
  final double borderWidth;
  final List<BoxShadow>? boxShadow;

  final double? elevation;

  CustomButton({
    this.title,
    this.icon,
    required this.callback,
    this.textColor = Colors.white,
    this.buttonColor = Colors.blue,
    this.borderColor = Colors.transparent,
    this.height,
    this.width,
    this.fontsize,
    this.fontWeight,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    this.marginTop = 0,
    this.margin,
    this.paddingLeft = 0,
    this.paddingRight = 0,
    this.paddingBottom = 0,
    this.paddingTop = 0,
    this.padding,
    this.borderRadius,
    this.borderSide,
    this.borderWidth = 0,
    this.boxShadow,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: borderRadius ?? BorderRadius.circular(15.0),
      ),
      margin: margin ??
          EdgeInsets.only(
            left: marginLeft,
            right: marginRight,
            top: marginTop,
            bottom: marginBottom,
          ),
      padding: padding ??
          EdgeInsets.only(
            left: paddingLeft,
            right: paddingRight,
            top: paddingTop,
            bottom: paddingBottom,
          ),
      child: SizedBox(
        height: height ?? 6.h,
        width: width ?? double.infinity,
        child: TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: title ?? "",
                color: textColor,
                size: fontsize ?? 2.5.h,
                weight: fontWeight ?? FontWeight.w500,
              ),
              (icon != null) ? SizedBox(width: 5.w) : Container(),
              (icon != null)
                  ? Icon(
                      icon,
                      color: textColor,
                    )
                  : Container()
            ],
          ),
          style: TextButton.styleFrom(
            elevation: elevation,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(50.0),
              side: borderSide ??
                  BorderSide(
                    color: borderColor,
                    width: borderWidth,
                  ),
            ),
            backgroundColor: buttonColor,
          ),
          onPressed: callback,
        ),
      ),
    );
  }
}
