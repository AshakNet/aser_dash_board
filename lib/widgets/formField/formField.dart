// ignore_for_file: prefer_const_constructors

import 'package:aser_dash_board/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget inputField({
  required TextEditingController controller,
  required String hintText,
  required double width,
  required double height,
  required Function validator,
  final Color? background,
  IconButton? icnon,
  bool isPassword = false,
  int maxLines = 1,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextFormField(
      maxLines: maxLines,
      controller: controller,
      validator: (value) => validator(value),
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.black,
      ),
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: icnon,
        filled: true,
        fillColor: Color(0xFFF7F7F7),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 13.w,
          vertical: 20.h,
        ),
        constraints: BoxConstraints(
          minHeight: height.h,
          minWidth: width.w,
        ),
        hintTextDirection: TextDirection.ltr,
        hintStyle: TextStyle(
          color: darkGrey,
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget textFormFildBuilder(
    BuildContext context, {
      required double width,
      required String hint,
      bool isRequired = true,
      required TextEditingController controller,
      required final Function validation,
      bool obstructText = false,
      bool read = false,
      TextInputType inputType = TextInputType.text,
       VoidCallback? onTap,
      IconButton ?icon,
      int maxLines = 1,
      int manLines = 1
    }) {
  return Padding(

    padding:  EdgeInsets.symmetric(horizontal: 20.w),
    child: SizedBox(
      width:width ,

      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        minLines: manLines,
        readOnly:read ,
        onTap:onTap ,
        validator: (input) => validation(input),
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          suffixIcon: icon,
          //filled: true,

          fillColor: Color.fromRGBO(247, 247, 247, 1),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 13.w,
            vertical: 20.h,
          ),
          constraints: BoxConstraints(
            minHeight: 64.h,
            minWidth: 372.w,
          ),

          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: darkGrey,
          ),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: orange),
          ),
        ),
      ),
    ),
  );
}
