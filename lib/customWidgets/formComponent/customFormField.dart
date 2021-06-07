import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_mgt_app/getX/services/authService.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatefulWidget {
  final AuthService _authService = Get.find<AuthService>();
  final String hintText;
  final String lableText;
  final bool isPass;
  final TextEditingController fieldController;
  final IconData prefixIcon;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final double? margin;
  final bool? isEditable;
  final int? maxLines;

  CustomFormField({
    required this.hintText,
    required this.lableText,
    required this.isPass,
    required this.fieldController,
    required this.prefixIcon,
    this.inputType,
    this.maxLines,
    this.inputAction = TextInputAction.done,
    this.margin,
    this.isEditable,
  });
  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  final textFieldFocusNode = FocusNode();
  bool isHide = false;

  @override
  void initState() {
    if (this.widget.isPass == true) {
      isHide = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: this.widget.margin ?? 4.w),
      child: TextFormField(
          maxLines:
              (this.widget.maxLines == null) ? null : this.widget.maxLines,
          enabled: this.widget.isEditable ?? true,
          textInputAction: this.widget.inputAction,
          focusNode: textFieldFocusNode,
          cursorHeight: 2.h,
          controller: this.widget.fieldController,
          obscureText: (isHide == true) ? true : false,
          validator: (value) {
            dynamic error;
            if (value!.isEmpty) {
              error = this.widget.lableText + " is required";
            } else if (this.widget.hintText == "Email") {
              if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
                error = 'Please enter a valid email';
              }
            } else if (this.widget.hintText == "Confirm Password") {
              if (value != widget._authService.password.value) {
                error = 'Password not match';
              }
            }
            return error;
          },
          keyboardType: (this.widget.inputType == null)
              ? TextInputType.text
              : this.widget.inputType,
          decoration: InputDecoration(
            suffixIcon: (this.widget.isPass == true)
                ? IconButton(
                    icon: Icon(
                      (isHide == true)
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      textFieldFocusNode.unfocus();
                      textFieldFocusNode.canRequestFocus = false;
                      Future.delayed(Duration(milliseconds: 100), () {
                        textFieldFocusNode.canRequestFocus = true;
                      });

                      setState(() {
                        isHide = !isHide;
                      });
                    },
                  )
                : null,
            prefixIcon: Icon(this.widget.prefixIcon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding: EdgeInsets.only(left: 7.5.w, top: 4.h),
            labelText: this.widget.lableText,
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
            hintText: this.widget.hintText,
          )),
    );
  }
}
