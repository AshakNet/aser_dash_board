import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/compaines/compaines_state/compaines_state.dart';
import 'package:aser_dash_board/logic/compaines/compines_cubit/companies_Cubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InsightCompanies extends StatelessWidget {
  PageController insightCompaines = PageController();
   InsightCompanies({super.key,required this.insightCompaines});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompaniesCubit,CompaniesState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: Column(
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
                      onTap: (){
                        insightCompaines.animateToPage(0, duration: const Duration(microseconds: 30), curve: Curves.easeIn);
                      },
                      child: CustomText(
                          text: "Companies<<",
                          size: 12.sp,
                          color: darkGrey,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomText(
                        text: "Al Amal company<<",
                        size: 12.sp,
                        color: black,
                        fontWeight: FontWeight.w700),
                  ],
                ),
              ),

              SizedBox(height: 40.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  children: [

                    GestureDetector(
                      onTap:(){
                        CompaniesCubit.get(context).toggle(0);
                        insightCompaines.animateToPage(1, duration: const Duration(milliseconds: 30), curve: Curves.easeIn);

                      },
                      child: Container(
                        width: 167.w,
                        height: 50.h,
                        color:CompaniesCubit.get(context).change == 0 ? orange : white
                        ,
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
                        insightCompaines.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.easeIn);

                        CompaniesCubit.get(context).toggle(2);

                      },
                      child: Container(
                        width: 167.w,
                        height: 50.h,
                        color: CompaniesCubit.get(context).change == 2 ? orange : white,
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

                    GestureDetector(
                      onTap: (){
                        insightCompaines.animateToPage(3, duration: Duration(milliseconds: 30), curve: Curves.easeIn);
                        //companyDetails.animateToPage(4, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                        CompaniesCubit.get(context).toggle(1);


                      },
                      child: Container(
                        width: 167.w,
                        height: 50.h,
                        color:  CompaniesCubit.get(context).change == 1 ? orange : white,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            Image.asset(
                              "assets/images/home/notification.png",
                              color: black,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            CustomText(
                              text: "Notifications",
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
              SizedBox(height: 40.h,),


              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 50.w),
                child: Row(
                  children: [
                    Expanded(
                      flex:60,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(15.r),
                          color: white,
                        ),
                        height: 600.h,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical: 30.h,horizontal: 30.w ),
                          child: Column(
                            children: [
                              CustomText(text: "Services Revenue", size: 20.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                              SizedBox(height: 40.h,),
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
                                        value: CompaniesCubit.get(context)
                                            .choosesMonth,
                                        hint: CustomText(
                                            text: "Month",
                                            size: 12.sp,
                                            color: darkGrey,
                                            fontWeight:
                                            FontWeight.w600),
                                        items: CompaniesCubit.get(context)
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
                                          // if (val == "January") {
                                          //   HomeCubit.get(context).fix =
                                          //   "1";
                                          // } else if (val ==
                                          //     "February") {
                                          //   HomeCubit.get(context).fix =
                                          //   "2";
                                          // } else if (val == "March") {
                                          //   HomeCubit.get(context).fix =
                                          //   "2";
                                          // } else if (val == "April") {
                                          //   HomeCubit.get(context).fix =
                                          //   "4";
                                          // } else if (val == "May") {
                                          //   HomeCubit.get(context).fix =
                                          //   "5";
                                          // } else if (val == "June") {
                                          //   HomeCubit.get(context).fix =
                                          //   "6";
                                          // } else if (val == "July") {
                                          //   HomeCubit.get(context).fix =
                                          //   "7";
                                          // } else if (val == "August") {
                                          //   HomeCubit.get(context).fix =
                                          //   "8";
                                          // } else if (val ==
                                          //     "September") {
                                          //   HomeCubit.get(context).fix =
                                          //   "9";
                                          // } else if (val == "October") {
                                          //   HomeCubit.get(context).fix =
                                          //   "10";
                                          // } else if (val ==
                                          //     "November") {
                                          //   HomeCubit.get(context).fix =
                                          //   "11";
                                          // } else if (val ==
                                          //     "December") {
                                          //   HomeCubit.get(context).fix =
                                          //   "12";
                                          // }
                                          // print(HomeCubit.get(context)
                                          //     .fix);
                                          CompaniesCubit.get(context)
                                              .chooseMonthFunction(val);
                                          // HomeCubit.get(context)
                                          //     .getSystemProfits();

                                          // HomeCubit.get(context).chooseYears = null ;
                                        }),
                                  ),
                                ],
                              ),
                              SizedBox(height: 100.h,),
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
                    ),
                    SizedBox(width: 50.w,),
                    Expanded(
                      flex: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(15.r),
                          color: white,
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical: 20.h),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/images/home/pesrson.png"),
                              ),
                              CustomText(
                                text: "Al Amal Company",
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
                                    text: "mahmoud",
                                    size: 14.sp,
                                    color: black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  CustomText(
                                    text: "(Owner)",
                                    size: 14.sp,
                                    color: darkGrey,
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
                                    text: "Active",
                                    size: 14.sp,
                                    color: Colors.green,
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
                                  Container(
                                    width: 120.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadiusDirectional.circular(
                                            10.r),
                                        border: Border.all(color: darkGrey)),
                                    child: CustomText(
                                      text: "Delete  ",
                                      size: 16.sp,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Container(
                                    width: 120.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadiusDirectional.circular(
                                            10.r),
                                        border: Border.all(color: darkGrey)),
                                    child: CustomText(
                                      text: "Restrict ",
                                      size: 16.sp,
                                      color: black,
                                      fontWeight: FontWeight.w600,
                                      alignment: Alignment.center,
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 20.h,),
                              Column(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(text: "Company profile", size: 20.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                  ),
                                  SizedBox(height: 30.h,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Row(

                                      children: [
                                        CustomText(
                                          text:
                                          " : Service",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                        SizedBox(width: 10.h,),

                                        CustomText(
                                          text:
                                          "Accommodation",
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
                                          " : Governate ",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                        SizedBox(width: 10.h,),

                                        CustomText(
                                          text:
                                          "Cairo",
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
                                          " : Address",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                        SizedBox(width: 10.h,),

                                        CustomText(
                                          text:
                                          "Address",
                                          size: 14.sp,
                                          color: orange,
                                          textDecoration: TextDecoration.underline,
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
                                          " : Website ",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                        SizedBox(width: 10.h,),

                                        CustomText(
                                          text:
                                          "Website",
                                          size: 14.sp,
                                          color: orange,
                                          textDecoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w400,alignment: Alignment.centerRight,),


                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 20.h,),
                              /// owner profile
                              Column(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(text: "Owner profile", size: 20.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                  ),
                                  SizedBox(height: 30.h,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Row(

                                      children: [
                                        CustomText(
                                          text:
                                          " : Name ",
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
                                          " : Email Address",
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
                                          " : Phone number",
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

                                ],
                              )

                            ],
                          ),
                        ),

                      ),
                    )
                  ],
                ),
              )

            ],
          ),
        );
      },

    );
  }
}
