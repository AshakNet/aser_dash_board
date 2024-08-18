
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEmployee extends StatelessWidget {
  PageController addEmployee = PageController();
   AddEmployee({super.key,required this.addEmployee});

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
                    function: (){
                      addEmployee.previousPage( duration: const Duration(milliseconds: 30), curve: Curves.easeIn);
                    },
                    color: black,
                    fontWeight: FontWeight.w700),
                SizedBox(
                  width: 5.w,
                ),

                CustomText(
                    text: "Member<<",
                    size: 12.sp,
                    color: black,
                    fontWeight: FontWeight.w700),
              ],
            ),
          ),
          SizedBox(height: 40.h,),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 50.h,horizontal: 50.w),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15.r),
                color: white
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 30.h,horizontal: 40.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "Add Member", size: 20.sp, color: black, fontWeight: FontWeight.w600),
                    SizedBox(height: 30.h,),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 50.r,
                          backgroundColor: darkGrey,
                        ),

                        SizedBox(width: 30.w,),

                        CustomText(text: "Change Image", size: 20.sp, color: darkGrey, fontWeight: FontWeight.w600,textDecoration: TextDecoration.underline,),


                      ],
                    ),
                    SizedBox(height: 30.h,),
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
                        SizedBox(height: 20.h,),


                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Password", size: 14.sp, color: black, fontWeight: FontWeight.w500),
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
                                        hintText: 'password ',
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
                                CustomText(text: "confirmPassword", size: 14.sp, color: black, fontWeight: FontWeight.w500),
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
                                        hintText: 'ConfirmPassword ',
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
    );
  }
}
