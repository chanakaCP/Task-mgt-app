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
  final dateController = TextEditingController();
  Rx<String> priority = "Low".obs;
  Rx<String> status = "To Do".obs;
  DateTime pickedDate = DateTime.now();

  List<DropdownMenuItem<String>> priorityDropdownList =
      DropdownConst().priority;
  List<DropdownMenuItem<String>> statusDropdownList = DropdownConst().status;
  Rx<Color> datePickColor = Colors.blueGrey.obs;

  onClickNext(ActivityModel activity) {
    if (formKey.currentState!.validate()) {
      print(dateController.text);
      if (dateController.text.isEmpty) {
        datePickColor.value = Colors.red;
        dateController.text = "Please pick a Deadline";
      } else {
        activity.title = titleController.text.trim();
        activity.description = descriptionController.text.trim();
        activity.endAt = pickedDate;
        activity.priority = priority.value;
        activity.status = status.value;
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
      status.value = activity.status!;
      pickedDate = activity.endAt!;
      dateController.text =
          "${(activity.endAt!.toUtc()).day + 1} / ${(activity.endAt!.toUtc()).month} / ${(activity.endAt!.toUtc()).year} ";
    } else {
      titleController.text = "";
      descriptionController.text = "";
      dateController.text = "";
    }
    datePickColor = Colors.blueGrey.obs;
  }

  onDateSelect(DateTime date) {
    dateController.text =
        "${(date.toUtc()).day + 1} / ${(date.toUtc()).month} / ${(date.toUtc()).year} ";
    pickedDate = date;
    datePickColor.value = Colors.blueGrey;
  }

  deleteUser(ActivityModel activity) {
    CustomDialog().showLoadingDialog("Please Wait...");
    dbService.deleteActivity(activity).then((value) {
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

  onClickUpdateState(String activityId) {
    CustomDialog().showLoadingDialog("Please Wait...");
    dbService.updateStatus(activityId, status.value).then((value) {
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
