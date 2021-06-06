import 'package:get/get.dart';
import 'package:task_mgt_app/models/RegisterUser.dart';
import 'package:task_mgt_app/services/firebaseStoreService.dart';

class UserService extends GetxService {
  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  Rx<RegisterUser> userData = RegisterUser().obs;
  RegisterUser get user => userData.value;

  void getUserData() async {
    try {
      userData.bindStream(await FirebaseSotreServices().getUserData());
    } catch (e) {
      print(e.toString());
    }
  }
}
