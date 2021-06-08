import 'dart:async';

import 'package:get/get.dart';
import 'package:task_mgt_app/config/storage/storage.dart';
import 'package:task_mgt_app/customWidgets/common/customDialog.dart';
import 'package:task_mgt_app/getX/services/authService.dart';

class CustomDrawerController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  RxInt currentIndex = 1.obs;

  changeView(int index) {
    currentIndex.value = index;
  }

  signOut() {
    CustomDialog().showLoadingDialog("Please Wait");
    _authService.signOut();
    Storage().deleteValue("id");
    Get.back();
    Timer(Duration(milliseconds: 3500), () {
      Get.offAllNamed("/");
    });
    CustomDialog().notify(msg: "Signing off...");
  }
}
