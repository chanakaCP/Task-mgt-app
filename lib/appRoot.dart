import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/config/utills/wrapper.dart';
import 'package:task_mgt_app/getX/bindings/authBinding.dart';
import 'package:task_mgt_app/getX/bindings/homeBinding.dart';
import 'package:task_mgt_app/screens/Home/screens/home.dart';

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(100, 100),
      builder: () => GetMaterialApp(
        title: "Insteller task mgt",
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        getPages: [
          GetPage(
            name: "/",
            page: () => Wrapper(),
            binding: AuthBinding(),
          ),
          GetPage(
            name: "/home",
            page: () => Home(),
            binding: HomeBinding(),
          ),
        ],
      ),
    );
  }
}
