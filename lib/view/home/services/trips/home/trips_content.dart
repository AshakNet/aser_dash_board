import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/constant/table/tripletable.dart';
import 'package:aser_dash_board/logic/activity_cubit/activitycubit.dart';
import 'package:aser_dash_board/logic/trips_cubit/tripe_cubit.dart';
import 'package:aser_dash_board/logic/trips_cubit/trips_state.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripsContent extends StatelessWidget {
  PageController tripleContent = PageController();
   TripsContent({super.key,required this.tripleContent});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<TripsCubit,TripsState>(
      listener: (context,state){
        if(state is PickDateBlocSSuccessfulState){
          TripsCubit.get(context).getAllTrips(skip: 0, take: 10);
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
                      CustomText(text: "Home", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w600),
                      SizedBox(width: 5.w,),
                      CustomText(text: "Trips<<", size: 12.sp, color: black, fontWeight: FontWeight.w700)
                    ],
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
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
                              const Spacer(),
                              CustomText(
                                text: "560000.00 EGP",
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
                                      value: TripsCubit.get(context).choseHours,
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
                                        TripsCubit.get(context).choseHoursFunction(val);
                                      }),
                                ),
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
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                var items = [
                                  {
                                    "image": "assets/images/home/accom.png",
                                    "title": "Hotels",
                                    "route": "accommodations",
                                    "price": " Company 600 ",
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

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(

                        padding:  EdgeInsets.symmetric(vertical: 10.h),
                        child: SizedBox(
                          width: 200.w,

                          child: Column(
                            children: [
                              CustomText(
                                  text: " Trip date",
                                  size: 16.sp,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                              TextFormField(
                                controller: TripsCubit.get(context).tripDate,
                                maxLines: 1,
                                readOnly: true,

                                onTap: (){
                                  TripsCubit.get(context).PickDate(context : context, controller:  TripsCubit.get(context).tripDate,
                                  first: DateTime(2000),
                                    lastTime: DateTime.now()
                                  );
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
                                    text: " Seats",
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
                                          value: TripsCubit.get(context).seats,
                                          hint: CustomText(text: "Tickets", size: 12.sp, color: black, fontWeight: FontWeight.w600),
                                          items: ["5", "15", "10"]
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
                                            TripsCubit.get(context)
                                                .changeseats(val);
                                            TripsCubit.get(context).getAllTrips(skip: 0, take: 10);
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
                                  text: " Addition Date",
                                  size: 16.sp,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                              TextFormField(
                                controller: TripsCubit.get(context).addtionalDate,
                                maxLines: 1,
                                readOnly: true,
                                onTap: (){
                                  TripsCubit.get(context).PickDate(context : context, controller:  TripsCubit.get(context).addtionalDate,
                                      first: DateTime(2000),
                                      lastTime: DateTime.now()
                                  );
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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 30.h),
                            child: CustomText(text: "Reset",
                              function: (){
                              TripsCubit.get(context).addtionalDate.clear();
                              TripsCubit.get(context).tripDate.clear();
                              TripsCubit.get(context).seats = null;
                              TripsCubit.get(context).getAllTrips(skip: 0, take: 10);


                              },
                              size: 18.sp, color: darkGrey, fontWeight: FontWeight.w400,textDecoration: TextDecoration.underline,),
                          ),

                        ],
                      ),






                    ],
                  ),
                ),


                Padding(

                  padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 30.w),
                  child: SizedBox(


                    child: TextFormField(
                      controller: TripsCubit.get(context).search,
                      maxLines: 1,
                      onChanged: (value){
                        TripsCubit.get(context).getAllTrips(skip: 0, take: 10);
                      },
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


                state is GetAllTripsLoading ? const Center(child: CircularProgressIndicator()) :

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 30.h),
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
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CustomText(text: "Trips", size: 20.sp, color: black, fontWeight: FontWeight.w600),
                                  SizedBox(width: 30.w,),
                                  CustomText(text: "( ${TripsCubit.get(context).getAllTripsModel!.totalCount} Trips)", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: (){
                                      tripleContent.animateToPage(5, duration: const Duration(microseconds: 100), curve: Curves.easeIn);
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


                                child: HotelDateTableTriple(triple: tripleContent,context: context,),
                              ),
                              SizedBox(height: 20.h),
                              Row(

                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      TripsCubit.get(context).scrollLeft();

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
                                      TripsCubit.get(context).scrollRight();

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
