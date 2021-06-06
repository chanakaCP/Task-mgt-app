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
}
