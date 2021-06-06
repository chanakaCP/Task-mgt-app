import 'dart:async';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/common/customDialog.dart';
import 'package:task_mgt_app/customWidgets/common/customSnackBar.dart';
import 'package:task_mgt_app/getX/services/databaseService.dart';
import 'package:task_mgt_app/models/ActivityModel.dart';
import 'package:task_mgt_app/models/RegisterUser.dart';
import 'package:task_mgt_app/services/firebaseStoreService.dart';

class AssignActivityController extends GetxController {
  RxBool isLoading = true.obs;
  RegisterUser assignedUser = RegisterUser();
  RxString selectedUserId = " ".obs;
  final DatabaseService dbService = Get.put(DatabaseService());

  RxList<RegisterUser> userlist = RxList<RegisterUser>();

  @override
  void onInit() {
    onInitAssignActivity();
    super.onInit();
  }

  onInitAssignActivity() {
    userlist.bindStream(FirebaseSotreServices().getUserList());
    Timer(Duration(milliseconds: 1500), () {
      stopLoading();
    });
  }

  addActivity(ActivityModel activity) {
    if (assignedUser.userId != null) {
      CustomDialog().showLoadingDialog("Please Wait...");
      activity.assignedTo = assignedUser.userId;

      dbService.addActivity(activity).then((value) {
        if (value.isSuccess!) {
          Get.back();
          CustomSnackBar().success(msg: "Successfully asigned");
          Timer(Duration(milliseconds: 1250), () {
            Get.offAllNamed("/home");
          });
        } else {
          Get.back();
          CustomSnackBar().failed(msg: "Failed to Insert");
        }
      });
    } else {}
  }

  onSelectUser(RegisterUser user) {
    assignedUser = user;
    selectedUserId.value = user.userId!;
  }

  startLoading() {
    isLoading.value = true;
  }

  stopLoading() {
    isLoading.value = false;
  }
}
