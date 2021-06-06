import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/appbar/customAppBar.dart';
import 'package:task_mgt_app/customWidgets/buttons/customBorderButton.dart';
import 'package:task_mgt_app/customWidgets/customContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mgt_app/getX/controller/userListController.dart';
import 'package:task_mgt_app/screens/employeList/widgets/employeeListViewBody.dart';

class EmployeList extends StatelessWidget {
  final UserListController userListController = Get.put(UserListController());

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
          drawerCallback: () {},
        ),
        body: Obx(() {
          return Column(
            children: [
              CustomContainer(
                height: 8.h,
                padding: EdgeInsets.symmetric(
                  vertical: 1.5.h,
                  horizontal: 1.25.w,
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    CustomBorderButton(
                      title: "All Users",
                      width: 27.5.w,
                      callback: () {
                        userListController.onTabPressed(1);
                      },
                      isSelect: userListController.currentIntex.value == 1
                          ? true
                          : false,
                    ),
                    CustomBorderButton(
                      title: "Approved",
                      width: 27.5.w,
                      callback: () {
                        userListController.onTabPressed(2);
                      },
                      isSelect: userListController.currentIntex.value == 2
                          ? true
                          : false,
                    ),
                    CustomBorderButton(
                      title: "Pending",
                      width: 27.5.w,
                      callback: () {
                        userListController.onTabPressed(3);
                      },
                      isSelect: userListController.currentIntex.value == 3
                          ? true
                          : false,
                    )
                    // EmployeeTypeButton(btnName: 'All Users', value: 1),
                    // EmployeeTypeButton(btnName: 'Verified Users', value: 2),
                    // EmployeeTypeButton(btnName: 'Pending Users', value: 3),
                  ],
                ),
              ),
              Wrap(children: [
                Container(
                  height: 82.25.h,
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
