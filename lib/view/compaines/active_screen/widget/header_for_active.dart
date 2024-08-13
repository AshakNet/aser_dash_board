import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderForActive extends StatelessWidget {
  const HeaderForActive({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Home",
            style: TextStyle(
              color:Colors.grey,
              fontSize: 12.sp,
            )),
        Text(
          ">>",
          style: TextStyle(
            color:Colors.grey,
            fontSize: 12.sp,

          ),

        ),
        Text(
            "Companies",
            style: TextStyle(
                fontSize: 12,
                color: Colors.black
            )
        )  , Text(
            ">>Al Amal company",
            style: TextStyle(
                fontSize: 12,
                color: Colors.black
            )
        )
      ],
    )
    ;
  }
}
