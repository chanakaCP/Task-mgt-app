import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/config/storage/storage.dart';
import 'package:task_mgt_app/screens/auth/screens/signInScreen.dart';
import 'package:task_mgt_app/screens/splash/screens/splashScreen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Storage _pref = Storage();

    return FutureBuilder(
      future: _pref.getValue("id"),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            Timer(Duration(milliseconds: 2500), () {
              Get.offAllNamed("/home");
            });
          } else {
            Timer(Duration(milliseconds: 2500), () {
              Get.offAll(SignIn());
            });
          }
        }
        return SplachScreen();
      },
    );
  }
}
