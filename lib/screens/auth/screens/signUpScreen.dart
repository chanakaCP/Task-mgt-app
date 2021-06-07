import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/container/customContainer.dart';
import 'package:task_mgt_app/customWidgets/formComponent/customFormField.dart';
import 'package:task_mgt_app/customWidgets/text/customText.dart';
import 'package:task_mgt_app/customWidgets/buttons/custombutton.dart';
import 'package:task_mgt_app/getX/controller/authController.dart';
import 'package:task_mgt_app/screens/auth/screens/signInScreen.dart';

class SignUp extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 5.h,
                ),
                child: Form(
                  key: authController.signUpformKey,
                  child: Column(
                    children: [
                      CustomContainer(
                        margin: EdgeInsets.symmetric(vertical: 2.5.h),
                        height: 25.h,
                        child: Image.asset(
                          "assets/logo.jpg",
                          width: 100.w,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                        child: Column(
                          children: [
                            CustomFormField(
                              hintText: "Jhon paul",
                              lableText: "Username",
                              isPass: false,
                              fieldController: authController.nameController,
                              prefixIcon: Icons.keyboard,
                            ),
                            SizedBox(height: 2.5.h),
                            CustomFormField(
                              hintText: "Software Engineer",
                              lableText: "Job Position",
                              isPass: false,
                              fieldController:
                                  authController.positionController,
                              prefixIcon: Icons.laptop,
                            ),
                            SizedBox(height: 2.5.h),
                            CustomFormField(
                              hintText: "example@gmail.com",
                              lableText: "Email",
                              isPass: false,
                              fieldController: authController.emailController,
                              prefixIcon: Icons.email,
                            ),
                            SizedBox(height: 2.5.h),
                            CustomFormField(
                              hintText: "********",
                              lableText: "Password",
                              isPass: true,
                              fieldController: authController.passController,
                              prefixIcon: Icons.lock,
                              maxLines: 1,
                            ),
                            SizedBox(height: 2.5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                        value: 0,
                                        groupValue:
                                            authController.radioValue.value,
                                        onChanged: (value) {
                                          authController
                                              .handleRadioValueChange(0);
                                        }),
                                    CustomText(
                                      text: "Employee",
                                      size: 2.5.h,
                                      color: Colors.grey[600],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        value: 1,
                                        groupValue:
                                            authController.radioValue.value,
                                        onChanged: (value) {
                                          authController
                                              .handleRadioValueChange(1);
                                        }),
                                    CustomText(
                                      text: "Admin",
                                      size: 2.5.h,
                                      color: Colors.grey[600],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            CustomButton(
                              margin: EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 2.5.h,
                              ),
                              title: "Register",
                              textColor: Colors.white,
                              callback: () {
                                authController.registerUser();
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
                                    text: "Already have account ?",
                                    weight: FontWeight.w400,
                                    size: 4.w,
                                  ),
                                  InkWell(
                                    child: CustomText(
                                      text: "  SignIn",
                                      color: Colors.blue,
                                      weight: FontWeight.w400,
                                      size: 4.w,
                                    ),
                                    onTap: () {
                                      Get.to(SignIn());
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
          );
        }));
  }
}
