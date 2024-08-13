import 'package:aser_dash_board/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RowItemBody extends StatelessWidget {
  const RowItemBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150.w,
          child: Text("Al Amal company",
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xFFF667085),
              )),
        ),
        SizedBox(
          width: 10.w,
        ),
        SizedBox(
          width: 150.w,
          child: Text("Accommodation",
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xFFF667085),
              )),
        ),
        SizedBox(
          width: 10.w,
        ),
        SizedBox(
          width: 150.w,
          child: Text("Cairo ",
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xFFF667085),
              )),
        ),
        SizedBox(
          width: 10.w,
        ),
        SizedBox(
          width: 150.w,
          child: Text("3 services",
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xFFF667085),
              )),
        ),
        SizedBox(
          width: 10.w,
        ),
        SizedBox(
          width: 150.w,
          child: Text("500000 EGP",
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xFFF667085),
              )),
        ),
        SizedBox(
          width: 10.w,
        ),
        SizedBox(
          width: 150.w,
          child: Text("18 Mai , 2024",
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xFFF667085),
              )),
        ),
        SizedBox(
          width: 10.w,
        ),
        SizedBox(
          width: 80.w,
          height: 40.h,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Color(0xFFF41C588),
            ),
            child: Center(
              child: Text(
                "Active",
                style: TextStyle(color: white),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        InkWell(
            onTap: () {}, child: SvgPicture.asset("assets/images/More.svg")),
      ],
    );
  }
}
