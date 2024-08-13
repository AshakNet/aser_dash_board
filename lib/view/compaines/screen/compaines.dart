import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/view/compaines/widgets/componant.dart';
import 'package:aser_dash_board/view/compaines/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/body_for_company.dart';

class Compaines extends StatelessWidget {
  const Compaines({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:   Color.fromRGBO(247, 247, 247, 1),
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            HeaderWidgets(),
            SizedBox(
              height: 20.h,
            ),
            SearchPar(),
            Row(
              children: [
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Text("Reset",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                  width: 10.w,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Search",style: TextStyle(color: Colors.white),),
                  style: TextButton.styleFrom(
                    backgroundColor: orange,
                    // Set the background color// Set the text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:  EdgeInsets.all(12.0.w),
                  child: BodyForCompany(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
