import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/config/constants/dropdownConst.dart';
import 'package:task_mgt_app/models/ActivityModel.dart';
import 'package:task_mgt_app/screens/manageActivity/screens/assignActivity.dart';

class ActivityManageController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime pickedDate = DateTime.now();
  RxString dateTime = "none".obs;
  Rx<String> priority = "".obs;
  Rx<Color> datePickColor = Colors.blueGrey.obs;
  List<DropdownMenuItem<String>> dropdownList = DropdownConst().priority;

  onClickNext(bool isEdit) {
    if (formKey.currentState!.validate()) {
      if (dateTime.value == "none") {
        datePickColor.value = Colors.red;
        dateTime.value = "Please pick a Deadline";
      } else {
        ActivityModel activity = ActivityModel.withData(
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
          priority: priority.value != "" ? priority.value : "Low",
          status: "To Do",
          endAt: pickedDate,
        );
        Get.to(AssignActivity(
          isEdit: isEdit,
          activity: activity,
        ));
      }
    }
  }

  @override
  void onInit() {
    titleController.text = "";
    descriptionController.text = "";
    dateTime.value = "Pick a deadline";
    datePickColor = Colors.blueGrey.obs;
    super.onInit();
  }

  onDateSelect(DateTime date) {
    dateTime.value =
        " Deadline Date : ${(date.toUtc()).day} / ${(date.toUtc()).month} / ${(date.toUtc()).year} ";
    pickedDate = date;
    datePickColor.value = Colors.blueGrey;
  }
}
