import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/constant/table/activityTable.dart';
import 'package:aser_dash_board/logic/activity_cubit/activity_state.dart';
import 'package:aser_dash_board/logic/activity_cubit/activitycubit.dart';


import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityContent extends StatelessWidget {
  PageController activity = PageController();
  ActivityContent({super.key,required this.activity});

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<ActivityCubit,ActivityState>(
      listener: (context,state){
        if(state is PickDateBlocSSuccessfulState){
          ActivityCubit.get(context).getAllActivity(skip: 0, take: 10);

        }
      },
      builder: (context,state){
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 5.h,horizontal: 20.w),
                  child: Row(
                    children: [
                      CustomText(text: "Services", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w600,),
                      SizedBox(width: 5.w,),
                      CustomText(text: "Activity<<", size: 12.sp, color: black, fontWeight: FontWeight.w700)
                    ],
                  ),
                ),

                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                          text: " Addition Date",
                          size: 16.sp,
                          color: black,
                          fontWeight: FontWeight.w600),
                      SizedBox(width: 25.w,),
                      SizedBox(
                        width: 300.w,
                        child: TextFormField(
                          controller: ActivityCubit.get(context).addtionalDate,
                          maxLines: 1,
                          readOnly: true,
                          onFieldSubmitted: (value){
                          },
                          onTap: (){
                            ActivityCubit.get(context).PickDate(context : context, controller:  ActivityCubit.get(context).addtionalDate, firstDate: DateTime.now(),lastDate: DateTime(2030));
                          },
                          validator: (value) {},
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: orange,size: 20.sp,
                              ),
                            ),
                            filled: true,
                            fillColor: white,
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
                            hintText: 'Date',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 100.w,),
                      Padding(
                        padding:  EdgeInsets.only(top: 30.h),
                        child: CustomText(text: "Reset",
                          function: (){
                            ActivityCubit.get(context).addtionalDate.clear();
                            ActivityCubit.get(context).getAllActivity(skip: 0, take: 10);
                          },
                          size: 18.sp, color: orange, fontWeight: FontWeight.w400,textDecoration: TextDecoration.underline,),
                      ),


                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(

                  padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 30.w),
                  child: SizedBox(


                    child: TextFormField(
                      controller: TextEditingController(),
                      maxLines: 1,
                      validator: (value) {},
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: darkGrey,
                          ),
                        ),
                        //filled: true,

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
                        hintText: 'search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: orange),
                        ),
                      ),
                    ),
                  ),
                ),


                state is GetAllActivityLoading  ?const Center(child: CircularProgressIndicator()) :
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 30.h),
                  child: Container(
                    height: 900.h,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadiusDirectional.circular(10.r)
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30.w),
                      child: Container(

                        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10.r),
                          color: white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CustomText(text: "Activity", size: 20.sp, color: black, fontWeight: FontWeight.w600),
                                SizedBox(width: 30.w,),
                                CustomText(text: "( ${ActivityCubit.get(context).getActivityModel!.totalCount.toString()} Activity)", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500),
                                Spacer(),
                                GestureDetector(
                                  onTap: (){
                                    activity.animateToPage(5, duration: Duration(milliseconds: 20), curve: Curves.easeIn);
                                  },
                                  child: Container(
                                    width: 90.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.r),
                                        color: orange
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                      child: Row(

                                        children: [
                                          Icon(Icons.add,color: white,),
                                          SizedBox(width: 5.w,),

                                          CustomText(text: "Add", size: 16.sp, color: white, fontWeight: FontWeight.w700,alignment: Alignment.center,),
                                        ],
                                      ),
                                    ),
                                  ),
                                )





                              ],
                            ),
                            SizedBox(height: 20.h),

                            Container(


                              child: ActivityTable(activity: activity,context: context,),
                            ),
                            SizedBox(height: 20.h),
                            Row(

                              children: [
                                GestureDetector(
                                  onTap:(){
                                    ActivityCubit.get(context).scrollLeft();

                                  },
                                  child: Container(
                                    width: 109.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusDirectional.circular(10.r),
                                        border: Border.all(
                                            color: Colors.grey.shade500
                                        )
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.keyboard_arrow_left_sharp,color : Colors.grey.shade500,),

                                        CustomText(text: "Previous", size: 14.sp, color: Colors.grey.shade500, fontWeight: FontWeight.w600,alignment: Alignment.center,),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: (){
                                    ActivityCubit.get(context).scrollRight();

                                  },
                                  child: Container(
                                    width: 80.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusDirectional.circular(10.r),
                                        border: Border.all(
                                            color: Colors.grey.shade500
                                        )
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,

                                      children: [


                                        CustomText(text: "Next", size: 14.sp, color: Colors.grey.shade500, fontWeight: FontWeight.w600,alignment: Alignment.center,),
                                        Icon(Icons.keyboard_arrow_right,color : Colors.grey.shade500,),
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
                  ),
                ),

                SizedBox(height: 20.h),



              ],
            ),
          ),
        );
      },

    );
  }
}
