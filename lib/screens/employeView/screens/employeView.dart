import 'package:flutter/material.dart';
import 'package:task_mgt_app/customWidgets/appbar/customAppBar.dart';
import 'package:task_mgt_app/models/RegisterUser.dart';

class EmployeView extends StatelessWidget {
  final RegisterUser employe;

  const EmployeView({Key? key, required this.employe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Employe", drawerCallback: () {}),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
