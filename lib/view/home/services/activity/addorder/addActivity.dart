import 'dart:io';
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/activity_cubit/activitycubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:aser_dash_board/widgets/formField/formField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddActivity extends StatelessWidget {
  PageController addActivity = PageController();

  AddActivity({super.key,required this.addActivity});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(

            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: Row(
                  children: [
                    CustomText(
                        text: "Services",
                        size: 12.sp,
                        color: darkGrey,
                        fontWeight: FontWeight.w600),
                    SizedBox(
                      width: 5.w,
                    ),
                    GestureDetector(
                        onTap: () {
                          addActivity.animateToPage(0,
                              duration: const Duration(milliseconds: 5),
                              curve: Curves.easeIn);
                        },
                        child: CustomText(
                            text: "Activity<<",
                            size: 12.sp,
                            color: darkGrey,
                            fontWeight: FontWeight.w600)),
                    GestureDetector(
                      onTap: (){
                        addActivity.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: CustomText(
                          text: "Add Activity<<",
                          size: 12.sp,
                          color: black,
                          fontWeight: FontWeight.w700),
                    ),

                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 60,
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 40.h),
                              child: CustomText(text: "Activity Details", size: 18.sp, color: black, fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                            ),

                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.w),
                              child: CustomText(text: "Activity Heading", size: 14.sp, color: black, fontWeight: FontWeight.w500,alignment: Alignment.centerLeft,),
                            ),

                            SizedBox(height: 10.h,),

                            textFormFildBuilder(context, width: 597.w, hint: "Enter the trip name", controller: TextEditingController(), validation: (){}),

                            SizedBox(height: 10.h,),

                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.w),
                              child: CustomText(text: "The number of available program", size: 14.sp, color: black, fontWeight: FontWeight.w500,alignment: Alignment.centerLeft,),
                            ),
                            SizedBox(height: 10.h,),

                            textFormFildBuilder(context, width: 597.w, hint: "Enter the number of available program", controller: TextEditingController(), validation: (){}),


                            SizedBox(height: 10.h,),

                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.w),
                              child: CustomText(text: "Activity Price (EGP)", size: 14.sp, color: black, fontWeight: FontWeight.w500,alignment: Alignment.centerLeft,),
                            ),
                            SizedBox(height: 10.h,),

                            Row(
                              children: [
                                textFormFildBuilder(context, width: 410.w, hint: "Enter the activity price", controller: TextEditingController(), validation: (){}),
                                SizedBox(width: 5.w,),
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
                                          value: ActivityCubit.get(context).status,

                                          items: ["Company", "Indivadual"]
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
                                            ActivityCubit.get(context)
                                                .changeStatus(val);
                                          }),
                                    ),
                                  ),
                                )



                              ],
                            ),
                            SizedBox(height: 10.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.w),
                              child: CustomText(text: "Enter the Description", size: 14.sp, color: black, fontWeight: FontWeight.w500,alignment: Alignment.centerLeft,),
                            ),
                            SizedBox(height: 10.h,),

                            textFormFildBuilder(context, width: 579.w, hint: "Activity Description", controller: TextEditingController(), validation: (){},manLines: 4,maxLines: 5),

                            SizedBox(height: 10.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.w),
                              child: CustomText(text: "Photo of destination", size: 14.sp, color: black, fontWeight: FontWeight.w500,alignment: Alignment.centerLeft,),
                            ),
                            SizedBox(height: 10.h,),

                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                width: 708.w,
                                height: 200.h,


                                decoration: BoxDecoration(
                                    border: Border.all(color: darkGrey),
                                    borderRadius: BorderRadiusDirectional.circular(20.r)
                                ),
                                child: GestureDetector(
                                  onTap: (){
                                    ActivityCubit.get(context).getImage(ImageSource.gallery);

                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/images/home/upload.png",color: orange,),

                                      SizedBox(height: 15.h,),
                                      CustomText(text: " Upload photo", size: 14.sp, color: orange, fontWeight: FontWeight.w600),
                                      ActivityCubit.get(context).image == null  ? SizedBox.shrink() :
                                      Image.file(
                                        //height: 100.h,fit: BoxFit.cover,width: double.infinity,
                                          File(ActivityCubit.get(context)
                                              .image!
                                              .path))



                                    ],
                                  ),
                                ),
                              ),
                            ),





                          ],
                        ),


                      )),
                  SizedBox(width: 40.w,),

                  Expanded(
                      flex: 40,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: white,
                            ),

                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: 20.h),
                              child: Column(
                                children: [

                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(text: "Date Details", size: 18.sp, color: black, fontWeight: FontWeight.w700,alignment: Alignment.bottomLeft,),
                                  ),
                                  SizedBox(height: 20.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(

                                            padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                            child: CustomText(text: "Activity Start Date", size: 14.sp, color: black, fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(height: 10.h,),
                                          textFormFildBuilder(context, width: 178.w, hint: "Enter start date ", controller: TextEditingController(), validation: (){},
                                              icon: IconButton(onPressed: (){}, icon: Icon(Icons.date_range_outlined))
                                          )
                                        ],
                                      ),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(

                                            padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                            child: CustomText(text: "Enter end date", size: 14.sp, color: black, fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(height: 10.h,),
                                          textFormFildBuilder(context, width: 178.w, hint: "Enter end date", controller: TextEditingController(), validation: (){},
                                              icon: IconButton(onPressed: (){}, icon: Icon(Icons.date_range_outlined))
                                          )
                                        ],
                                      )

                                    ],
                                  ),
                                  ////l;l;l;
                                  SizedBox(height: 20.h,),

                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(text: "Company Details", size: 18.sp, color: black, fontWeight: FontWeight.w700,alignment: Alignment.bottomLeft,),
                                  ),
                                  SizedBox(height: 20.h,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(text: "Company Name", size: 14.sp, color: black, fontWeight: FontWeight.w500,alignment: Alignment.bottomLeft,),
                                  ),
                                  SizedBox(height: 20.h,),
                                  textFormFildBuilder(context, width: 420.w, hint: "Enter company name", controller: TextEditingController(),
                                      icon: IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_up)),
                                      validation: (){})

                                ],
                              ),
                            ),

                          ),

                          SizedBox(height: 40.h,),

                          Container(
                            width: double.infinity,
                            height: 60.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(10.r),
                                color: orange
                            ),
                            child: CustomText(text: "Add Activity", size: 16.sp, color: white, fontWeight: FontWeight.w600,alignment: Alignment.center,),
                          ),
                          SizedBox(height: 20.h,),
                          Container(
                            width: double.infinity,
                            height: 60.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: darkGrey),
                              borderRadius: BorderRadiusDirectional.circular(10.r),

                            ),
                            child: CustomText(text: "Clear", size: 16.sp, color: orange, fontWeight: FontWeight.w600,alignment: Alignment.center,),
                          )
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
