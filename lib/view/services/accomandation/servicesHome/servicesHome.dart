
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/constant/table/table.dart';
import 'package:aser_dash_board/logic/AcommandtionCubit/accomandtion_Cubit.dart';
import 'package:aser_dash_board/logic/AcommandtionCubit/accomandtion_state.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeServices extends StatelessWidget {



  PageController accomandtion = PageController();


  HomeServices({super.key,required this.accomandtion});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccomandtionCubit,AccomandtionState>(
      listener: (context,state){
        if(state is GetProfitsAccomodationSuccessful){
          AccomandtionCubit.get(context).getAllAccomandtion(skip: 0, take: 10);
        }
      },
      builder: (context,state){
        var accomandtionCubit = AccomandtionCubit.get(context);
        return  Scaffold(
            body:

            SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 5.h,horizontal: 20.w),
                      child: Row(
                        children: [
                          CustomText(text: "Home", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w600),
                          SizedBox(width: 5.w,),
                          CustomText(text: "Accommodations<<", size: 12.sp, color: black, fontWeight: FontWeight.w700)
                        ],
                      ),
                    ),
                    state is GetProfitsAccomodationLoading  ?  const Center(child: CircularProgressIndicator()) :
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20.r),
                          color: white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                    text: "Total properties",
                                    size: 20.sp,
                                    color: blue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Spacer(),
                                  CustomText(
                                    text: AccomandtionCubit.get(context).getProfitModelAccomandtion!.data!.total.toString(),
                                    size: 20.sp,
                                    color: blue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
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
                                        value: AccomandtionCubit.get(context)
                                            .choosesMonthAccomandtion,
                                        hint: CustomText(
                                            text: "Month",
                                            size: 12.sp,
                                            color: darkGrey,
                                            fontWeight:
                                            FontWeight.w600),
                                        items: AccomandtionCubit.get(context)
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
                                            AccomandtionCubit.get(context).fixAccomandtion =
                                            "1";
                                          } else if (val ==
                                              "February") {
                                            AccomandtionCubit.get(context).fixAccomandtion =
                                            "2";
                                          } else if (val == "March") {
                                            AccomandtionCubit.get(context).fixAccomandtion =
                                            "2";
                                          } else if (val == "April") {
                                            AccomandtionCubit.get(context).fixAccomandtion =
                                            "4";
                                          } else if (val == "May") {
                                            AccomandtionCubit.get(context).fixAccomandtion =
                                            "5";
                                          } else if (val == "June") {
                                            AccomandtionCubit.get(context).fixAccomandtion =
                                            "6";
                                          } else if (val == "July") {
                                            AccomandtionCubit.get(context).fixAccomandtion =
                                            "7";
                                          } else if (val == "August") {
                                            AccomandtionCubit.get(context).fixAccomandtion =
                                            "8";
                                          } else if (val ==
                                              "September") {
                                            AccomandtionCubit.get(context).fixAccomandtion =
                                            "9";
                                          } else if (val == "October") {
                                            AccomandtionCubit.get(context).fixAccomandtion =
                                            "10";
                                          } else if (val ==
                                              "November") {
                                            AccomandtionCubit.get(context).fixAccomandtion =
                                            "11";
                                          } else if (val ==
                                              "December") {
                                            AccomandtionCubit.get(context).fixAccomandtion =
                                            "12";
                                          }
                                          print(AccomandtionCubit.get(context)
                                              .fixAccomandtion);
                                          AccomandtionCubit.get(context)
                                              .chooseMonthAccomandtion(val);
                                          accomandtionCubit.getProfitsAccomodation();
                                          


                                        }),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                height: 150.h,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) => SizedBox(
                                    width: 20.w,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    var items = [
                                      {
                                        "image": "assets/images/home/accom.png",
                                        "title": "Hotels",
                                        "route": "accommodations",
                                        "price": accomandtionCubit.getProfitModelAccomandtion!.data!.hotel.toString(),
                                      },
                                      {
                                        "image": "assets/images/home/product.png",
                                        "title": "Camps & Glamps",
                                        "route": "product",
                                        "price":accomandtionCubit.getProfitModelAccomandtion!.data!.camp.toString(),
                                      },
                                      {
                                        "image": "assets/images/home/activity.png",
                                        "title": "Apartments",
                                        "route": "activities",
                                        "price": accomandtionCubit.getProfitModelAccomandtion!.data!.appartment.toString(),
                                      },
                                      {
                                        "image": "assets/images/home/trips.png",
                                        "title": "Companies",
                                        "route": "trips",
                                        "price": accomandtionCubit.getProfitModelAccomandtion!.data!.company.toString(),
                                      },
                                    ];

                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, items[index]["route"]!);
                                      },
                                      child:
                                      index == 3 ? Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CustomText(text: "Companies", size: 16.sp, color: Colors.grey, fontWeight: FontWeight.w600),
                                          SizedBox(height: 10.h,),
                                          CustomText(text: "250", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w600)
                                        ],):
                                      Container(
                                        width: 242.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadiusDirectional.circular(
                                                20.r),
                                            color:
                                            Color.fromRGBO(249, 239, 233, 1)),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15.h, horizontal: 10.w),
                                              child: Row(
                                                children: [
                                                  CustomText(
                                                      text: items[index]["title"]!,
                                                      size: 12.sp,
                                                      color: darkGrey,
                                                      fontWeight: FontWeight.w600),
                                                  Spacer(),
                                                  CustomText(
                                                      text: "120%",
                                                      size: 12.sp,
                                                      color: darkGrey,
                                                      fontWeight: FontWeight.w600),
                                                  Icon(
                                                    Icons.arrow_upward,
                                                    color: Colors.green,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15.h, horizontal: 10.w),
                                              child: Row(
                                                children: [
                                                  CustomText(
                                                      text: items[index]['price']!,
                                                      size: 12.sp,
                                                      color: black,
                                                      fontWeight: FontWeight.w600),
                                                  Spacer(),
                                                  Image.asset(
                                                      items[index]['image']!)
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              children: [
                                CustomText(
                                    text: " Service status",
                                    size: 16.sp,
                                    color: black,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  width: 10.w,
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
                                          value: AccomandtionCubit.get(context).status,
                                          hint: CustomText(text: "Service status", size: 12.sp, color: black, fontWeight: FontWeight.w600),
                                          items: [
                                            "InProgress",
                                            "Rejected",
                                            "Accepted"
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
                                            AccomandtionCubit.get(context)
                                                .changeStatus(val);
                                            if(val == "InProgress"){
                                              accomandtionCubit.statusNumber = "0";

                                            }
                                            else if (val == "Rejected"){
                                              accomandtionCubit.statusNumber = "1";
                                            }
                                            else {
                                              accomandtionCubit.statusNumber = "2";

                                            }
                                            accomandtionCubit.getAllAccomandtion(skip: 0, take: 10);

                                            print(accomandtionCubit.statusNumber);
                                          }),
                                    ),
                                  ),
                                ),

                                SizedBox(width: 50.w,),

                                Padding(
                                  padding:  EdgeInsets.only(top: 30.h),
                                  child: CustomText(text: "Reset",
                                    function: (){
                                    AccomandtionCubit.get(context).status = null;
                                      AccomandtionCubit.get(context).statusNumber = null;
                                      AccomandtionCubit.get(context).getAllAccomandtion(skip: 0, take: 10);
                                    },
                                    size: 18.sp, color: orange, fontWeight: FontWeight.w400,textDecoration: TextDecoration.underline,),
                                ),
                              ],
                            ),
                          ),




                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(

                      padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 30.w),
                      child: SizedBox(


                        child: TextFormField(
                          controller: accomandtionCubit.search,
                          onChanged: (value){
                            accomandtionCubit.getAllAccomandtion(skip: 0, take: 10);
                          },
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
                            hintText: 'search by company name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(color: orange),
                            ),
                          ),
                        ),
                      ),
                    ),



                    state is GetAllAccomandtionSuccessful ?

                    Column(
                      children: [

                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.h),
                          child: Container(

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
                                        CustomText(text: "Accommodation", size: 20.sp, color: black, fontWeight: FontWeight.w600),
                                       Spacer(),
                                        CustomText(text: "(Accommodation ${accomandtionCubit.allAccomandtionModel!.totalCount.toString()} )", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500),
                                      ],
                                    ),
                                    SizedBox(height: 20.h,),

                                    Container(


                                      child: HotelDataTable(
                                        context: context,
                                        controller: accomandtion,),
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(

                                      children: [
                                        GestureDetector(
                                          onTap:(){
                                            accomandtionCubit.scrollLeft();

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
                                            accomandtionCubit.scrollRight();


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
                    ) : const Center(child: CircularProgressIndicator()) ,

                    SizedBox(height: 20.h)





                  ],

                ))
        );
      },

    );
  }
}


