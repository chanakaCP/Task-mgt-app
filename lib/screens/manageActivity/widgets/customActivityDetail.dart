import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mgt_app/customWidgets/container/customCardWidget.dart';
import 'package:task_mgt_app/customWidgets/container/customContainer.dart';
import 'package:task_mgt_app/customWidgets/text/customText.dart';
import 'package:task_mgt_app/customWidgets/imageView/customImageView.dart';
import 'package:task_mgt_app/screens/manageActivity/widgets/customTitleText.dart';

class CustomActivityDetail extends StatelessWidget {
  final String header;
  final String user;
  final String position;
  final String profileURL;
  final String dateText;

  const CustomActivityDetail({
    required this.header,
    required this.user,
    required this.position,
    required this.profileURL,
    required this.dateText,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      childWidget: CustomContainer(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.symmetric(horizontal: 2.5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitleText(text: header),
            SizedBox(height: 1.h),
            Row(
              children: [
                CustomImageView(
                  imageURL: profileURL,
                  defaultImageURL: "assets/profile.png",
                  imageHeight: 7.5.h,
                  continerWidth: 7.5.h,
                  imageWidth: 7.5.h,
                  containerRadius: BorderRadius.circular(15),
                  imageRadius: BorderRadius.circular(15),
                ),
                CustomContainer(
                  marginLeft: 4.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: user,
                        color: Colors.blueGrey[900],
                        weight: FontWeight.w700,
                        size: 4.sp,
                      ),
                      CustomText(
                        text: position,
                        color: Colors.blueGrey,
                        weight: FontWeight.w700,
                        size: 3.sp,
                      ),
                      CustomText(
                        text: dateText,
                        color: Colors.blueGrey,
                        weight: FontWeight.w700,
                        size: 3.sp,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
