import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_mgt_app/customWidgets/customContainer.dart';
import 'package:task_mgt_app/customWidgets/customText.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarWithTab extends StatelessWidget with PreferredSizeWidget {
  CustomAppBarWithTab({required this.title, this.isBack, required this.tabs});
  final String title;
  final bool? isBack;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
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
            onTap: () {},
          ),
        )
      ],
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.h),
        child: TabBar(
          tabs: tabs,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
          indicatorColor: Colors.transparent,
          indicatorWeight: 1.w,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: EdgeInsets.symmetric(horizontal: 8.h),

          // indicator: BoxDecoration(
          //   borderRadius: BorderRadius.circular(50), // Creates border
          //   color: Colors.white,
          // ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(15.h);
}
