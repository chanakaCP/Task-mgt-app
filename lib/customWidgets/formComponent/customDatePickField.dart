import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDatePickField extends StatelessWidget {
  final String lableText;
  final TextEditingController fieldController;
  final VoidCallback onTap;
  final bool? isEditable;
  CustomDatePickField({
    required this.lableText,
    required this.fieldController,
    required this.onTap,
    this.isEditable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      child: TextFormField(
        readOnly: true,
        onTap: () {
          onTap();
        },
        enabled: isEditable ?? true,
        controller: fieldController,
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.date_range_outlined),
          suffixIcon: Padding(
            padding: EdgeInsetsDirectional.only(end: 7.5.w),
            child: Icon(
              Icons.add,
              color: Colors.blueGrey,
            ),
          ),
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
          hintStyle: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w300,
            fontSize: 4.5.sp,
          ),
          alignLabelWithHint: true,
          hintText: lableText,
        ),
      ),
    );
  }
}
