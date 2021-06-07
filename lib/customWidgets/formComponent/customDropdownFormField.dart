import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownField extends StatelessWidget {
  final List<DropdownMenuItem<String>> list;
  final Function(dynamic) onChange;
  final String? initialValue;
  final String lableText;
  final IconData prefixIcon;
  final bool isEditable;

  CustomDropdownField({
    required this.list,
    required this.onChange,
    required this.lableText,
    required this.prefixIcon,
    this.isEditable = true,
    this.initialValue,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(this.prefixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.only(left: 7.5.w, top: 4.h),
          labelText: this.lableText,
          labelStyle: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w700,
            fontSize: 4.sp,
          ),
          alignLabelWithHint: true,
        ),
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
        ),
        items: this.list,
        value: this.initialValue ?? list.first.value,
        onChanged: (isEditable)
            ? (value) {
                this.onChange(value);
              }
            : null,
      ),
    );
  }
}
