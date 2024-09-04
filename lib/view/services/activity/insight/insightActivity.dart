import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/constant/table/HotelDateTableInsigthActivity.dart';
import 'package:aser_dash_board/logic/activity_cubit/activity_state.dart';
import 'package:aser_dash_board/logic/activity_cubit/activitycubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class InsightsActivityPage extends StatelessWidget {
  PageController insightsActivity = PageController();
  InsightsActivityPage({super.key,required this.insightsActivity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ActivityCubit,ActivityState>(
        listener: (context,state){},
        builder: (context,state){
          return SingleChildScrollView(
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

                            insightsActivity.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: CustomText(
                              text: "Activity<<",
                              size: 12.sp,
                              color: darkGrey,
                              fontWeight: FontWeight.w600)),
                      CustomText(
                          text: "Activity details.<<",
                          size: 12.sp,
                          color: black,
                          fontWeight: FontWeight.w700),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap:(){
                          ActivityCubit.get(context).getReview(id: ActivityCubit.get(context).getOneActivityModel!.data!.id.toString(), skip: 0, take: 10);
                          insightsActivity.animateToPage( 1,duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                          ActivityCubit.get(context).toggle(0);



                        },
                        child: Container(
                          width: 167.w,
                          height: 50.h,
                          color:ActivityCubit.get(context).change == 0 ? orange : white,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Image.asset(
                                "assets/images/home/services.png",

                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                text: "Service",
                                size: 14.sp,
                                color: black,
                                fontWeight: FontWeight.w600,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          ActivityCubit.get(context).toggle(2);


                        },
                        child: Container(
                          width: 167.w,
                          height: 50.h,
                          color: ActivityCubit.get(context).change == 2 ? orange : white,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Image.asset(
                                "assets/images/home/chart.png",
                                color: black,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                text: "Insights",
                                size: 14.sp,
                                color: black,
                                fontWeight: FontWeight.w600,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),

                /// left side
                 state is changeBackGround ? Center(child: CircularProgressIndicator()) :
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 40.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(20.r),
                                color: white
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                              child: Column(

                                children: [

                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        decoration: BoxDecoration(
                                            border:
                                            Border.all(color: darkGrey),
                                            //color: orange,
                                            borderRadius:
                                            BorderRadiusDirectional
                                                .circular(10.r)),
                                        child: DropdownButton(
                                            focusColor: lightGrey,
                                            dropdownColor: white,
                                            icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: orange,
                                                size: 30.sp),
                                            borderRadius:
                                            BorderRadius.circular(10.r),
                                            underline: SizedBox(),
                                            value: ActivityCubit.get(context)
                                                .chooseMonthInsight,
                                            hint: CustomText(
                                                text: "Month",
                                                size: 12.sp,
                                                color: darkGrey,
                                                fontWeight:
                                                FontWeight.w600),
                                            items: ActivityCubit.get(context)
                                                .month
                                                .map((e) =>
                                                DropdownMenuItem(
                                                  value: e,
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsets.only(
                                                        right:
                                                        20.w),
                                                    child: CustomText(
                                                        text: e,
                                                        color: orange,
                                                        fontWeight:
                                                        FontWeight
                                                            .w700,
                                                        size: 16.sp),
                                                  ),
                                                ))
                                                .toList(),
                                            onChanged: (val) {
                                              if (val == "January") {
                                                ActivityCubit.get(context).fixInsight =
                                                "1";
                                              } else if (val ==
                                                  "February") {
                                                ActivityCubit.get(context).fixInsight =
                                                "2";
                                              } else if (val == "March") {
                                                ActivityCubit.get(context).fixInsight =
                                                "2";
                                              } else if (val == "April") {
                                                ActivityCubit.get(context).fixInsight =
                                                "4";
                                              } else if (val == "May") {
                                                ActivityCubit.get(context).fixInsight =
                                                "5";
                                              } else if (val == "June") {
                                                ActivityCubit.get(context).fixInsight =
                                                "6";
                                              } else if (val == "July") {
                                                ActivityCubit.get(context).fixInsight =
                                                "7";
                                              } else if (val == "August") {
                                                ActivityCubit.get(context).fixInsight =
                                                "8";
                                              } else if (val ==
                                                  "September") {
                                                ActivityCubit.get(context).fixInsight =
                                                "9";
                                              } else if (val == "October") {
                                                ActivityCubit.get(context).fixInsight =
                                                "10";
                                              } else if (val ==
                                                  "November") {
                                                ActivityCubit.get(context).fixInsight =
                                                "11";
                                              } else if (val ==
                                                  "December") {
                                                ActivityCubit.get(context).fixInsight =
                                                "12";
                                              }
                                              print(ActivityCubit.get(context)
                                                  .fixInsight);
                                              ActivityCubit.get(context)
                                                  .chooseMonthActivityInsight(val);
                                              ActivityCubit.get(context).getProfitsInsightActivity(
                                                  ActivityCubit.get(context).getOneActivityModel!.data!.id.toString()
                                              );



                                            }),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 60.h,),
                                  Column(
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              CustomText(
                                                text: '${ActivityCubit.get(context).getInsightActivityModel!.data!.bookingstatus!.total}',
                                                size: 20.sp,
                                                color: black,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              CustomText(
                                                text: 'Total Bookings',
                                                size: 14.sp,
                                                color: darkGrey,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 120.sp,
                                            height: 120.sp,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 10.w,
                                              color: orange,
                                              value: 0.33,
                                              backgroundColor: black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 100.h,),
                                  Row(
                                    children: [
                                      Icon(Icons.circle,size: 8.sp,color: orange,),
                                      SizedBox(width: 15.w,),
                                      CustomText(
                                        text: 'Pending',
                                        size: 16.sp,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      Spacer(),
                                      CustomText(
                                        text: '${ActivityCubit.get(context).getInsightActivityModel!.data!.bookingstatus!.pending}',
                                        size: 16.sp,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      ),

                                    ],
                                  ),
                                  Divider(color: Colors.grey.shade400,),
                                  Row(
                                    children: [
                                      Icon(Icons.circle,size: 8.sp,color: Colors.brown,),
                                      SizedBox(width: 15.w,),
                                      CustomText(
                                        text: 'upComing',
                                        size: 16.sp,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      Spacer(),
                                      CustomText(
                                        text: '${ActivityCubit.get(context).getInsightActivityModel!.data!.bookingstatus!.upComming}',
                                        size: 16.sp,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      ),

                                    ],
                                  ),
                                  Divider(color: Colors.grey.shade400,),
                                  Row(
                                    children: [
                                      Icon(Icons.circle,size: 8.sp,color: Colors.greenAccent,),
                                      SizedBox(width: 15.w,),
                                      CustomText(
                                        text: 'Cancelled',
                                        size: 16.sp,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      Spacer(),
                                      CustomText(
                                        text: '${ActivityCubit.get(context).getInsightActivityModel!.data!.bookingstatus!.cancelled}',
                                        size: 16.sp,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      ),

                                    ],
                                  ),
                                  Divider(color: Colors.grey.shade400,),
                                  Row(
                                    children: [
                                      Icon(Icons.circle,size: 8.sp,color: Colors.green,),
                                      SizedBox(width: 15.w,),
                                      CustomText(
                                        text: 'Completed',
                                        size: 16.sp,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      Spacer(),
                                      CustomText(
                                        text: '${ActivityCubit.get(context).getInsightActivityModel!.data!.bookingstatus!.completed}',
                                        size: 16.sp,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      ),

                                    ],
                                  ),

                                ],
                              ),
                            ),
                          )),

                          SizedBox(width: 30.w),

                          Expanded(
                              flex: 2,
                              child: Column(
                                children: [

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: white,
                                            borderRadius: BorderRadiusDirectional.circular(20.r)
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.h),
                                          child: Column(children: [
                                            CustomText(text: "Price", size: 32.sp, color: black, fontWeight: FontWeight.w600),
                                            SizedBox(height: 30.h,),
                                            Row(
                                              children: [
                                                CustomText(text: "${ActivityCubit.get(context).getInsightActivityModel!.data!.price}", size: 24.sp, color: orange, fontWeight: FontWeight.w600),
                                                SizedBox(width: 5.w,),
                                                CustomText(text: "EGP", size: 24.sp, color: black, fontWeight: FontWeight.w600),
                                                SizedBox(width: 2.w,),
                                                CustomText(text: "Person / ", size: 28.sp, color: darkGrey, fontWeight: FontWeight.w600),


                                              ],
                                            ),


                                          ],),
                                        ),
                                      ),

                                      SizedBox(width: 30.w,),

                                      Container(
                                        decoration: BoxDecoration(
                                            color: white,
                                            borderRadius: BorderRadiusDirectional.circular(20.r)
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.h),
                                          child: Column(children: [
                                            CustomText(text: "Duration", size: 32.sp, color: black, fontWeight: FontWeight.w600),
                                            SizedBox(height: 30.h,),
                                            Row(
                                              children: [
                                                CustomText(text: "${ActivityCubit.get(context).getInsightActivityModel!.data!.duration}", size: 24.sp, color: orange, fontWeight: FontWeight.w600),
                                                SizedBox(width: 5.w,),
                                                CustomText(text: "days", size: 24.sp, color: black, fontWeight: FontWeight.w600),



                                              ],
                                            ),


                                          ],),
                                        ),
                                      ),

                                    ],

                                  ),
                                  SizedBox(height: 40.h,),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadiusDirectional.circular(20.r)
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.h),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              CustomText(text: "Activity Revenue", size: 20.sp, color: black, fontWeight: FontWeight.w600)
                                            ],
                                          ),
                                          SizedBox(height: 40.h,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  Image.asset("assets/images/home/room.png"),
                                                  Row(
                                                    children: [
                                                      CustomText(text: "${ActivityCubit.get(context).getInsightActivityModel!.data!.revenue!.total}", size: 20.sp, color: text, fontWeight: FontWeight.w600),
                                                      CustomText(text: "EGP", size: 20.sp, color: text, fontWeight: FontWeight.w600),
                                                    ],
                                                  ),
                                                  CustomText(text: "Total Balance", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500)

                                                ],
                                              ),
                                              SizedBox(width: 80.w,),
                                              Column(
                                                children: [
                                                  Image.asset("assets/images/home/aval.png"),
                                                  Row(
                                                    children: [
                                                      CustomText(text: "${ActivityCubit.get(context).getInsightActivityModel!.data!.revenue!.paid}", size: 20.sp, color: text, fontWeight: FontWeight.w600),
                                                      CustomText(text: "EGP", size: 20.sp, color: text, fontWeight: FontWeight.w600),
                                                    ],
                                                  ),
                                                  CustomText(text: "Paid Balance", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500)

                                                ],
                                              ),
                                              SizedBox(width: 80.w,),
                                              Column(
                                                children: [
                                                  Image.asset("assets/images/home/aval.png"),
                                                  Row(
                                                    children: [
                                                      CustomText(text: "${ActivityCubit.get(context).getInsightActivityModel!.data!.revenue!.pending}", size: 20.sp, color: text, fontWeight: FontWeight.w600),
                                                      CustomText(text: " EGP", size: 20.sp, color: text, fontWeight: FontWeight.w600),
                                                    ],
                                                  ),
                                                  CustomText(text: "Pending Balance", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500)

                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),


                                ],
                              )

                          )
                        ],
                      ),

                    ],
                  ),
                )


              ],
            ),
          );
        },


      ),
    );
  }
}
