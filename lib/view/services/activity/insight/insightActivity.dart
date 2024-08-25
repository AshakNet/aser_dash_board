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
                          insightsActivity.animateToPage(3, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                          ActivityCubit.get(context).toggle(1);


                        },
                        child: Container(
                          width: 167.w,
                          height: 50.h,
                          color:  ActivityCubit.get(context).change == 1 ? orange : white,

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
                                text: "Orders",
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
                                        width: 80.w,
                                        height: 45.h,
                                        decoration: BoxDecoration(
                                            color: lightGrey,
                                            borderRadius:
                                            BorderRadiusDirectional.circular(10.r)),
                                        child: CustomText(
                                          text: "Yearly",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w600,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Container(
                                        width: 80.w,
                                        height: 45.h,
                                        decoration: BoxDecoration(
                                            color: orange,
                                            borderRadius:
                                            BorderRadiusDirectional.circular(10.r)),
                                        child: CustomText(
                                          text: "Monthly",
                                          size: 14.sp,
                                          color: white,
                                          fontWeight: FontWeight.w600,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: orange),
                                            borderRadius: BorderRadiusDirectional.circular(15.r)
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 5.w),
                                          child: DropdownButton(


                                              focusColor: lightGrey,
                                              dropdownColor: white,
                                              icon: Icon(Icons.keyboard_arrow_down, color: orange, size: 30.sp),
                                              borderRadius: BorderRadius.circular(10.r),

                                              underline: SizedBox(),
                                              value: ActivityCubit.get(context).choseHours,
                                              hint:CustomText(text:  "يناير", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w600),
                                              //ExamCubit.get(context).choseHours,
                                              items: [ "ديسمبر","نوقمبر","اكتوبر","ابريل","مارس",'يناير'].map((e) =>
                                                  DropdownMenuItem(

                                                    value: e,
                                                    child: Padding(
                                                      padding:  EdgeInsets.only(right: 20.w),
                                                      child: CustomText(text: e,color: orange,fontWeight: FontWeight.w700,size: 16.sp),
                                                    ),)
                                              ).toList(),
                                              onChanged: (val){
                                                ActivityCubit.get(context).choseHoursFunction(val);
                                              }),
                                        ),
                                      ),
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
                                                text: '200 ',
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
                                        text: 'Confirmed',
                                        size: 16.sp,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      Spacer(),
                                      CustomText(
                                        text: '150',
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
                                        text: 'Pending',
                                        size: 16.sp,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      Spacer(),
                                      CustomText(
                                        text: '150',
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
                                        text: 'Declined',
                                        size: 16.sp,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      Spacer(),
                                      CustomText(
                                        text: '18',
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
                                        text: '15',
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
                                                CustomText(text: "500", size: 24.sp, color: orange, fontWeight: FontWeight.w600),
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
                                                CustomText(text: "5", size: 24.sp, color: orange, fontWeight: FontWeight.w600),
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
                                                  CustomText(text: "8500.00 EGP", size: 20.sp, color: text, fontWeight: FontWeight.w600),
                                                  CustomText(text: "Total Balance", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500)

                                                ],
                                              ),
                                              SizedBox(width: 80.w,),
                                              Column(
                                                children: [
                                                  Image.asset("assets/images/home/aval.png"),
                                                  CustomText(text: "2500.00 EGP", size: 20.sp, color: text, fontWeight: FontWeight.w600),
                                                  CustomText(text: "Paid Balance", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500)

                                                ],
                                              ),
                                              SizedBox(width: 80.w,),
                                              Column(
                                                children: [
                                                  Image.asset("assets/images/home/aval.png"),
                                                  CustomText(text: "6000.00 EGP", size: 20.sp, color: text, fontWeight: FontWeight.w600),
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
                      ///
                      SizedBox(height: 30.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 0.w,vertical: 30.h),
                        child: Container(
                          height: 900.h,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadiusDirectional.circular(10.r)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 0.w),
                            child: Container(

                              padding: EdgeInsets.symmetric(horizontal: 0.w,vertical: 10.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(10.r),
                                color: white,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomText(text: "Guests Bookings", size: 20.sp, color: black, fontWeight: FontWeight.w600),
                                      SizedBox(width: 30.w,),
                                      CustomText(text: "( 196 Guest)", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500),




                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  Padding(

                                    padding:  EdgeInsets.symmetric(vertical: 10.h),
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
                                  SizedBox(height: 20.h),
                                  Container(
                                    width: double.infinity,

                                    child: HotelDateTableInsigthActivity( activity:  insightsActivity),
                                  ),
                                  SizedBox(height: 20.h),
                                  Row(

                                    children: [
                                      GestureDetector(
                                        onTap:(){

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
