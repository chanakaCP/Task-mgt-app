import 'dart:async';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/common/customDialog.dart';
import 'package:task_mgt_app/getX/services/databaseService.dart';
import 'package:task_mgt_app/models/ActivityModel.dart';
import 'package:task_mgt_app/models/RegisterUser.dart';
import 'package:task_mgt_app/services/firebaseStoreService.dart';

class AssignActivityController extends GetxController {
  RxBool isLoading = true.obs;
  RxString selectedUserId = " ".obs;
  final DatabaseService dbService = Get.put(DatabaseService());

  RxList<RegisterUser> userlist = RxList<RegisterUser>();

  initialize(ActivityModel activity) {
    if (activity.assignedTo != null) {
      selectedUserId.value = activity.assignedTo.toString();
    }
    onInitAssignActivity();
  }

  onInitAssignActivity() {
    userlist.bindStream(FirebaseSotreServices().getUserList());
    Timer(Duration(milliseconds: 1500), () {
      stopLoading();
    });
  }

  addActivity(ActivityModel activity) {
    if (activity.assignedTo != null) {
      CustomDialog().showLoadingDialog("Please Wait...");
      dbService.addActivity(activity).then((value) {
        if (value.isSuccess) {
          Get.back();
          CustomDialog().success(msg: value.message.toString());
          Timer(Duration(milliseconds: 1250), () {
            Get.offAllNamed("/home");
          });
        } else {
          Get.back();
          CustomDialog().failed(msg: value.message.toString());
        }
      });
    }
  }

  onSelectUser(RegisterUser user, ActivityModel activityModel) {
    activityModel.assignedName = user.name;
    activityModel.assignedProfileURL = user.profileURL;
    activityModel.assignedTo = user.userId;
    selectedUserId.value = user.userId!;
  }

  startLoading() {
    isLoading.value = true;
  }

  stopLoading() {
    isLoading.value = false;
  }
}
