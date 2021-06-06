import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/customContainer.dart';
import 'package:task_mgt_app/customWidgets/customLoadingWidget.dart';
import 'package:task_mgt_app/customWidgets/customText.dart';
import 'package:task_mgt_app/getX/controller/userListController.dart';
import 'package:task_mgt_app/customWidgets/listTiles/customUserListItem.dart';

class EmployeeListViewBody extends StatelessWidget {
  final UserListController userListController = Get.put(UserListController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        if (userListController.isLoading.value == true) {
          return Center(child: CustomLoadingWidget());
        } else {
          if (userListController.userlist.length == 0) {
            return Center(
              child: CustomContainer(
                child: CustomText(text: userListController.userEmptyText.value),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: CustomContainer(
                child: Column(
                  children: [
                    //  ALL USERS
                    if (userListController.currentIntex.value == 1)
                      for (var i = 0;
                          i < userListController.userlist.length;
                          i++)
                        CustomUserListItem(
                          onTapItem: () {
                            userListController
                                .onClickUser(userListController.userlist[i]);
                          },
                          user: userListController.userlist[i],
                          tailIcon: Icons.arrow_forward_rounded,
                          iconBGColor: Colors.blue[100],
                        ),

                    //  VERIFIED USERS
                    if (userListController.currentIntex.value == 2)
                      for (var i = 0;
                          i < userListController.userlist.length;
                          i++)
                        if (userListController.userlist[i].isApproved == true)
                          CustomUserListItem(
                            onTapItem: () {
                              userListController
                                  .onClickUser(userListController.userlist[i]);
                            },
                            user: userListController.userlist[i],
                            tailIcon: Icons.arrow_forward_rounded,
                            iconBGColor: Colors.blue[100],
                          ),

                    //  ALL USERS
                    if (userListController.currentIntex.value == 3)
                      for (var i = 0;
                          i < userListController.userlist.length;
                          i++)
                        if (userListController.userlist[i].isApproved == false)
                          CustomUserListItem(
                            onTapItem: () {
                              userListController
                                  .onClickUser(userListController.userlist[i]);
                            },
                            user: userListController.userlist[i],
                            tailIcon: Icons.arrow_forward_rounded,
                            iconBGColor: Colors.blue[100],
                          ),
                  ],
                ),
              ),
            );
          }
        }
      }),
    );
  }
}