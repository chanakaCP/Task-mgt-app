import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawerController extends GetxController {
  RxInt currentIndex = 1.obs;

  changeView(int index) {
    currentIndex.value = index;
  }
}
