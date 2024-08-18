import 'dart:io';

import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/home/home_cubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class Active extends StatelessWidget {
  PageController controller = PageController();
   Active({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: (){
                          controller.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                      },
                      child: CustomText(text: "Dashboard  ", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w600)),
                  CustomText(text: "Add Advertisement >> ", size: 12.sp, color: black, fontWeight: FontWeight.w700)
          
                ],
              ),
              SizedBox(height: 30.h,),
          
              Container(
          
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(20.r),
                    color: white
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 200.w,vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(text: "Status", size: 18.sp, color: black, fontWeight: FontWeight.w700),
                          SizedBox(width: 10.w,),
                          Container(
                            width: 70.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(10.r),color: Color.fromRGBO(231, 248, 240, 1)
                            ),
                            child: CustomText(text: "active", size: 12.sp, color: Color.fromRGBO(65, 197, 136, 1), fontWeight: FontWeight.w600,alignment: Alignment.center,),
                          ),
                          Spacer(),
                          Icon(Icons.edit_calendar,color: orange,),
                          SizedBox(width: 5.w,),
                          CustomText(text: "Edit Ad", size: 18.sp, color: orange, fontWeight: FontWeight.w600,textDecoration: TextDecoration.underline,)
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      CustomText(text: "Add Title", size: 14.sp, color: black, fontWeight: FontWeight.w600),
                      Row(
                        children: [
                          SizedBox(
                            width:  447.w,
                            child: TextFormField(
                              controller: TextEditingController(),
                              maxLines: 1,
                              validator: (value) {},
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
          
                                //filled: true,
          
                                fillColor: Color.fromRGBO(247, 247, 247, 1),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 13.w,
                                  vertical: 5.h,
                                ),
                                constraints: BoxConstraints(
                                  minHeight: 64.h,
                                  minWidth: 372.w,
                                ),
          
                                hintStyle: TextStyle(
                                  fontSize: 8.sp,
                                  color: darkGrey,
                                ),
                                hintText: 'Enter Title',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: BorderSide(color: orange),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 75.w,),
                          Container(
          
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadiusDirectional.circular(10.r),
                                border: Border.all(color: darkGrey)
                            ),
                            child: Padding(
          
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: SizedBox(
                                width: 150.w,
                                child: DropdownButton(
                                    menuMaxHeight: 200.0,
          
                                    isExpanded: true,
                                    focusColor: white,
                                    dropdownColor: white,
          
                                    icon: Align(
                                        alignment: Alignment.center,
                                        child: Icon(Icons.keyboard_arrow_down,
                                            color: orange, size: 30.sp)),
                                    borderRadius: BorderRadius.circular(10.r),
                                    underline: SizedBox(),
                                    value: HomeCubit.get(context).choseHours,
                                    hint: CustomText(text: "Add Advertise", size: 12.sp, color: black, fontWeight: FontWeight.w600),
                                    items: [
                                      "22-4-2024",
                                      "24-6-2569",
                                      "4-4-2024"
                                    ]
                                        .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: 20.w),
                                        child: CustomText(
                                          text: e,
                                          color: orange,
                                          fontWeight: FontWeight.w700,
                                          size: 14.sp,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ))
                                        .toList(),
                                    onChanged: (val) {
                                      HomeCubit.get(context)
                                          .choseHoursFunction(val);
                                    }),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30.h,),
                      CustomText(text: "Add Content", size: 14.sp, color: black, fontWeight: FontWeight.w600),
                      SizedBox(
                        width:  710.w,
                        child: TextFormField(
                          controller: TextEditingController(),
                          maxLines: 6,minLines: 5,
                          validator: (value) {},
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
          
                            //filled: true,
          
                            fillColor: Color.fromRGBO(247, 247, 247, 1),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 13.w,
                              vertical: 5.h,
                            ),
                            constraints: BoxConstraints(
                              minHeight: 64.h,
                              minWidth: 372.w,
                            ),
          
                            hintStyle: TextStyle(
                              fontSize: 8.sp,
                              color: darkGrey,
                            ),
                            hintText: 'Enter Add description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(color: orange),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h,),
          
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: " Ad Start Date", size: 14.sp, color: black, fontWeight: FontWeight.w600),
          
                              SizedBox(
                                width:  346.w,
                                child: TextFormField(
                                  controller: HomeCubit.get(context).startDate,
                                  maxLines: 1,minLines: 1,
                                  onTap: (){
                                    //HomeCubit.get(context).PickDate(context, HomeCubit.get(context).startDate);
                                  },
                                  validator: (value) {},
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                  readOnly: true,
                                  decoration: InputDecoration(
          
                                    //filled: true,
          
                                    fillColor: Color.fromRGBO(247, 247, 247, 1),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 13.w,
                                      vertical: 5.h,
                                    ),
                                    constraints: BoxConstraints(
                                      minHeight: 64.h,
                                      minWidth: 372.w,
                                    ),
                                    suffixIcon: Icon(Icons.date_range),
          
                                    hintStyle: TextStyle(
                                      fontSize: 8.sp,
                                      color: darkGrey,
          
                                    ),
                                    hintText: 'Enter Start Date',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide: BorderSide(color: orange),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: " Ad End Date", size: 14.sp, color: black, fontWeight: FontWeight.w600),
          
                              SizedBox(
                                width:  346.w,
                                child: TextFormField(
                                  controller: HomeCubit.get(context).endDate,
                                  maxLines: 1,minLines: 1,
                                  readOnly: true,
                                  onTap: (){
                                    //HomeCubit.get(context).PickDate(context, HomeCubit.get(context).endDate);
          
                                  },
                                  validator: (value) {},
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
          
                                    //filled: true,
          
                                    fillColor: Color.fromRGBO(247, 247, 247, 1),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 13.w,
                                      vertical: 5.h,
                                    ),
                                    constraints: BoxConstraints(
                                      minHeight: 64.h,
                                      minWidth: 372.w,
                                    ),
                                    suffixIcon: Icon(Icons.date_range),
          
                                    hintStyle: TextStyle(
                                      fontSize: 8.sp,
                                      color: darkGrey,
          
                                    ),
                                    hintText: 'Enter End Date',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide: BorderSide(color: orange),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
          
                      SizedBox(height: 30.h,),
          
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: " Ad photo", size: 14.sp, color: black, fontWeight: FontWeight.w600),
          
                          Container(
                            width: 708.w,
                            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
                            decoration: BoxDecoration(
                                border: Border.all(color: darkGrey),
                                borderRadius: BorderRadiusDirectional.circular(20.r)
                            ),
                            child: GestureDetector(
                              onTap: (){
                                HomeCubit.get(context).getImage(ImageSource.gallery);
          
                              },
                              child: Column(
                                children: [
                                  Image.asset("assets/images/home/upload.png",color: orange,),
          
                                  SizedBox(height: 15.h,),
                                  CustomText(text: " Upload photo of ad", size: 14.sp, color: orange, fontWeight: FontWeight.w600),
                                  HomeCubit.get(context).image == null  ? SizedBox.shrink() :
                                  Image.file(
                                    //height: 100.h,fit: BoxFit.cover,width: double.infinity,
                                      File(HomeCubit.get(context)
                                          .image!
                                          .path))
          
          
          
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
          
                      SizedBox(height: 30.h,),
                      Center(
                        child: Container(
                          width: 130.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadiusDirectional.circular(20.r)
                          ),
                          child: CustomText(text: "Stop Ad", size: 14.sp, color: white, fontWeight: FontWeight.w600,alignment: Alignment.center,),
          
                        ),
                      )
          
          
          
          
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
