import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/appbar/customAppBar.dart';
import 'package:task_mgt_app/customWidgets/buttons/custombutton.dart';
import 'package:task_mgt_app/customWidgets/customContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mgt_app/customWidgets/customLoadingWidget.dart';
import 'package:task_mgt_app/customWidgets/customText.dart';
import 'package:task_mgt_app/getX/controller/assignActivityController.dart';
import 'package:task_mgt_app/models/ActivityModel.dart';
import 'package:task_mgt_app/customWidgets/listTiles/customUserListItem.dart';

class AssignActivity extends StatelessWidget {
  final ActivityModel activity;
  AssignActivity({required this.activity});

  final assignActivityController = Get.put(AssignActivityController());

  @override
  Widget build(BuildContext context) {
    print(activity.toMap());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: (activity.assignedTo != null)
              ? "Re Assgin users"
              : "Assgin users",
          isBack: true,
          drawerCallback: () {},
        ),
        bottomSheet: CustomButton(
          margin: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 2.5.h,
          ),
          title: "Add Activity",
          fontsize: 5.w,
          textColor: Colors.white,
          callback: () {
            assignActivityController.addActivity(activity);
          },
        ),
        body: GetX<AssignActivityController>(
          initState: (_) {
            assignActivityController.initialize(activity);
          },
          builder: (_) {
            if (assignActivityController.isLoading.value == true) {
              return Center(child: CustomLoadingWidget());
            } else {
              if (assignActivityController.userlist.length == 0) {
                return Center(
                  child: CustomContainer(
                    child: CustomText(text: "No Activity found..."),
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: CustomContainer(
                    padding: EdgeInsets.only(
                      top: 2.h,
                    ),
                    child: Column(
                      children: [
                        for (var i = 0;
                            i < assignActivityController.userlist.length;
                            i++)
                          if (assignActivityController
                                  .userlist[i].isApproved! &&
                              !assignActivityController.userlist[i].isRemoved!)
                            CustomUserListItem(
                              onTapItem: () {
                                assignActivityController.onSelectUser(
                                    assignActivityController.userlist[i],
                                    activity);
                              },
                              tailIcon: (assignActivityController
                                          .selectedUserId.value ==
                                      assignActivityController
                                          .userlist[i].userId
                                          .toString())
                                  ? Icons.check_box_rounded
                                  : Icons.check_box_outline_blank_rounded,
                              user: assignActivityController.userlist[i],
                            ),
                      ],
                    ),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
