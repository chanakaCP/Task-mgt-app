import 'package:get/get.dart';
import 'package:task_mgt_app/getX/controller/homeController.dart';
import 'package:task_mgt_app/getX/services/userService.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<UserService>(UserService());
  }
}
