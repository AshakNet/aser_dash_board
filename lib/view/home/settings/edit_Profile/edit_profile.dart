import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatelessWidget {
  PageController editProfile = PageController();
   EditProfile({super.key,required this.editProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
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
                    onTap:(){
                      editProfile.animateToPage(0, duration: const Duration(microseconds: 30), curve: Curves.easeIn);
        
                    },
                    child: CustomText(
                        text: "Settings<<",
                        size: 12.sp,
                        color: black,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  CustomText(
                      text: "Profile<<",
                      size: 12.sp,
                      color: black,
                      fontWeight: FontWeight.w700),
        
                ],
              ),
            ),
            SizedBox(height: 60.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 100.w,vertical: 20.h),
              child: Container(
        
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: white,
        
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 40.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/home/imagePersonal.png"),
                          SizedBox(width: 20.w,),
                          CustomText(text: "Change Image", size: 16.sp, color: const Color.fromRGBO(29, 36, 45, 1), fontWeight: FontWeight.w600,textDecoration: TextDecoration.underline,),
        
        
        
        
                        ],
                      ),
                      SizedBox(height: 30.h,),
                      Row(
                        children: [
                          CustomText(text: ":Name", size: 16.sp, color: black, fontWeight: FontWeight.w600),
                          SizedBox(width: 15.w,),
                          CustomText(text: "Moataz Elrawy", size: 16.sp, color: black, fontWeight: FontWeight.w400)
        
                        ],
                      ),
                      SizedBox(height: 20.h,),
        
                      Row(
                        children: [
                          CustomText(text: ":Email", size: 16.sp, color: black, fontWeight: FontWeight.w600),
                          SizedBox(width: 15.w,),
                          CustomText(text: "mo3tzelrawy111@gmail.com", size: 16.sp, color: black, fontWeight: FontWeight.w400)
        
                        ],
                      ),
                      SizedBox(height: 20.h,),
        
                      Row(
                        children: [
                          CustomText(text: ":Phone number:", size: 16.sp, color: black, fontWeight: FontWeight.w600),
                          SizedBox(width: 15.w,),
                          CustomText(text: "01117191257", size: 16.sp, color: black, fontWeight: FontWeight.w400)
        
                        ],
                      ),
        
                      SizedBox(height: 50.h,),
        
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(text: "First Name", size: 14.sp, color: black, fontWeight: FontWeight.w500),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10.h),
                                    child: SizedBox(
                                      width: 447.w,
                                      child: TextFormField(
                                        controller: TextEditingController(),
        
                                        validator: (value) {},
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
        
                                          fillColor:
                                          const Color.fromRGBO(247, 247, 247, 1),
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
                                          hintText: 'Moataz ',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.r),
                                            borderSide: BorderSide(color: orange),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
        
                              SizedBox(width: 20.h,),
        
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(text: "Email", size: 14.sp, color: black, fontWeight: FontWeight.w500),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10.h),
                                    child: SizedBox(
                                      width: 447.w,
                                      child: TextFormField(
                                        controller: TextEditingController(),
        
                                        validator: (value) {},
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
        
                                          fillColor:
                                          const Color.fromRGBO(247, 247, 247, 1),
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
                                          hintText: 'mo3tzelrawy1111@gmail.com ',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.r),
                                            borderSide: BorderSide(color: orange),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
        
                          SizedBox(height: 20.h,),
        
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(text: "Phone Number", size: 14.sp, color: black, fontWeight: FontWeight.w500),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10.h),
                                    child: SizedBox(
                                      width: 447.w,
                                      child: TextFormField(
                                        controller: TextEditingController(),
        
                                        validator: (value) {},
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
        
                                          fillColor:
                                          const Color.fromRGBO(247, 247, 247, 1),
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
                                          hintText: 'Moataz ',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.r),
                                            borderSide: BorderSide(color: orange),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
        
                              SizedBox(width: 20.h,),
        
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(text: "last Name", size: 14.sp, color: black, fontWeight: FontWeight.w500),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10.h),
                                    child: SizedBox(
                                      width: 447.w,
                                      child: TextFormField(
                                        controller: TextEditingController(),
        
                                        validator: (value) {},
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
        
                                          fillColor:
                                          const Color.fromRGBO(247, 247, 247, 1),
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
                                          hintText: '01068622014 ',
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.r),
                                            borderSide: BorderSide(color: orange),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 50.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {

                            },
                            child: Container(
                              width: 109.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadiusDirectional.circular(
                                      10.r),
                                  color: orange,

                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: "save",
                                    size: 14.sp,
                                    color: white,
                                    fontWeight: FontWeight.w600,
                                    alignment: Alignment.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w,),

                          GestureDetector(
                            onTap: () {


                              //HomeCubit.get(context).getAllBlog();
                            },
                            child: Container(
                              width: 80.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadiusDirectional.circular(
                                      10.r),
                                  color: darkGrey
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: "cancel",
                                    size: 14.sp,
                                    color: white,
                                    fontWeight: FontWeight.w600,
                                    alignment: Alignment.center,
                                  ),

                                ],
                              ),
                            ),
                          )
                        ],
                      )


                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
