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
      listener: (context,state){
        if(state is EndStartChooseMonth){
          CompaniesCubit.get(context).getProfitsInsightCompaines(
            CompaniesCubit.get(context).getCampnyDetailsModel!.data!.companyId.toString()
          );
        }
      },
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
                        CompaniesCubit.get(context).getAllCompany(skip: 0, take: 10);
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
                                           if (val == "January") {
                                             CompaniesCubit.get(context).fixInsight =
                                             "1";
                                           } else if (val ==
                                               "February") {
                                             CompaniesCubit.get(context).fixInsight ="2";
                                           } else if (val == "March") {
                                             CompaniesCubit.get(context).fixInsight =
                                             "2";
                                           } else if (val == "April") {
                                             CompaniesCubit.get(context).fixInsight =
                                             "4";
                                           } else if (val == "May") {
                                             CompaniesCubit.get(context).fixInsight =
                                             "5";
                                           } else if (val == "June") {
                                             CompaniesCubit.get(context).fixInsight =
                                             "6";
                                           } else if (val == "July") {
                                             CompaniesCubit.get(context).fixInsight =
                                             "7";
                                           } else if (val == "August") {
                                             CompaniesCubit.get(context).fixInsight =
                                            "8";
                                          } else if (val ==
                                               "September") {
                                             CompaniesCubit.get(context).fixInsight =
                                            "9";
                                           } else if (val == "October") {
                                             CompaniesCubit.get(context).fixInsight =
                                             "10";
                                           } else if (val ==
                                               "November") {
                                             CompaniesCubit.get(context).fixInsight =
                                             "11";
                                           } else if (val ==
                                               "December") {
                                             CompaniesCubit.get(context).fixInsight =
                                             "12";
                                           }
                                           print(CompaniesCubit.get(context)
                                               .fixInsight);
                                          CompaniesCubit.get(context)
                                              .chooseMonthFunction(val);



                                          // CompaniesCubit.get(context).chooseYears = null ;
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
                                      Row(
                                        children: [
                                          CustomText(text: "${CompaniesCubit.get(context).getInsightCompainesModel!.data!.total}", size: 20.sp, color: text, fontWeight: FontWeight.w600),
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
                                          CustomText(text: "${CompaniesCubit.get(context).getInsightCompainesModel!.data!.paid}", size: 20.sp, color: text, fontWeight: FontWeight.w600),
                                          CustomText(text: " EGP", size: 20.sp, color: text, fontWeight: FontWeight.w600),
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
                                          CustomText(text: "${CompaniesCubit.get(context).getInsightCompainesModel!.data!.pending}", size: 20.sp, color: text, fontWeight: FontWeight.w600),
                                          CustomText(text: "EGP", size: 20.sp, color: text, fontWeight: FontWeight.w600),
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
                                backgroundImage: NetworkImage(
                                    "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.logo}"),
                              ),
                              CustomText(
                                text: "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.companyName}",
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
                                    text: "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.ownerName}",
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

                                  Row(
                                    children: [
                                      CustomText(
                                        text: "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.status}",
                                        size: 14.sp,
                                        color:
                                        CompaniesCubit.get(context).getCampnyDetailsModel!.data!.status == "Restricted" ||
                                            CompaniesCubit.get(context).getCampnyDetailsModel!.data!.status == "Deleted"
                                            ? Colors.red :
                                        Colors.green,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      SizedBox(width: 20.w,),

                                      CompaniesCubit.get(context).getCampnyDetailsModel!.data!.status == "Restricted"?
                                      Row(
                                        children: [
                                          CustomText(
                                            text: "Till",
                                            size: 14.sp,
                                            color: Colors.red,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(width: 10.w,),

                                          CustomText(
                                            text: CompaniesCubit.get(context).restricted.text.trim(),
                                            size: 14.sp,
                                            color: Colors.red,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ) : SizedBox.shrink()
                                    ],
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
                                          "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.service}",
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
                                          "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.governate}",
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
                                          "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.address}",
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
                                          "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.website}",
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
                                          "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.ownerName}",
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
                                          "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.email}",
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
                                          "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.phone}",
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
