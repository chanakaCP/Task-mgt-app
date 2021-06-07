import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/buttons/customIconButton.dart';
import 'package:task_mgt_app/customWidgets/buttons/custombutton.dart';
import 'package:task_mgt_app/customWidgets/common/customDialog.dart';
import 'package:task_mgt_app/customWidgets/container/customContainer.dart';
import 'package:task_mgt_app/customWidgets/text/customText.dart';
import 'package:task_mgt_app/customWidgets/imageView/customImageView.dart';
import 'package:task_mgt_app/getX/controller/drawerController.dart';
import 'package:task_mgt_app/getX/services/userService.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mgt_app/screens/contact/screens/contactView.dart';
import 'package:task_mgt_app/screens/drawer/widgets/customDrawerButton.dart';
import 'package:task_mgt_app/screens/employeList/screens/employeeList.dart';
import 'package:task_mgt_app/screens/employeView/screens/employeView.dart';

class CustomDrawer extends StatelessWidget {
  final userService = Get.find<UserService>();
  final drawerController = Get.put(CustomDrawerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.25.h),
      width: 90.w,
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: CustomContainer(
              alignment: Alignment.topCenter,
              marginTop: 5.h,
              marginRight: 5.w,
              child: CustomIconButton(
                icon: Icons.close,
                iconSize: 8.w,
                bgColor: Colors.blue[700],
                iconColor: Colors.blue[200],
                callback: () {
                  Get.back();
                },
              ),
            ),
            onTap: () {
              Get.back();
            },
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              topLeft: Radius.circular(35),
            ),
            child: CustomContainer(
              width: 75.w,
              child: Drawer(
                child: CustomContainer(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 5.h,
                  ),
                  child: Obx(() {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomContainer(
                          child: CustomImageView(
                            imageURL: userService.userData.value.profileURL
                                .toString(),
                            defaultImageURL: "assets/profile.png",
                            imageHeight: 60.w,
                            continerWidth: 60.w,
                            imageRadius: BorderRadius.circular(25),
                          ),
                        ),
                        SizedBox(height: 2.5.h),
                        CustomText(
                          text: userService.userData.value.name.toString(),
                          color: Colors.blue[900],
                          weight: FontWeight.w600,
                          size: 6.w,
                        ),
                        CustomText(
                          text: userService.userData.value.position.toString(),
                          color: Colors.blue[700],
                          weight: FontWeight.w400,
                          size: 4.w,
                        ),
                        CustomText(
                          text: userService.userData.value.email.toString(),
                          color: Colors.blue[700],
                          weight: FontWeight.w400,
                          size: 4.w,
                        ),
                        SizedBox(height: 2.25.h),
                        CustomDrawerButton(
                          btnName: "Activities",
                          onTap: () {
                            Get.toNamed("/home");
                          },
                          index: 1,
                        ),
                        CustomDrawerButton(
                          btnName: "Employees",
                          onTap: () {
                            Get.to(EmployeList());
                          },
                          index: 2,
                        ),
                        CustomDrawerButton(
                          btnName: "Contact",
                          onTap: () {
                            Get.to(ContactView());
                          },
                          index: 3,
                        ),
                        CustomDrawerButton(
                          btnName: "Profile",
                          onTap: () {
                            Get.to(EmployeView(employe: userService.user));
                          },
                          index: 4,
                        ),
                        CustomButton(
                          height: 5.5.h,
                          width: 60.w,
                          marginTop: 5.h,
                          title: "LogOut",
                          textColor: Colors.white,
                          buttonColor: Colors.red,
                          borderColor: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                          borderWidth: 1,
                          callback: () {
                            Get.back();
                            Timer(Duration(milliseconds: 250), () {
                              CustomDialog()
                                  .showConfirmDialog(
                                content: "Are you sure you want to LOGOUT",
                                yesText: "YES",
                                cancelText: "CANCEL",
                              )
                                  .then((value) {
                                if (value)
                                  drawerController.signOut();
                                else
                                  Get.back();
                              });
                            });
                          },
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
