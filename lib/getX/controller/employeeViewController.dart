import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/common/customDialog.dart';
import 'package:task_mgt_app/getX/services/databaseService.dart';
import 'package:task_mgt_app/models/RegisterUser.dart';

class EmployeeViewController extends GetxController {
  final DatabaseService dbService = Get.put(DatabaseService());
  RegisterUser updateUserModel = RegisterUser();

  final nameController = TextEditingController();
  final positionController = TextEditingController();
  final emailController = TextEditingController();
  final dateController = TextEditingController();
  final RxBool isAdmin = false.obs;
  final RxBool isAproved = false.obs;

  String initialName = "";
  String initialPosition = "";
  bool initialPermission = false;
  bool initialApproval = false;

  initState(RegisterUser employe) {
    updateUserModel = employe;
    isAdmin.value = employe.isAdmin!;
    isAproved.value = employe.isApproved!;
    nameController.text = employe.name!;
    positionController.text = employe.position!;
    dateController.text =
        "${employe.createAt!.day} - ${employe.createAt!.month} - ${employe.createAt!.year}";
    emailController.text = employe.email!;

    initialName = employe.name!;
    initialPosition = employe.position!;
    initialPermission = employe.isAdmin!;
    initialApproval = employe.isApproved!;
  }

  changeApprovl(bool approval) {
    if (approval == false) {
      isAdmin.value = false;
    }
    isAproved.value = approval;
  }

  changePermission(bool permission) {
    if (isAproved.value == true) {
      isAdmin.value = permission;
    }
  }

  updateUser() {
    if (isChanged()) {
      CustomDialog().showLoadingDialog("Please Wait...");
      updateUserModel.isAdmin = isAdmin.value;
      updateUserModel.isApproved = isAproved.value;
      updateUserModel.name = nameController.text.trim();
      updateUserModel.position = positionController.text.trim();
      dbService.updateUser(updateUserModel).then((value) {
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
    } else {
      CustomDialog().notify(msg: "No changes to update...");
    }
  }

  deleteUser() {
    CustomDialog().showLoadingDialog("Please Wait...");
    dbService.deleteUser(updateUserModel.userId.toString()).then((value) {
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

  bool isChanged() {
    if ((initialApproval == isAproved.value) &&
        (initialPermission == isAdmin.value) &&
        (initialName == nameController.text.trim()) &&
        (initialPosition == positionController.text.trim())) {
      return false;
    } else {
      return true;
    }
  }
}
