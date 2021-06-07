import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({
    Key? key,
    required this.child,
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
    this.height,
    this.width,
    this.backgroundColor,
    this.border,
    this.borderRadius,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    this.boxShadow,
    this.shadowColor,
    this.blurRadius,
    this.spredRadius,
    this.alignment = Alignment.center,
  }) : super(key: key);

  final Widget child;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Alignment? alignment;
  final BorderRadiusGeometry? borderRadius;
// if u use margin, no need margin left, margin right, margin top, margin bottom
  final EdgeInsetsGeometry? margin;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;
  final double marginTop;
// if u use padding, no need padding left, padding right, padding top, padding bottom
  final EdgeInsetsGeometry? padding;
  final double paddingLeft;
  final double paddingRight;
  final double paddingBottom;
  final double paddingTop;
// if you are use borde, no need  borderColor, borderWidth
  final BoxBorder? border;
  final Color borderColor;
  final double borderWidth;
// if you are use boxShadow, no need shadowColor, blurRadius, spredRadius
  final List<BoxShadow>? boxShadow;
  final Color? shadowColor;
  final double? blurRadius;
  final double? spredRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      height: height,
      width: width,
      alignment: alignment,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: borderRadius,
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: shadowColor ?? Colors.transparent,
                blurRadius: blurRadius ?? 0,
                spreadRadius: spredRadius ?? 0,
              )
            ],
        border: border ??
            Border.all(
              color: borderColor,
              width: borderWidth,
            ),
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
    );
  }
}
