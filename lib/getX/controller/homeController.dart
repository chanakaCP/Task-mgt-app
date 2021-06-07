import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/config/constants/dropdownConst.dart';
import 'package:task_mgt_app/customWidgets/common/customDialog.dart';
import 'package:task_mgt_app/getX/services/userService.dart';
import 'package:task_mgt_app/models/ActivityModel.dart';
import 'package:task_mgt_app/models/RegisterUser.dart';
import 'package:task_mgt_app/screens/manageActivity/screens/manageActivity.dart';
import 'package:task_mgt_app/services/firebaseStoreService.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeController extends GetxController {
  final UserService userService = Get.put(UserService());

  RxBool isLoading = true.obs;
  Rx<RegisterUser>? user;
  RxList<ActivityModel> activityList = RxList<ActivityModel>();
  RxList<ActivityModel> showingList = RxList<ActivityModel>();
  RxString activityEmptyText = "No Activity found...".obs;

  List<DropdownMenuItem<String>> categoryDropdown = DropdownConst().category;
  List<DropdownMenuItem<String>> statusDropdown = DropdownConst().status;

  // RxList<RegisterUser> assigneeList = RxList<RegisterUser>();
  // List<DropdownMenuItem<String>> assigneeDropdown = [];
  // Rx<String> assignee = "".obs;

  Rx<String> category = "".obs;
  Rx<String> status = "To Do".obs;
  var dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
// for  animated container
  RxBool isExpanded = false.obs;
  RxDouble containerHeight = 10.0.w.obs;
  RxDouble containerWidth = 10.0.w.obs;

  onClickExpand() {
    if (isExpanded.value) {
      collaps();
    } else {
      expand();
    }
  }

  expand() {
    containerHeight.value = 35.w;
    containerWidth.value = 95.0.w;
    Timer(Duration(milliseconds: 160), () {
      isExpanded.value = true;
    });
  }

  collaps() {
    isExpanded.value = false;
    containerHeight.value = 10.0.w;
    containerWidth.value = 10.0.w;
  }

  onInit() {
    super.onInit();
    bindActivityList();
    user = userService.userData;
    category.value = categoryDropdown.first.value!;
    status.value = statusDropdown.first.value!;
    onClickSearch();
    // assigneeDropdown.add(DropdownMenuItem(
    //   child: Text("Select Employee"),
    //   value: "0",
    // ));
    // bindAssigneeList();
  }

  onDateSelect(DateTime date) {
    dateController.text =
        "${(date.toUtc()).day + 1} / ${(date.toUtc()).month} / ${(date.toUtc()).year} ";
    selectedDate = date;
  }

  bindActivityList() {
    activityList.bindStream(FirebaseSotreServices().getActivityList());
    showingList =
        List.generate(activityList.length, (index) => activityList[index]).obs;
    stopLoading();
  }

  // bindAssigneeList() {
  // assigneeList.bindStream(FirebaseSotreServices().getUserList());

  // assigneeList.forEach((element) {
  //   print(element.toMap());
  //   assigneeDropdown.add(DropdownMenuItem(
  //     child: Text(element.name!),
  //     value: element.userId,
  //   ));
  // });
  // }

  onTapEdit(ActivityModel activityModel) {
    Get.to(ManageActivity(isEdit: true, activity: activityModel));
  }

  onClickSearch() {
    if (category.value == "All") {
      collaps();
      showingList.clear();
      showingList =
          List.generate(activityList.length, (index) => activityList[index])
              .obs;
    } else if (category.value == "Status") {
      collaps();
      showingList.clear();
      activityList.forEach((element) {
        if (element.status == status.value) {
          showingList.add(element);
        }
      });
    } else if (category.value == "Due Date") {
      if (dateController.text == "") {
        CustomDialog()
            .warning(msg: "Please select due date to filter activities");
      } else {
        collaps();
        showingList.clear();
        activityList.forEach((element) {
          if (element.endAt!.toLocal() == selectedDate.toLocal()) {
            showingList.add(element);
          }
        });
      }
    }
    // else if (category.value == "Assignee") {}
  }

  startLoading() {
    isLoading.value = true;
  }

  stopLoading() {
    isLoading.value = false;
  }
}
