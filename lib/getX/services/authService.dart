import 'package:get/get.dart';
import 'package:task_mgt_app/getX/services/userService.dart';
import 'package:task_mgt_app/models/AuthUser.dart';
import 'package:task_mgt_app/models/RegisterUser.dart';
import 'package:task_mgt_app/services/firebaseAuthService.dart';

class AuthService extends GetxService {
  RxString password = ''.obs;

  final FirebaseAuthServices _service = FirebaseAuthServices();
  Future login(AuthUser user) async {
    final response = await _service.signInWithEmailPassword(user);
    if (response == "Login Success") {
      Get.put<UserService>(UserService());
    }
    return response;
  }

  Future register(RegisterUser user) async {
    final response = await _service.signUpWithEmailPassword(user);
    return response;
  }

  signOut() async {
    await _service.signOut();
  }
}
