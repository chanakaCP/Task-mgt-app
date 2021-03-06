import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:task_mgt_app/models/ActivityModel.dart';
import 'package:task_mgt_app/models/RegisterUser.dart';
import 'package:task_mgt_app/models/ResponceModel.dart';
import 'package:task_mgt_app/services/firebaseStoreService.dart';

class DatabaseService extends GetxService {
  final FirebaseSotreServices _service = FirebaseSotreServices();

  Future<ResponceModel> addActivity(ActivityModel activity) async {
    ResponceModel responce;
    final result = await _service.setActivity(activity);
    if (result == true) {
      responce = ResponceModel(message: "Activity Updated", isSuccess: true);
    } else {
      responce = ResponceModel(message: "Action failed", isSuccess: false);
    }
    return responce;
  }

  Future<ResponceModel> updateUser(RegisterUser user) async {
    ResponceModel responce;
    final result = await _service.updateUser(user);
    if (result == true) {
      responce =
          ResponceModel(message: "Successfully Updated", isSuccess: true);
    } else {
      responce = ResponceModel(message: "Failed to update", isSuccess: false);
    }
    return responce;
  }

  Future<ResponceModel> deleteUser(String userId) async {
    ResponceModel responce;
    final result = await _service.removeUser(userId);
    if (result == true) {
      responce =
          ResponceModel(message: "User has been Removed", isSuccess: true);
    } else {
      responce = ResponceModel(message: "Action failed", isSuccess: false);
    }
    return responce;
  }

  Future<ResponceModel> getActivityList() async {
    ResponceModel responce;
    final result = await _service.getActivityList();
    if (result == true) {
      responce =
          ResponceModel(message: "User has been Removed", isSuccess: true);
    } else {
      responce = ResponceModel(message: "Action failed", isSuccess: false);
    }
    return responce;
  }

  Future<ResponceModel> deleteActivity(ActivityModel activity) async {
    ResponceModel responce;
    final result = await _service.deleteActivity(activity);
    if (result == true) {
      responce =
          ResponceModel(message: "Activity has been Removed", isSuccess: true);
    } else {
      responce = ResponceModel(message: "Action failed", isSuccess: false);
    }
    return responce;
  }

  Future<ResponceModel> updateStatus(String activityId, String status) async {
    ResponceModel responce;
    final result = await _service.updateState(activityId, status);
    if (result == true) {
      responce =
          ResponceModel(message: "Successfully Updated", isSuccess: true);
    } else {
      responce = ResponceModel(message: "Failed to update", isSuccess: false);
    }
    return responce;
  }
}
