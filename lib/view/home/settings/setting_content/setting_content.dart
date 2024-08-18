import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingContent extends StatelessWidget {
  PageController settingContent = PageController();
   SettingContent({super.key,required this.settingContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap:(){
                    //settingContent.animateToPage(0, duration: const Duration(microseconds: 30), curve: Curves.easeIn);

                  },
                  child: CustomText(
                      text: "Home",
                      size: 12.sp,
                      color: darkGrey,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 5.w,
                ),

                CustomText(
                    text: "Settings<<",
                    size: 12.sp,
                    color: black,
                    fontWeight: FontWeight.w700),
              ],
            ),
          ),
          SizedBox(height: 40.h,),
          GestureDetector(
            onTap: (){
              settingContent.animateToPage(1, duration: Duration(milliseconds: 30), curve: Curves.easeIn);
            },
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 140.w),
              child: Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(20.r)
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(

                    children: [
                      Image.asset("assets/images/home/personal.png"),
                      SizedBox(width: 20.w,),
                      CustomText(text: "Personal Information", size: 20.sp, color: const Color.fromRGBO(0, 25, 39, 1), fontWeight: FontWeight.w600),
                      const Spacer(),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios))

                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h,),
          GestureDetector(
            onTap: (){
              settingContent.animateToPage(3, duration: const Duration(milliseconds: 30), curve: Curves.easeIn);
            },
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 140.w),
              child: Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20.r)
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(

                    children: [
                      Image.asset("assets/images/home/member.png"),
                      SizedBox(width: 20.w,),
                      CustomText(text: "Members", size: 20.sp, color: const Color.fromRGBO(0, 25, 39, 1), fontWeight: FontWeight.w600),
                      const Spacer(),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios))

                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 140.w),
            child: Container(
              width: double.infinity,
              height: 80.h,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(20.r)
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(

                  children: [
                    Image.asset("assets/images/home/notifiction.png"),
                    SizedBox(width: 20.w,),
                    CustomText(text: "Notifications", size: 20.sp, color: const Color.fromRGBO(0, 25, 39, 1), fontWeight: FontWeight.w600),
                    const Spacer(),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios))

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
