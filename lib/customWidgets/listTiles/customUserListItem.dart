import 'package:flutter/material.dart';
import 'package:task_mgt_app/customWidgets/buttons/customIconButton.dart';
import 'package:task_mgt_app/customWidgets/customContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mgt_app/customWidgets/customText.dart';
import 'package:task_mgt_app/customWidgets/imageView/customImageView.dart';
import 'package:task_mgt_app/models/RegisterUser.dart';

class CustomUserListItem extends StatelessWidget {
  final VoidCallback onTapItem;
  final RegisterUser user;
  final IconData tailIcon;
  final Color? iconColor;
  final Color? iconBGColor;
  CustomUserListItem({
    Key? key,
    required this.onTapItem,
    required this.user,
    required this.tailIcon,
    this.iconColor,
    this.iconBGColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: CustomContainer(
        height: 10.h,
        blurRadius: 5,
        spredRadius: 5,
        shadowColor: Colors.black12,
        backgroundColor: Colors.white,
        borderRadius: BorderRadius.circular(15),
        margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        padding: EdgeInsets.symmetric(horizontal: 1.h),
        child: Row(
          children: [
            CustomImageView(
              imageURL: user.profileURL.toString(),
              defaultImageURL: "assets/profile.png",
              imageHeight: 8.h,
              imageWidth: 8.h,
              continerWidth: 8.h,
              containerRadius: BorderRadius.circular(10),
              imageRadius: BorderRadius.circular(10),
            ),
            SizedBox(width: 5.w),
            Expanded(
              child: CustomContainer(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 1.5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: user.name.toString(),
                      weight: FontWeight.w500,
                    ),
                    SizedBox(height: 0.25.h),
                    CustomText(
                      text: user.position.toString(),
                      weight: FontWeight.w400,
                      size: 3.5.w,
                    )
                  ],
                ),
              ),
            ),
            CustomIconButton(
              icon: tailIcon,
              iconSize: 8.w,
              bgColor: iconBGColor ?? Colors.white,
              iconColor: iconColor ?? Colors.blue,
              callback: () {
                onTapItem();
              },
            ),
          ],
        ),
      ),
      onTap: () {
        onTapItem();
      },
    );
  }
}
