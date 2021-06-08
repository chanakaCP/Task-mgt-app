import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/appbar/customAppBar.dart';
import 'package:task_mgt_app/customWidgets/buttons/customBorderButton.dart';
import 'package:task_mgt_app/customWidgets/container/customContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mgt_app/screens/drawer/screens/customDrawer.dart';
import 'package:task_mgt_app/getX/controller/employeListController.dart';
import 'package:task_mgt_app/getX/services/userService.dart';
import 'package:task_mgt_app/screens/employeList/widgets/employeeListViewBody.dart';

class EmployeList extends StatelessWidget {
  final userListController = Get.put(EmployeListController());
  final UserService userService = Get.find<UserService>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: "Employes",
          isBack: true,
          drawerCallback: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        drawerEnableOpenDragGesture: false,
        endDrawer: CustomDrawer(),
        body: Obx(() {
          return Column(
            children: [
              (userService.userData.value.isAdmin!)
                  ? CustomContainer(
                      height: 8.h,
                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          CustomBorderButton(
                            title: "All Users",
                            width: 32.5.w,
                            callback: () {
                              userListController.onTabPressed(1);
                            },
                            isSelect: userListController.currentIntex.value == 1
                                ? true
                                : false,
                          ),
                          CustomBorderButton(
                            title: "Approved",
                            width: 32.5.w,
                            callback: () {
                              userListController.onTabPressed(2);
                            },
                            isSelect: userListController.currentIntex.value == 2
                                ? true
                                : false,
                          ),
                          CustomBorderButton(
                            title: "Pending",
                            width: 32.5.w,
                            callback: () {
                              userListController.onTabPressed(3);
                            },
                            isSelect: userListController.currentIntex.value == 3
                                ? true
                                : false,
                          ),
                          CustomBorderButton(
                            title: "Removed",
                            width: 32.5.w,
                            callback: () {
                              userListController.onTabPressed(4);
                            },
                            isSelect: userListController.currentIntex.value == 4
                                ? true
                                : false,
                          )
                          // EmployeeTypeButton(btnName: 'All Users', value: 1),
                          // EmployeeTypeButton(btnName: 'Verified Users', value: 2),
                          // EmployeeTypeButton(btnName: 'Pending Users', value: 3),
                        ],
                      ))
                  : Container(),
              Wrap(children: [
                CustomContainer(
                  marginTop:
                      (userService.userData.value.isAdmin!) ? 0.h : 1.25.h,
                  height:
                      (userService.userData.value.isAdmin!) ? 82.25.h : 89.h,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return EmployeeListViewBody();
                    },
                  ),
                ),
              ])
            ],
          );
        }),
      ),
    );
  }
}
