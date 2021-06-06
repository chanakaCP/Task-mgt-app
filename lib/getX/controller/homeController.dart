import 'package:get/get.dart';
import 'package:task_mgt_app/getX/services/userService.dart';
import 'package:task_mgt_app/models/RegisterUser.dart';

class HomeController extends GetxController {
  final UserService userService = Get.put(UserService());
  Rx<RegisterUser>? user;
  RxInt currentIntex = 1.obs;

  onInit() {
    super.onInit();
    user = userService.userData;
  }

  onTabPressed(int index) {
    currentIntex.value = index;
  }
}
