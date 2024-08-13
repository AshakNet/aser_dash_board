import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderForBody extends StatelessWidget {
  const HeaderForBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.h,
      color: Color(0xFFFF7F9FC),
      child: Row(children: [
        SizedBox(
          width: 150.w,
          child: Text(
              "Name",
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xFFF667085),
              )
          ),
        ),
        SizedBox(width: 10.w,),
        SizedBox(
          width: 150.w,

          child: Text(
              "Service Type",
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xFFF667085),
              )
          ),
        ),
        SizedBox(width: 10.w,),

        SizedBox(
          width: 150.w,

          child: Text(
              "Governate ",
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xFFF667085),
              )
          ),
        ),
        SizedBox(width: 10.w,),

        SizedBox(
          width: 150.w,
          child: Text(
              "Service Number ",
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xFFF667085),
              )
          ),
        ),
        SizedBox(width: 10.w,),

        SizedBox(
          width: 150.w,
          child: Text(
              "Profits",
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xFFF667085),
              )
          ),
        ),
        SizedBox(width: 10.w,),

        SizedBox(
          width: 150.w,
          child: Text(
              "Addition date",
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xFFF667085),
              )
          ),
        ),
        SizedBox(width: 10.w,),

        SizedBox(
          width: 150.w,
          child: Text(
              "Status ",
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xFFF667085),
              )
          ),
        ),
      ],),
    );
  }
}
