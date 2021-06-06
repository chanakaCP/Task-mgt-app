import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/customFormField.dart';
import 'package:task_mgt_app/customWidgets/customText.dart';
import 'package:task_mgt_app/customWidgets/buttons/custombutton.dart';
import 'package:task_mgt_app/getX/controller/authController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mgt_app/screens/auth/screens/signUpScreen.dart';

class SignIn extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 5.h,
            ),
            child: Form(
              key: authController.signInFormKey,
              child: Column(
                children: [
                  Container(
                    height: 35.h,
                    child: Image.asset(
                      "assets/logo.jpg",
                      width: 80.w,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.5.w,
                    ),
                    child: Column(
                      children: [
                        CustomFormField(
                          fillColor: Colors.black12,
                          hintText: "example@gmail.com",
                          lableText: "Email",
                          isPass: false,
                          fieldController: authController.loginEmailController,
                          prefixIcon: Icons.email,
                        ),
                        SizedBox(height: 2.5.h),
                        CustomFormField(
                          fillColor: Colors.black12,
                          hintText: "********",
                          lableText: "Password",
                          isPass: true,
                          fieldController: authController.loginPassController,
                          prefixIcon: Icons.lock,
                        ),
                        SizedBox(height: 2.5.h),
                        CustomButton(
                          margin: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 2.5.h,
                          ),
                          title: "Sign In",
                          textColor: Colors.white,
                          callback: () {
                            authController.login();
                          },
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Divider(
                            thickness: 0.3.h,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Don't have an account ?",
                                weight: FontWeight.w400,
                                size: 4.w,
                              ),
                              InkWell(
                                child: CustomText(
                                  text: "  Register",
                                  color: Colors.blue,
                                  weight: FontWeight.w400,
                                  size: 4.w,
                                ),
                                onTap: () {
                                  Get.to(SignUp());
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
