import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatefulWidget {
  final List<DropdownMenuItem<String>> list;
  final Function(dynamic) onChange;
  final String? initialValue;
  CustomDropDown(
      {required this.list, required this.onChange, this.initialValue});
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      iconSize: 7.5.w,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 5.w, top: 2.h, right: 2.5.w),
        labelStyle: TextStyle(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15.0),
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      icon: Icon(Icons.keyboard_arrow_down_outlined),
      items: this.widget.list,
      value: this.widget.initialValue,
      onChanged: (value) {
        this.widget.onChange(value);
      },
    );
  }
}
