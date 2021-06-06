import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/appbar/customAppBar.dart';
import 'package:task_mgt_app/customWidgets/buttons/customIconButton.dart';
import 'package:task_mgt_app/customWidgets/buttons/custombutton.dart';
import 'package:task_mgt_app/customWidgets/customContainer.dart';
import 'package:task_mgt_app/customWidgets/customDropdown.dart';
import 'package:task_mgt_app/customWidgets/customFormField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mgt_app/customWidgets/customText.dart';
import 'package:task_mgt_app/getX/controller/activityManageController.dart';

class ManageActivity extends StatelessWidget {
  final bool isEdit;

  ManageActivity({required this.isEdit});

  final ActivityManageController activityMgtController =
      Get.put(ActivityManageController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: isEdit ? "Update Activity" : "Add new Activity",
          isBack: true,
          drawerCallback: () {},
        ),
        body: SingleChildScrollView(
          child: CustomContainer(
            padding: EdgeInsets.only(
              top: 5.h,
            ),
            child: Form(
              key: activityMgtController.formKey,
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  CustomFormField(
                    hintText: "Activity Title",
                    lableText: "Activity Title",
                    isPass: false,
                    fieldController: activityMgtController.titleController,
                    prefixIcon: Icons.keyboard,
                  ),
                  SizedBox(height: 5.h),
                  CustomFormField(
                    hintText: "Activity Description",
                    lableText: "Activity Description",
                    isPass: false,
                    fieldController:
                        activityMgtController.descriptionController,
                    prefixIcon: Icons.keyboard,
                  ),
                  SizedBox(height: 5.h),
                  CustomContainer(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          return CustomText(
                            text:
                                (activityMgtController.dateTime.value == "none")
                                    ? "Pick a deadline"
                                    : activityMgtController.dateTime.value,
                            color: activityMgtController.datePickColor.value,
                            weight: FontWeight.w700,
                            size: 4.5.sp,
                          );
                        }),
                        CustomIconButton(
                          icon: Icons.date_range_outlined,
                          width: 10.w,
                          height: 10.w,
                          iconSize: 5.w,
                          callback: () async {
                            DateTime? _date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(DateTime.now().day - 1),
                              lastDate: DateTime(DateTime.now().year + 1),
                            );
                            if (_date != null) {
                              activityMgtController.onDateSelect(_date);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                  CustomContainer(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          alignment: Alignment.centerLeft,
                          paddingRight: 5.w,
                          child: CustomText(
                            text: "Select Priority",
                            color: Colors.blueGrey,
                            weight: FontWeight.w700,
                            size: 4.5.sp,
                          ),
                        ),
                        Container(
                          width: 52.5.w,
                          child: CustomDropDown(
                            list: activityMgtController.dropdownList,
                            initialValue:
                                activityMgtController.dropdownList.first.value,
                            onChange: (value) {
                              activityMgtController.priority.value = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                  CustomButton(
                    margin: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 2.5.h,
                    ),
                    title: "Next",
                    icon: Icons.arrow_forward,
                    fontsize: 5.w,
                    textColor: Colors.white,
                    callback: () {
                      activityMgtController.onClickNext(isEdit);
                    },
                  ),
                  SizedBox(height: 2.5.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
