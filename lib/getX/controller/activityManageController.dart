import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/config/constants/dropdownConst.dart';
import 'package:task_mgt_app/customWidgets/common/customDialog.dart';
import 'package:task_mgt_app/getX/services/databaseService.dart';
import 'package:task_mgt_app/getX/services/userService.dart';
import 'package:task_mgt_app/models/ActivityModel.dart';
import 'package:task_mgt_app/screens/manageActivity/screens/assignActivity.dart';

class ActivityManageController extends GetxController {
  final UserService userService = Get.find<UserService>();
  final DatabaseService dbService = Get.put(DatabaseService());

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  Rx<String> priority = "Low".obs;
  DateTime pickedDate = DateTime.now();

  List<DropdownMenuItem<String>> dropdownList = DropdownConst().priority;
  RxString dateTime = "none".obs;
  Rx<Color> datePickColor = Colors.blueGrey.obs;

  onClickNext(ActivityModel activity) {
    if (formKey.currentState!.validate()) {
      if (dateTime.value == "none") {
        datePickColor.value = Colors.red;
        dateTime.value = "Please pick a Deadline";
      } else {
        activity.title = titleController.text.trim();
        activity.description = descriptionController.text.trim();
        activity.endAt = pickedDate;
        activity.priority = priority.value;
        if (activity.id == null) {
          activity.status = "To Do";
          activity.createAt = DateTime.now();
          activity.createBy = userService.userData.value.userId;
        }
        Get.to(AssignActivity(
          activity: activity,
        ));
      }
    }
  }

  initState(ActivityModel activity) {
    if (activity.id != null) {
      titleController.text = activity.title!;
      descriptionController.text = activity.description!;
      priority.value = activity.priority!;
      pickedDate = activity.endAt!;
      dateTime.value =
          " Deadline Date : ${(activity.endAt!.toUtc()).day} / ${(activity.endAt!.toUtc()).month} / ${(activity.endAt!.toUtc()).year} ";
    } else {
      titleController.text = "";
      descriptionController.text = "";
      dateTime.value = "Pick a deadline";

      priority.value = "Low";
    }
    datePickColor = Colors.blueGrey.obs;
  }

  onDateSelect(DateTime date) {
    dateTime.value =
        " Deadline Date : ${(date.toUtc()).day} / ${(date.toUtc()).month} / ${(date.toUtc()).year} ";
    pickedDate = date;
    datePickColor.value = Colors.blueGrey;
  }

  deleteUser(String activityId) {
    CustomDialog().showLoadingDialog("Please Wait...");
    dbService.deleteActivity(activityId).then((value) {
      if (value.isSuccess) {
        Get.back();
        CustomDialog().success(msg: value.message);
        Timer(Duration(milliseconds: 1250), () {
          Get.back();
          Get.back();
        });
      } else {
        Get.back();
        CustomDialog().failed(msg: value.message);
      }
    });
  }

  bool isEditable() {
    return (userService.userData.value.isAdmin!) ? true : false;
  }
}
