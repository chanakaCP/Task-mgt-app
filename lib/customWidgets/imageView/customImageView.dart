import 'package:flutter/material.dart';
import 'package:task_mgt_app/customWidgets/container/customContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageView extends StatelessWidget {
  final String imageURL;
  final String defaultImageURL;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? continerWidth;
  final double? imageWidth;
  final double? imageHeight;
  final Color? bgColor;
  final BorderRadiusGeometry? containerRadius;
  final BorderRadius? imageRadius;
  final BoxFit? boxFit;

  const CustomImageView({
    Key? key,
    required this.imageURL,
    required this.defaultImageURL,
    this.margin,
    this.padding,
    this.continerWidth,
    this.imageWidth,
    this.imageHeight,
    this.bgColor,
    this.containerRadius,
    this.imageRadius,
    this.boxFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: margin ?? EdgeInsets.all(0),
      padding: padding ?? EdgeInsets.all(0),
      width: continerWidth ?? double.infinity,
      backgroundColor: bgColor ?? Colors.transparent,
      borderRadius: containerRadius ?? BorderRadius.circular(50),
      child: (this.imageURL != "default")
          ? Container(
              height: imageHeight ?? 35.h,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: imageRadius ?? BorderRadius.circular(30),
                image: DecorationImage(
                  image: NetworkImage(this.imageURL.toString()),
                  fit: boxFit ?? BoxFit.cover,
                ),
              ),
            )
          : ClipRRect(
              borderRadius: imageRadius ?? BorderRadius.circular(50),
              child: Image.asset(
                defaultImageURL,
                height: imageHeight ?? 75.w,
                width: imageWidth ?? 85.w,
                fit: boxFit ?? BoxFit.cover,
              ),
            ),
    );
  }
}
