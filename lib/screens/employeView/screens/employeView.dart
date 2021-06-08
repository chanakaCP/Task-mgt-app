import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/appbar/customAppBar.dart';
import 'package:task_mgt_app/customWidgets/buttons/custombutton.dart';
import 'package:task_mgt_app/customWidgets/container/customContainer.dart';
import 'package:task_mgt_app/customWidgets/formComponent/customFormField.dart';
import 'package:task_mgt_app/customWidgets/text/customText.dart';
import 'package:task_mgt_app/customWidgets/imageView/customImageView.dart';
import 'package:task_mgt_app/getX/controller/employeeViewController.dart';
import 'package:task_mgt_app/getX/services/userService.dart';
import 'package:task_mgt_app/models/RegisterUser.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mgt_app/screens/drawer/screens/customDrawer.dart';
import 'package:task_mgt_app/screens/employeView/widgets/customCounterCard.dart';
import 'package:task_mgt_app/screens/employeView/widgets/customTaskBadge.dart';

class EmployeView extends StatelessWidget {
  final RegisterUser employe;
  EmployeView({required this.employe});

  final empController = Get.put(EmployeeViewController());
  final UserService userService = Get.find<UserService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: "Employe",
          isBack: true,
          drawerCallback: () {
            if (employe.userId != null) Scaffold.of(context).openDrawer();
          },
        ),
        drawerEnableOpenDragGesture: false,
        endDrawer: CustomDrawer(),
        body: GetX<EmployeeViewController>(
          initState: (_) {
            empController.initState(employe);
          },
          builder: (_) {
            return SingleChildScrollView(
              child: CustomContainer(
                margin: EdgeInsets.symmetric(
                  vertical: 2.5.h,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomContainer(
                        margin: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 5.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imageURL: employe.profileURL.toString(),
                              defaultImageURL: "assets/profile.png",
                              imageHeight: 22.5.h,
                              continerWidth: 22.5.h,
                              imageWidth: 22.5.h,
                              containerRadius: BorderRadius.circular(25),
                              imageRadius: BorderRadius.circular(25),
                            ),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  (userService.user.isAdmin! &&
                                          userService.userData.value.userId !=
                                              employe.userId)
                                      ? CustomSwitchBadge(
                                          value: empController.isAproved.value,
                                          title: "Permission",
                                          onChange: (value) {
                                            if (!employe.isRemoved!) {
                                              empController
                                                  .changeApprovl(value);
                                            }
                                          },
                                        )
                                      : Container(),
                                  SizedBox(height: 1.h),
                                  CustomSwitchBadge(
                                    value: empController.isAdmin.value,
                                    title: "Admin",
                                    onChange: (value) {
                                      if (userService.userData.value.userId !=
                                              employe.userId &&
                                          !employe.isRemoved! &&
                                          userService.userData.value.isAdmin!) {
                                        empController.changePermission(value);
                                      }
                                    },
                                  ),
                                  SizedBox(height: 1.5.h),
                                  CustomText(
                                    text: "Activities",
                                    size: 4.w,
                                    color: Colors.black54,
                                  ),
                                  SizedBox(height: 1.h),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomCounterCard(
                                          title: "Assigned",
                                          value:
                                              employe.taskAssigned.toString(),
                                        ),
                                        CustomCounterCard(
                                          title: "Completed",
                                          value:
                                              employe.taskCompleted.toString(),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      CustomFormField(
                        hintText: "example@gmail.com",
                        lableText: "Email",
                        isPass: false,
                        fieldController: empController.emailController,
                        prefixIcon: Icons.email,
                        isEditable: false,
                      ),
                      SizedBox(height: 3.h),
                      CustomFormField(
                        hintText: "XXXX-XX-XX",
                        lableText: "Joined on",
                        isPass: false,
                        fieldController: empController.dateController,
                        prefixIcon: Icons.date_range_outlined,
                        isEditable: false,
                      ),
                      SizedBox(height: 3.h),
                      CustomFormField(
                        hintText: "Jhon paul",
                        lableText: "Username",
                        isPass: false,
                        fieldController: empController.nameController,
                        prefixIcon: Icons.keyboard,
                        isEditable:
                            empController.checkEditPermission(employe.userId!),
                      ),
                      SizedBox(height: 3.h),
                      CustomFormField(
                        hintText: "Software Engineer",
                        lableText: "Job Position",
                        isPass: false,
                        fieldController: empController.positionController,
                        prefixIcon: Icons.laptop,
                        isEditable:
                            empController.checkEditPermission(employe.userId!),
                      ),
                      ((userService.userData.value.isAdmin! ||
                                  userService.userData.value.userId ==
                                      employe.userId) &&
                              !employe.isRemoved!)
                          ? CustomContainer(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 5.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  (userService.userData.value.isAdmin! &&
                                          userService.userData.value.userId !=
                                              employe.userId)
                                      ? CustomButton(
                                          width: 42.5.w,
                                          title: "Delete",
                                          textColor: Colors.red,
                                          buttonColor: Colors.white,
                                          borderColor: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderWidth: 1,
                                          callback: () {
                                            empController.deleteUser();
                                          },
                                        )
                                      : Container(),
                                  CustomButton(
                                    width: (userService
                                                .userData.value.isAdmin! &&
                                            userService.userData.value.userId !=
                                                employe.userId)
                                        ? 42.5.w
                                        : 92.w,
                                    title: "Save",
                                    textColor: Colors.white,
                                    callback: () {
                                      if (formKey.currentState!.validate()) {
                                        empController.updateUser();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
