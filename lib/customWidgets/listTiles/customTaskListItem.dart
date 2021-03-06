import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/buttons/customIconButton.dart';
import 'package:task_mgt_app/customWidgets/container/customContainer.dart';
import 'package:task_mgt_app/customWidgets/text/customText.dart';
import 'package:task_mgt_app/customWidgets/imageView/customImageView.dart';
import 'package:task_mgt_app/getX/services/userService.dart';
import 'package:task_mgt_app/models/ActivityModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTaskListItem extends StatelessWidget {
  final VoidCallback onTapCard;
  final ActivityModel activity;

  CustomTaskListItem({
    Key? key,
    required this.onTapCard,
    required this.activity,
  }) : super(key: key);

  final UserService userService = Get.find<UserService>();

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
        padding: EdgeInsets.only(left: 1.h, right: 1.5.h),
        child: Row(
          children: [
            CustomImageView(
              imageURL: activity.assignedProfileURL.toString(),
              defaultImageURL: "assets/profile.png",
              imageHeight: 8.h,
              imageWidth: 8.h,
              continerWidth: 8.h,
              containerRadius: BorderRadius.circular(10),
              imageRadius: BorderRadius.circular(10),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: CustomContainer(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 1.5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: activity.title.toString(),
                      weight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                      size: 4.5.w,
                      color: Colors.black87,
                    ),
                    SizedBox(height: 0.25.h),
                    CustomText(
                      text: "Assigned to : " + activity.assignedName.toString(),
                      weight: FontWeight.w400,
                      size: 3.5.w,
                      color: Colors.black54,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 0.25.h),
                    CustomText(
                      text: activity.status.toString(),
                      weight: FontWeight.w500,
                      size: 2.5.w,
                      color: Colors.black54,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 2.5.w),
            (userService.userData.value.isAdmin! ||
                    (userService.userData.value.userId == activity.assignedTo))
                ? CustomIconButton(
                    icon: Icons.edit_outlined,
                    iconSize: 8.w,
                    bgColor: Colors.blue[100],
                    iconColor: Colors.blue,
                    callback: () {
                      onTapCard();
                    },
                  )
                : Container(),
          ],
        ),
      ),
      onTap: () {
        onTapCard();
      },
    );
  }
}
