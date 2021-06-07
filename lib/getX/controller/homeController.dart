import 'package:get/get.dart';
import 'package:task_mgt_app/getX/services/userService.dart';
import 'package:task_mgt_app/models/ActivityModel.dart';
import 'package:task_mgt_app/models/RegisterUser.dart';
import 'package:task_mgt_app/screens/manageActivity/screens/manageActivity.dart';
import 'package:task_mgt_app/services/firebaseStoreService.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  final UserService userService = Get.put(UserService());
  Rx<RegisterUser>? user;
  RxInt currentIntex = 1.obs;
  RxList<ActivityModel> activityList = RxList<ActivityModel>();
  RxString activityEmptyText = "No Activity found...".obs;

  onInit() {
    super.onInit();
    bindActivityList();
    user = userService.userData;
  }

  onTabPressed(int index) {
    currentIntex.value = index;
  }

  bindActivityList() {
    activityList.bindStream(FirebaseSotreServices().getActivityList());
    stopLoading();
  }

  onTapEdit(ActivityModel activityModel) {
    Get.to(ManageActivity(isEdit: true, activity: activityModel));
  }

  startLoading() {
    isLoading.value = true;
  }

  stopLoading() {
    isLoading.value = false;
  }
}
