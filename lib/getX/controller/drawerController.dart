import 'package:get/get.dart';
import 'package:task_mgt_app/config/storage/storage.dart';
import 'package:task_mgt_app/getX/services/authService.dart';

class CustomDrawerController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  RxInt currentIndex = 1.obs;

  changeView(int index) {
    currentIndex.value = index;
  }

  signOut() {
    _authService.signOut();
    Storage().deleteValue("id");
    Get.offAllNamed("/signIn");
  }
}
