import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/screens/employeList/screens/employeeList.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          InkWell(
            child: ListTile(
              title: Text("Ttem 1"),
              trailing: Icon(Icons.arrow_forward),
            ),
            onTap: () {
              print("asdasd");
              Get.back();
              Get.to(EmployeList());
            },
          ),
          ListTile(
            title: Text("Item 2"),
            trailing: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
