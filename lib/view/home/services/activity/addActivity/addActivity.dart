import 'dart:io';
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/activity_cubit/activity_state.dart';
import 'package:aser_dash_board/logic/activity_cubit/activitycubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:aser_dash_board/widgets/formField/formField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddActivity extends StatelessWidget {
  PageController addActivity = PageController();

  AddActivity({super.key,required this.addActivity});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ActivityCubit,ActivityState>(
      listener: (context,state){
        if(state is CreateActivityLoading){
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Center(
                  child: CircularProgressIndicator(
                    color: orange,
                  ));
            },
          );
        }
       else if(state is CreateActivitySuccessful){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Create Activity Successful'),
              duration: Duration(seconds: 2),
            ),
          );
          Navigator.pop(context);
        }
        else if(state is CreateActivityError){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Colors.red,
              content: Text(state.error),
              duration: const Duration(seconds: 2),
            ),
          );
          Navigator.pop(context);
        }
      },
      builder: (context,state){
        return Scaffold(
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.h),
            child: SingleChildScrollView(
              child: Form(
                key: ActivityCubit.get(context).formKey,
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

                                  textFormFildBuilder(context, width: 597.w, hint: "Enter the active name", controller:ActivityCubit.get(context).titleActivity, validation: (value){
                                    if (value!.isEmpty) {
                                      return "Please Enter name";
                                    }
                                    return null;

                                  }),

                                  SizedBox(height: 10.h,),



                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(text: "Activity Price (EGP)", size: 14.sp, color: black, fontWeight: FontWeight.w500,alignment: Alignment.centerLeft,),
                                  ),
                                  SizedBox(height: 10.h,),

                                  Row(
                                    children: [
                                      Padding(

                                        padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                        child: SizedBox(
                                          width:597 ,

                                          child: TextFormField(
                                            controller: ActivityCubit.get(context).priceActivity,
                                            maxLines: 1,
                                            minLines: 1,


                                            validator: (value){
                                              if (value!.isEmpty) {
                                                return "Please Enter price";
                                              }
                                            },
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly, // Allow only digits
                                            ],
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(


                                              fillColor: Color.fromRGBO(247, 247, 247, 1),
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
                                              hintText: "Enter the activity price",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                                borderSide: BorderSide(color: orange),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )

                                     ,
                                      SizedBox(width: 5.w,),

                                    ],
                                  ),
                                  SizedBox(height: 10.h,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(text: "Enter the Description", size: 14.sp, color: black, fontWeight: FontWeight.w500,alignment: Alignment.centerLeft,),
                                  ),
                                  SizedBox(height: 10.h,),

                                  textFormFildBuilder(context, width: 597.w, hint: "Activity Description", controller: ActivityCubit.get(context).descriptionActivity, validation: (value){
                                    if (value!.isEmpty) {
                                      return "Please Enter description";
                                    }
                                    return null;
                                  },manLines: 4,maxLines: 5),

                                  SizedBox(height: 10.h,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(text: "Photo of destination", size: 14.sp, color: black, fontWeight: FontWeight.w500,alignment: Alignment.centerLeft,),
                                  ),
                                  SizedBox(height: 10.h,),

                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Container(
                                      width: 597.w,
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
                                                textFormFildBuilder(context,

                                                    width: 178.w,onTap: (){
                                                       ActivityCubit.get(context).PickDate(context : context,
                                                          controller:  ActivityCubit.get(context).activityStartDate,
                                                       firstDate: DateTime.now(),
                                                         lastDate: DateTime(2030)
                                                       );
                                                    },

                                                    read: true,
                                                    hint: "Enter start date ", controller: ActivityCubit.get(context).activityStartDate, validation: (value){
                                                      if (value!.isEmpty) {
                                                        return "Please Enter startDate";
                                                      }
                                                      return null;
                                                    },
                                                    icon: IconButton(onPressed: (){},
                                                        icon: Icon(Icons.date_range_outlined))
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
                                                textFormFildBuilder(context,read: true,
                                                    onTap: (){
                                                      ActivityCubit.get(context).PickDate(context : context,
                                                          controller:  ActivityCubit.get(context).activityEndDate,
                                                          firstDate: DateTime.now(),
                                                          lastDate: DateTime(2030)
                                                      );
                                                    },
                                                    width: 178.w, hint: "Enter end date", controller:ActivityCubit.get(context).activityEndDate, validation: (value){
                                                      if (value!.isEmpty) {
                                                        return "Please Enter endDate";
                                                      }
                                                    },
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
                                        Container(

                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius: BorderRadiusDirectional.circular(10.r),
                                              border: Border.all(color: darkGrey)
                                          ),
                                          child: Padding(

                                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                                            child: SizedBox(

                                              child: DropdownButton(
                                                  menuMaxHeight: 200.0,hint: CustomText(text: "enter company name", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w600),

                                                  isExpanded: true,
                                                  focusColor: white,
                                                  dropdownColor: white,

                                                  icon: Align(
                                                      alignment: Alignment.center,
                                                      child: Icon(Icons.keyboard_arrow_down,
                                                          color: orange, size: 30.sp)),
                                                  borderRadius: BorderRadius.circular(10.r),
                                                  underline: SizedBox(),
                                                  value: ActivityCubit.get(context).selectCompanyVar,

                                                  items: ActivityCubit.get(context).getAllCompanyModel?.data
                                                      ?.map((e) => DropdownMenuItem(
                                                    value: e.id,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 20.w),

                                                      child: CustomText(
                                                        text: e.name.toString(),
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
                                                        .selectCompany(val);
                                                    print(val);
                                                  }),
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),

                                ),

                                SizedBox(height: 40.h,),

                                GestureDetector(
                                  onTap: (){
                                    if(ActivityCubit.get(context).formKey.currentState!.validate()){
                                      if(ActivityCubit.get(context).selectCompanyVar == null ){

                                        ScaffoldMessenger.of(context).showSnackBar(
                                           SnackBar(
                                            backgroundColor:darkGrey ,
                                            content: const Text('Please enter companyName'),
                                            duration: const Duration(seconds: 2),
                                          ),
                                        );

                                      }else{
                                        ActivityCubit.get(context).addActivity();

                                      }
                                    }

                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusDirectional.circular(10.r),
                                        color: orange
                                    ),
                                    child: CustomText(text: "Add Activity", size: 16.sp, color: white, fontWeight: FontWeight.w600,alignment: Alignment.center,),
                                  ),
                                ),
                                SizedBox(height: 20.h,),
                                GestureDetector(
                                  onTap: (){
                                    ActivityCubit.get(context).titleActivity.clear();
                                    ActivityCubit.get(context).priceActivity.clear();
                                    ActivityCubit.get(context).activityEndDate.clear();
                                    ActivityCubit.get(context).activityStartDate.clear();
                                    ActivityCubit.get(context).descriptionActivity.clear();
                                    ActivityCubit.get(context).selectCompanyVar = null;
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: darkGrey),
                                      borderRadius: BorderRadiusDirectional.circular(10.r),

                                    ),
                                    child: CustomText(text: "Clear", size: 16.sp, color: orange, fontWeight: FontWeight.w600,alignment: Alignment.center,),
                                  ),
                                )
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
