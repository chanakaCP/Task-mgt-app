import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/appbar/customAppBar.dart';
import 'package:task_mgt_app/customWidgets/buttons/customIconButton.dart';
import 'package:task_mgt_app/customWidgets/container/customContainer.dart';
import 'package:task_mgt_app/customWidgets/formComponent/customDatePickField.dart';
import 'package:task_mgt_app/customWidgets/formComponent/customFilterDropdown.dart';
import 'package:task_mgt_app/screens/drawer/screens/customDrawer.dart';
import 'package:task_mgt_app/customWidgets/customLoadingWidget.dart';
import 'package:task_mgt_app/getX/controller/homeController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mgt_app/getX/services/userService.dart';
import 'package:task_mgt_app/models/ActivityModel.dart';
import 'package:task_mgt_app/screens/Home/widgets/homeBody.dart';
import 'package:task_mgt_app/screens/manageActivity/screens/manageActivity.dart';

class Home extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final UserService userService = Get.put(UserService());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeController.user!.value.isAdmin != null) {
        return Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: (homeController.user!.value.isAdmin! == true)
              ? FloatingActionButton(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    Get.to(ManageActivity(
                      isEdit: false,
                      activity: ActivityModel(),
                    ));
                  },
                  child: Icon(Icons.add),
                )
              : Container(),
          appBar: CustomAppBar(
            title: "Activities",
            drawerCallback: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          drawerEnableOpenDragGesture: false,
          endDrawer: CustomDrawer(),
          body: Stack(
            children: [
              Wrap(children: [
                CustomContainer(
                  marginTop: 2.5.h,
                  height: 87.5.h,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return HomeBody();
                    },
                  ),
                ),
              ]),
              Positioned(
                top: 2.5.w,
                right: 2.5.w,
                child: InkWell(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 10,
                        )
                      ],
                    ),
                    height: homeController.containerHeight.value,
                    width: homeController.containerWidth.value,
                    child: (!homeController.isExpanded.value)
                        ? Icon(
                            Icons.search,
                            color: Colors.blue,
                          )
                        : CustomContainer(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 70.w,
                                      child: CustomFilterDropdown(
                                        list: homeController.categoryDropdown,
                                        onChange: (value) {
                                          homeController.category.value = value;
                                        },
                                        lableText: "Filter By",
                                      ),
                                    ),
                                    CustomIconButton(
                                      icon: Icons.close,
                                      iconSize: 8.w,
                                      bgColor: Colors.blue[100],
                                      iconColor: Colors.blue,
                                      callback: () {
                                        homeController.onClickExpand();
                                      },
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    (homeController.category.value != "All")
                                        ? loadFilterWidget(
                                            homeController.category.value,
                                            context,
                                          )
                                        : Container(),
                                    CustomIconButton(
                                      icon: Icons.search,
                                      iconSize: 8.w,
                                      bgColor: Colors.blue[100],
                                      iconColor: Colors.blue,
                                      callback: () {
                                        homeController.onClickSearch();
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                  ),
                  onTap: () {
                    if (!homeController.isExpanded.value) {
                      homeController.onClickExpand();
                    }
                  },
                ),
              )
            ],
          ),
        );
      } else {
        return Scaffold(
          appBar: CustomAppBar(
            title: "Activities",
            drawerCallback: () {},
          ),
          body: CustomContainer(
            child: Center(child: CustomLoadingWidget()),
          ),
        );
      }
    });
  }

  loadFilterWidget(String value, BuildContext context) {
    if (value == "Status") {
      return Container(
        width: 70.w,
        child: CustomFilterDropdown(
          list: homeController.statusDropdown,
          onChange: (value) {
            homeController.status.value = value;
          },
          lableText: "Status",
        ),
      );
    } else if (value == "Due Date") {
      return Container(
        width: 70.w,
        child: CustomDatePickField(
            margin: EdgeInsets.all(0),
            contentPadding: EdgeInsets.only(left: 7.5.w, top: 3.h),
            lableText: "Due Date",
            fieldController: homeController.dateController,
            isEditable: true,
            onTap: () async {
              DateTime? _date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(DateTime.now().year + 1),
              );
              if (_date != null) {
                homeController.onDateSelect(_date);
              }
            }),
      );
    }
    //  else {
    //   return Container(
    //     width: 70.w,
    //     child: CustomFilterDropdown(
    //       list: homeController.assigneeDropdown,
    //       onChange: (value) {
    //         homeController.status.value = value;
    //       },
    //       lableText: "Assignee",
    //     ),
    //   );
    // }
  }
}
