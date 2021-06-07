import 'package:flutter/material.dart';

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
}
