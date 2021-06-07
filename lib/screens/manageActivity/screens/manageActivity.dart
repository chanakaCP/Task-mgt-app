import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/appbar/customAppBar.dart';
import 'package:task_mgt_app/customWidgets/buttons/customIconButton.dart';
import 'package:task_mgt_app/customWidgets/buttons/custombutton.dart';
import 'package:task_mgt_app/customWidgets/customContainer.dart';
import 'package:task_mgt_app/customWidgets/customDropdown.dart';
import 'package:task_mgt_app/customWidgets/formComponent/customFormField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mgt_app/customWidgets/customText.dart';
import 'package:task_mgt_app/getX/controller/activityManageController.dart';
import 'package:task_mgt_app/models/ActivityModel.dart';

class ManageActivity extends StatelessWidget {
  final bool isEdit;
  final ActivityModel activity;
  ManageActivity({required this.isEdit, required this.activity});

  final activityMgtController = Get.put(ActivityManageController());

  @override
  Widget build(BuildContext context) {
    print(isEdit);
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
              child: GetX<ActivityManageController>(
                initState: (_) {
                  activityMgtController.initState(activity);
                },
                builder: (_) {
                  return Column(
                    children: [
                      SizedBox(height: 5.h),
                      CustomFormField(
                        hintText: "Activity Title",
                        lableText: "Activity Title",
                        isPass: false,
                        fieldController: activityMgtController.titleController,
                        prefixIcon: Icons.keyboard,
                        isEditable: activityMgtController.isEditable(),
                      ),
                      SizedBox(height: 5.h),
                      CustomFormField(
                        hintText: "Activity Description",
                        lableText: "Activity Description",
                        isPass: false,
                        fieldController:
                            activityMgtController.descriptionController,
                        prefixIcon: Icons.keyboard,
                        maxLines: null,
                        isEditable: activityMgtController.isEditable(),
                      ),
                      SizedBox(height: 5.h),
                      CustomContainer(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: (activityMgtController.dateTime.value ==
                                      "none")
                                  ? "Pick a deadline"
                                  : activityMgtController.dateTime.value,
                              color: activityMgtController.datePickColor.value,
                              weight: FontWeight.w700,
                              size: 4.5.sp,
                            ),
                            CustomIconButton(
                              icon: Icons.date_range_outlined,
                              width: 10.w,
                              height: 10.w,
                              iconSize: 5.w,
                              callback: () async {
                                if (activityMgtController.isEditable()) {
                                  DateTime? _date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(DateTime.now().year + 1),
                                  );
                                  if (_date != null) {
                                    activityMgtController.onDateSelect(_date);
                                  }
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
                                initialValue: activityMgtController
                                    .dropdownList.first.value,
                                onChange: (value) {
                                  activityMgtController.priority.value = value;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      (activityMgtController.isEditable())
                          ? CustomContainer(
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  (isEdit)
                                      ? CustomButton(
                                          width: 42.5.w,
                                          title: "Delete",
                                          textColor: Colors.red,
                                          buttonColor: Colors.white,
                                          borderColor: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderWidth: 1,
                                          callback: () {
                                            activityMgtController
                                                .deleteUser(activity.id!);
                                          },
                                        )
                                      : Container(),
                                  CustomButton(
                                    width: (isEdit) ? 42.5.w : 92.w,
                                    title: "Next",
                                    icon: Icons.arrow_forward,
                                    fontsize: 5.w,
                                    textColor: Colors.white,
                                    callback: () {
                                      activityMgtController
                                          .onClickNext(activity);
                                    },
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      SizedBox(height: 2.5.h),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
