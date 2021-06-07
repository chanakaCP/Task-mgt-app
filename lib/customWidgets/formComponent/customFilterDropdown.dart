import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilterDropdown extends StatelessWidget {
  final List<DropdownMenuItem<String>> list;
  final Function(dynamic) onChange;
  final String lableText;
  CustomFilterDropdown({
    required this.list,
    required this.onChange,
    required this.lableText,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
          labelText: this.lableText,
          labelStyle: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w700,
            fontSize: 3.5.sp,
          ),
          alignLabelWithHint: true,
        ),
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
        ),
        items: this.list,
        value: list.first.value,
        onChanged: (value) {
          this.onChange(value);
        },
      ),
    );
  }
}
