import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/customWidgets/appbar/customAppBar.dart';
import 'package:task_mgt_app/customWidgets/buttons/custombutton.dart';
import 'package:task_mgt_app/customWidgets/container/customCardWidget.dart';
import 'package:task_mgt_app/customWidgets/container/customContainer.dart';
import 'package:task_mgt_app/customWidgets/formComponent/customDatePickField.dart';
import 'package:task_mgt_app/customWidgets/formComponent/customDropdownFormField.dart';
import 'package:task_mgt_app/customWidgets/formComponent/customFormField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mgt_app/getX/controller/activityManageController.dart';
import 'package:task_mgt_app/getX/services/userService.dart';
import 'package:task_mgt_app/models/ActivityModel.dart';
import 'package:task_mgt_app/screens/manageActivity/widgets/customActivityDetail.dart';

class ManageActivity extends StatelessWidget {
  final bool isEdit;
  final ActivityModel activity;
  ManageActivity({required this.isEdit, required this.activity});
  final UserService userService = Get.find<UserService>();

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
            child: Form(
              key: activityMgtController.formKey,
              child: GetX<ActivityManageController>(
                initState: (_) {
                  activityMgtController.initState(activity);
                },
                builder: (_) {
                  return Column(
                    children: [
                      CustomActivityDetail(
                        header: "Created by",
                        profileURL:
                            userService.userData.value.profileURL.toString(),
                        position:
                            userService.userData.value.position.toString(),
                        user: userService.userData.value.name.toString(),
                        dateText: (isEdit)
                            ? "Assigned : ${(activity.createAt!.toUtc()).day} / ${(activity.createAt!.toUtc()).month} / ${(activity.createAt!.toUtc()).year} "
                            : "Assigned : ${(DateTime.now().toUtc()).day} / ${(DateTime.now().toUtc()).month} / ${(DateTime.now().toUtc()).year} ",
                      ),
                      (isEdit)
                          ? CustomActivityDetail(
                              header: "Assign to",
                              profileURL:
                                  activity.assignedProfileURL.toString(),
                              position: activity.assignedTo.toString(),
                              user: activity.assignedName.toString(),
                              dateText:
                                  "Due on : ${(activity.endAt!.toUtc()).day} / ${(activity.endAt!.toUtc()).month} / ${(activity.endAt!.toUtc()).year} ",
                            )
                          : Container(),
                      CustomCardWidget(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.w, vertical: 2.h),
                        childWidget: Column(
                          children: [
                            SizedBox(height: 0.5.h),
                            CustomDropdownField(
                              lableText: "Status",
                              prefixIcon:
                                  Icons.settings_backup_restore_outlined,
                              list: activityMgtController.statusDropdownList,
                              initialValue: (isEdit) ? activity.status : null,
                              isEditable: activityMgtController.isEditable(),
                              onChange: (value) {
                                activityMgtController.status.value = value;
                              },
                            ),
                            SizedBox(height: 2.5.h),
                            CustomFormField(
                              hintText: "Activity Title",
                              lableText: "Activity Title",
                              isPass: false,
                              fieldController:
                                  activityMgtController.titleController,
                              prefixIcon: Icons.keyboard,
                              isEditable: activityMgtController.isEditable(),
                            ),
                            SizedBox(height: 2.5.h),
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
                            SizedBox(height: 2.5.h),
                            CustomDatePickField(
                              lableText: "Due Date",
                              fieldController:
                                  activityMgtController.dateController,
                              isEditable: activityMgtController.isEditable(),
                              onTap: () async {
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
                            SizedBox(height: 2.5.h),
                            CustomDropdownField(
                              lableText: "Priority",
                              prefixIcon: Icons.format_list_numbered_rounded,
                              list: activityMgtController.priorityDropdownList,
                              initialValue: (isEdit) ? activity.priority : null,
                              isEditable: activityMgtController.isEditable(),
                              onChange: (value) {
                                activityMgtController.priority.value = value;
                              },
                            ),
                          ],
                        ),
                      ),
                      (activityMgtController.isEditable())
                          ? CustomCardWidget(
                              childWidget: Row(
                                mainAxisAlignment: (isEdit)
                                    ? MainAxisAlignment.spaceAround
                                    : MainAxisAlignment.center,
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
                                    width: (isEdit) ? 42.5.w : 87.5.w,
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
