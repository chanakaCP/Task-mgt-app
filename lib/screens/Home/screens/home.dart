import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/appbar/customAppBar.dart';
import 'package:task_mgt_app/customWidgets/buttons/customBorderButton.dart';
import 'package:task_mgt_app/customWidgets/customContainer.dart';
import 'package:task_mgt_app/customWidgets/customLoadingWidget.dart';
import 'package:task_mgt_app/getX/controller/homeController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mgt_app/screens/Home/screens/homeBody.dart';
import 'package:task_mgt_app/screens/employeList/screens/employeeList.dart';
import 'package:task_mgt_app/screens/manageActivity/screens/manageActivity.dart';

class Home extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeController.user!.value.isAdmin != null) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            onPressed: () {
              Get.to(EmployeList());
              // Get.to(ManageActivity(isEdit: true));
            },
            child: Icon(Icons.add),
          ),
          // (homeController.user!.value.isAdmin! == true)
          //     ? FloatingActionButton(
          //         backgroundColor: Colors.blue,
          //         foregroundColor: Colors.white,
          //         onPressed: () {
          //           Get.to(EmployeList());
          //           // Get.to(ManageActivity(isEdit: true));
          //         },
          //         child: Icon(Icons.add),
          //       )
          //     : Container(),
          appBar: CustomAppBar(
            title: "Home",
            drawerCallback: () {},
          ),
          // endDrawer: CustomDrawer(),
          body: Column(
            children: [
              CustomContainer(
                height: 8.h,
                padding: EdgeInsets.symmetric(vertical: 1.5.h),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    CustomBorderButton(
                      title: "All",
                      callback: () {
                        homeController.onTabPressed(1);
                      },
                      isSelect:
                          homeController.currentIntex.value == 1 ? true : false,
                    ),
                    CustomBorderButton(
                      title: "To Do",
                      callback: () {
                        homeController.onTabPressed(2);
                      },
                      isSelect:
                          homeController.currentIntex.value == 2 ? true : false,
                    ),
                    CustomBorderButton(
                      title: "In Progress",
                      callback: () {
                        homeController.onTabPressed(3);
                      },
                      isSelect:
                          homeController.currentIntex.value == 3 ? true : false,
                    ),
                    CustomBorderButton(
                      title: "Done",
                      callback: () {
                        homeController.onTabPressed(4);
                      },
                      isSelect:
                          homeController.currentIntex.value == 4 ? true : false,
                    ),
                  ],
                ),
              ),
              Wrap(children: [
                Container(
                  height: 82.25.h,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return HomeBody();
                    },
                  ),
                ),
              ])
            ],
          ),
        );
      } else {
        return Scaffold(
          appBar: CustomAppBar(
            title: "Home",
            drawerCallback: () {},
          ),
          body: Center(
            child: CustomContainer(
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              child: CustomLoadingWidget(),
            ),
          ),
        );
      }
    });
  }
}
