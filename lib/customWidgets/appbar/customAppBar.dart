import 'package:flutter/material.dart';
import 'package:task_mgt_app/config/storage/storage.dart';
import 'package:task_mgt_app/customWidgets/customContainer.dart';
import 'package:task_mgt_app/customWidgets/customText.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/getX/services/authService.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar(
      {required this.title, this.isBack, required this.drawerCallback});
  final String title;
  final bool? isBack;
  final VoidCallback drawerCallback;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomText(
        text: title,
        size: 25,
        weight: FontWeight.w600,
        color: Colors.white,
      ),
      actions: [
        CustomContainer(
          paddingRight: 5.w,
          child: InkWell(
            child: Icon(
              Icons.menu_rounded,
              size: 7.5.w,
            ),
            onTap: () {
              AuthService().signOut();
              Storage().deleteValue("id");
              Get.offAllNamed("/signIn");
              // drawerCallback();
            },
          ),
        )
      ],
      backgroundColor: Colors.blue,
      automaticallyImplyLeading: isBack ?? false,
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
