import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/constant/table/orderTableActivity.dart';
import 'package:aser_dash_board/logic/activity_cubit/activity_state.dart';
import 'package:aser_dash_board/logic/activity_cubit/activitycubit.dart';


import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderActivity extends StatelessWidget {
  PageController orderActivity = PageController();
  OrderActivity({super.key,required this.orderActivity});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                            orderActivity.animateToPage(0,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);

                          },
                          child: CustomText(
                              text: "Activity<<",
                              size: 12.sp,
                              color: darkGrey,
                              fontWeight: FontWeight.w600)),
                      CustomText(
                          text: "The grand Egyptian Museum.<<",
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

                          orderActivity.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
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
                                color: black,
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
                          orderActivity.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
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
                  height: 50.h,
                ),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                CustomText(
                                    text: "Type",
                                    size: 16.sp,
                                    color: black,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(

                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadiusDirectional.circular(10.r)
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
                                          value: ActivityCubit.get(context).accomandtionType,
                                          hint: CustomText(text: "Type", size: 12.sp, color: black, fontWeight: FontWeight.w600),
                                          items: [
                                            "Camp",
                                            "Hotel",
                                            "apertment"
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
                                            ActivityCubit.get(context)
                                                .changeAccomandtionype(val);
                                          }),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),



                      Padding(

                        padding:  EdgeInsets.symmetric(vertical: 10.h),
                        child: SizedBox(
                          width: 200.w,

                          child: Column(
                            children: [
                              CustomText(
                                  text: " Order Date",
                                  size: 16.sp,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                              TextFormField(
                                controller: ActivityCubit.get(context).addtionalDate,
                                maxLines: 1,
                                readOnly: true,
                                onTap: (){
                                  //ActivityCubit.get(context).PickDate(context, ActivityCubit.get(context).addtionalDate);
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
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                CustomText(
                                    text: "  Order Status",
                                    size: 16.sp,
                                    color: black,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(

                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadiusDirectional.circular(10.r)
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
                                          hint: CustomText(text: "Service status", size: 12.sp, color: black, fontWeight: FontWeight.w600),
                                          items: [
                                            "panding",
                                            "active",
                                            "complete"
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
                                            ActivityCubit.get(context)
                                                .changeStatus(val);
                                          }),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: 20.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 30.h),
                            child: CustomText(text: "Reset", size: 18.sp, color: darkGrey, fontWeight: FontWeight.w400,textDecoration: TextDecoration.underline,),
                          ),
                          SizedBox(width: 10.w,),
                          Padding(
                            padding:  EdgeInsets.only(top: 30.h,right: 20.w,left: 20.w),
                            child: Container(
                              width: 120.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(10.r),
                                color: orange,
                              ),

                              child: CustomText(text: "Search", size: 18.sp, color: white, fontWeight: FontWeight.w400,alignment: Alignment.center,)
                              ,
                            ),
                          )
                        ],
                      ),



                    ],
                  ),
                ),

                SizedBox(
                  height: 50.h,
                ),

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
                                CustomText(text: "( 30 Product)", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500),




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


                              child: OrderTableActivity(orderActivity: orderActivity,),
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
          );
        },
      ),
    );
  }
}
