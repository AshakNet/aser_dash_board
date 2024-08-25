import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsActivity extends StatelessWidget {
  PageController detailsOrderActivity = PageController();
  OrderDetailsActivity({super.key,required this.detailsOrderActivity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: Row(
                children: [
                  CustomText(
                      text: "Home",
                      size: 12.sp,
                      color: darkGrey,
                      fontWeight: FontWeight.w600),
                  SizedBox(
                    width: 5.w,
                  ),
                  GestureDetector(
                      onTap: () {
                        detailsOrderActivity.animateToPage(0,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: CustomText(
                          text: "Activity<<",
                          size: 12.sp,
                          color: darkGrey,
                          fontWeight: FontWeight.w600)),
                  GestureDetector(
                    onTap: (){
                      detailsOrderActivity.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: CustomText(
                        text: "Orders<<",
                        size: 12.sp,
                        color: black,
                        fontWeight: FontWeight.w700),
                  ),
                  CustomText(
                      text: "New<<",
                      size: 12.sp,
                      color: black,
                      fontWeight: FontWeight.w700),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 60.w,
                ),
                Expanded(
                    flex: 2,
                    child: Container(

                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadiusDirectional.circular(20.r)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                              child: CustomText(text: "Order Details", size: 20.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                            ),
                            SizedBox(height: 20.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(color: darkGrey)

                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CustomText(text: "Type", size: 16.sp, color: black, fontWeight: FontWeight.w600,textDecoration: TextDecoration.underline,alignment: Alignment.centerLeft,),
                                          Spacer(),
                                          CustomText(text: "Activities", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),


                                        ],
                                      ),
                                      SizedBox(height: 10.h,),
                                      Row(
                                        children: [
                                          CustomText(text: "Company name", size: 16.sp, color: black, fontWeight: FontWeight.w600,textDecoration: TextDecoration.underline,alignment: Alignment.centerLeft,),
                                          Spacer(),
                                          CustomText(text: "Egyptian company", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),


                                        ],
                                      ),
                                      SizedBox(height: 10.h,),
                                      Row(
                                        children: [
                                          CustomText(text: "Activity Type", size: 16.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                          Spacer(),
                                          CustomText(text: "Water play center", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),


                                        ],
                                      ),
                                      SizedBox(height: 10.h,),
                                      Row(
                                        children: [
                                          CustomText(text: "Number of persons", size: 16.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                          Spacer(),
                                          CustomText(text: "5", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),


                                        ],
                                      ),
                                      SizedBox(height: 10.h,),
                                      Row(
                                        children: [
                                          CustomText(text: "Price", size: 16.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                          Spacer(),
                                          CustomText(text: "500 EGP", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),


                                        ],
                                      ),
                                      SizedBox(height: 10.h,),
                                 





                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Container(
                                  width: 120.w,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                      color: orange,
                                      borderRadius:
                                      BorderRadiusDirectional.circular(
                                          10.r),
                                      border: Border.all(color: darkGrey)),
                                  child: CustomText(
                                    text: "Accept ",
                                    size: 16.sp,
                                    color: black,
                                    fontWeight: FontWeight.w600,
                                    alignment: Alignment.center,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Container(
                                  width: 120.w,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadiusDirectional.circular(
                                          10.r),
                                      border: Border.all(color: darkGrey)),
                                  child: CustomText(
                                    text: "Decline ",
                                    size: 16.sp,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                    alignment: Alignment.center,
                                  ),
                                ),

                              ],
                            ),


                          ],
                        ),
                      ),
                    )

                ),
                SizedBox(
                  width: 60.w,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius:
                            BorderRadiusDirectional.circular(20.r)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/images/home/pesrson.png"),
                              ),
                              CustomText(
                                text: "Esraa Badwy",
                                size: 20.sp,
                                color: black,
                                fontWeight: FontWeight.w600,
                                textDecoration: TextDecoration.underline,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/home/profile.png"),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  CustomText(
                                    text: "moatazelrawy111@gmail.com",
                                    size: 14.sp,
                                    color: black,
                                    fontWeight: FontWeight.w600,
                                  ),

                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: " : Status  ",
                                    size: 14.sp,
                                    color: black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  CustomText(
                                    text: "Pending",
                                    size: 14.sp,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),

                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                child: CustomText(
                                  text: "Owner profile",
                                  size: 20.sp,
                                  color: black,
                                  fontWeight: FontWeight.w600,
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(

                                  children: [
                                    CustomText(
                                      text:
                                      "Name :",
                                      size: 14.sp,
                                      color: black,
                                      fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                    SizedBox(width: 10.h,),

                                    CustomText(
                                      text:
                                      "Esraa Badwy",
                                      size: 14.sp,
                                      color: black,
                                      fontWeight: FontWeight.w400,alignment: Alignment.centerRight,),

                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(

                                  children: [
                                    CustomText(
                                      text:
                                      "Email Address :",
                                      size: 14.sp,
                                      color: black,
                                      fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                    SizedBox(width: 10.h,),

                                    CustomText(
                                      text:
                                      "mo3tzelrawy151@gmail.com",
                                      size: 14.sp,
                                      color: black,
                                      fontWeight: FontWeight.w400,alignment: Alignment.centerRight,),

                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(

                                  children: [
                                    CustomText(
                                      text:
                                      "Gender:",
                                      size: 14.sp,
                                      color: black,
                                      fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                    SizedBox(width: 10.h,),

                                    CustomText(
                                      text:
                                      "Female",
                                      size: 14.sp,
                                      color: black,
                                      fontWeight: FontWeight.w400,alignment: Alignment.centerRight,),


                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(

                                  children: [
                                    CustomText(
                                      text:
                                      "Phone number:",
                                      size: 14.sp,
                                      color: black,
                                      fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                    SizedBox(width: 10.h,),

                                    CustomText(
                                      text:
                                      "01117191258",
                                      size: 14.sp,
                                      color: black,
                                      fontWeight: FontWeight.w400,alignment: Alignment.centerRight,),


                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(

                                  children: [
                                    CustomText(
                                      text:
                                      "National ID:",
                                      size: 14.sp,
                                      color: black,
                                      fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                    SizedBox(width: 10.h,),

                                    CustomText(
                                      text:
                                      "29708011201743",
                                      size: 14.sp,
                                      color: black,
                                      fontWeight: FontWeight.w400,alignment: Alignment.centerRight,),


                                  ],
                                ),
                              ),







                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                SizedBox(
                  width: 60.w,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
