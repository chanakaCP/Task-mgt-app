import 'package:get/get.dart';
import 'package:task_mgt_app/models/RegisterUser.dart';
import 'package:task_mgt_app/screens/employeView/screens/employeView.dart';
import 'package:task_mgt_app/services/firebaseStoreService.dart';

class UserListController extends GetxController {
  RxBool isLoading = true.obs;
  RxInt currentIntex = 1.obs;
  RxList<RegisterUser> userlist = RxList<RegisterUser>();
  RxString userEmptyText = "No Users found...".obs;

  @override
  void onInit() {
    onInitAssignActivity();
    super.onInit();
  }

  onInitAssignActivity() {
    userlist.bindStream(FirebaseSotreServices().getUserList());
    stopLoading();
  }

  onTabPressed(int index) {
    currentIntex.value = index;
    switch (index) {
      case 1:
        userEmptyText.value = "No Users found...";
        break;
      case 2:
        userEmptyText.value = "No Approved Users...";
        break;
      case 3:
        userEmptyText.value = "No Approved Users...";
        break;
      default:
    }
  }

  startLoading() {
    isLoading.value = true;
  }

  stopLoading() {
    isLoading.value = false;
  }

  onClickUser(RegisterUser employe) {
    Get.to(EmployeView(employe: employe));
  }
}
