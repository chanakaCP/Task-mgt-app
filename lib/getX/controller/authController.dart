import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/common/customDialog.dart';
import 'package:task_mgt_app/getX/services/authService.dart';
import 'package:task_mgt_app/models/AuthUser.dart';
import 'package:task_mgt_app/models/RegisterUser.dart';
import 'package:task_mgt_app/screens/auth/screens/signInScreen.dart';

class AuthController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final customDialog = CustomDialog();
  RxInt radioValue = 0.obs;

  final signUpformKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();
  final positionController = TextEditingController();

  final signInFormKey = GlobalKey<FormState>();
  final loginEmailController = TextEditingController();
  final loginPassController = TextEditingController();

  void login() {
    AuthUser user = AuthUser(
        loginEmailController.text.trim(), loginPassController.text.trim());
    if (signInFormKey.currentState!.validate()) {
      customDialog.showLoadingDialog("Please Wait");
      _authService.login(user).then(
        (value) {
          if (value == "Login Success") {
            Get.back();
            Get.offAllNamed("/home");
          } else {
            Get.back();
            CustomDialog().failed(msg: value);
          }
        },
      );
    }
  }

  void registerUser() {
    if (signUpformKey.currentState!.validate()) {
      customDialog.showLoadingDialog("Please Wait");
      RegisterUser user = RegisterUser.withData(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        position: positionController.text.trim(),
        password: passController.text.trim(),
        isApproved: false,
        isAdmin: radioValue.value == 0 ? false : true,
        profileURL: "default",
        taskAssigned: 0,
        taskCompleted: 0,
        createAt: DateTime.now(),
      );
      _authService.register(user).then(
        (value) {
          if (value == "Register Success") {
            Get.offAll(SignIn());
            CustomDialog().success(
                msg: "Successfully Registered. \nPlease vait for approval");
            user = RegisterUser();
            clearFields();
          } else {
            Get.back();
            CustomDialog().failed(msg: value);
          }
        },
      );
    }
  }

  void clearFields() {
    emailController.text = "";
    passController.text = "";
    nameController.text = "";
    positionController.text = "";
  }

  void handleRadioValueChange(int val) {
    radioValue.value = val;
  }
}
