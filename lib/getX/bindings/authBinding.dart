import 'package:get/get.dart';
import 'package:task_mgt_app/getX/services/authService.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthService>(AuthService());
  }
}
