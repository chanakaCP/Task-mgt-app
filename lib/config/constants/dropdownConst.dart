import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownConst {
  final List<DropdownMenuItem<String>> priority = [
    DropdownMenuItem(
      value: "Low",
      child: Text("Low"),
    ),
    DropdownMenuItem(
      value: "Medium",
      child: Text("Medium"),
    ),
    DropdownMenuItem(
      value: "High",
      child: Text("High"),
    )
  ];

  final List<DropdownMenuItem<String>> status = [
    DropdownMenuItem(
      value: "To Do",
      child: Text("To Do"),
    ),
    DropdownMenuItem(
      value: "In Progress",
      child: Text("In Progress"),
    ),
    DropdownMenuItem(
      value: "Done",
      child: Text("Done"),
    )
  ];

  final List<DropdownMenuItem<String>> category = [
    DropdownMenuItem(
      value: "All",
      child: Text(
        "All",
        style: TextStyle(fontSize: 3.5.w),
      ),
    ),
    DropdownMenuItem(
      value: "Status",
      child: Text(
        "Status",
        style: TextStyle(fontSize: 3.5.w),
      ),
    ),
    DropdownMenuItem(
      value: "Due Date",
      child: Text(
        "Due Date",
        style: TextStyle(fontSize: 3.5.w),
      ),
    ),
    // DropdownMenuItem(
    //   value: "Assignee",
    //   child: Text(
    //     "Assignee",
    //     style: TextStyle(fontSize: 3.5.w),
    //   ),
    // )
  ];
}
