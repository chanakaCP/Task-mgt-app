import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/customContainer.dart';
import 'package:task_mgt_app/customWidgets/customLoadingWidget.dart';
import 'package:task_mgt_app/customWidgets/customText.dart';
import 'package:task_mgt_app/customWidgets/listTiles/customTaskListItem.dart';
import 'package:task_mgt_app/getX/controller/homeController.dart';

class HomeBody extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Obx(() {
        if (homeController.isLoading.value == true) {
          return CustomContainer(
            marginTop: 35.h,
            child: CustomLoadingWidget(),
          );
        } else {
          if (homeController.activityList.length == 0) {
            return Center(
              child: CustomContainer(
                marginTop: 35.h,
                child: CustomText(text: homeController.activityEmptyText.value),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: CustomContainer(
                child: Column(
                  children: [
                    //  ALL ACTIVITY
                    if (homeController.currentIntex.value == 1)
                      for (var i = 0;
                          i < homeController.activityList.length;
                          i++)
                        CustomTaskListItem(
                          activity: homeController.activityList[i],
                          onTapCard: () {
                            homeController
                                .onTapEdit(homeController.activityList[i]);
                          },
                          onTapIcon: () {},
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
