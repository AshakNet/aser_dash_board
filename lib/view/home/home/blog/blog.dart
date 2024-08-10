import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/constant/table/table_Advertisement.dart';
import 'package:aser_dash_board/logic/home/home_cubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Blog extends StatelessWidget {
  PageController blog = PageController();
   Blog({super.key,required this.blog});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
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
                                    value: HomeCubit.get(context).choseHours,
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
                                      HomeCubit.get(context).choseHoursFunction(val);
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
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              var items = [
                                {
                                  "image": "assets/images/home/accom.png",
                                  "title": "Accommodation",
                                  "route": "accommodations",
                                  "price": "40000.00 EGP",
                                },
                                {
                                  "image": "assets/images/home/product.png",
                                  "title": "Products",
                                  "route": "product",
                                  "price": "52222.00 EGP",
                                },
                                {
                                  "image": "assets/images/home/activity.png",
                                  "title": "Activities",
                                  "route": "activities",
                                  "price": "60000.00 EGP",
                                },
                                {
                                  "image": "assets/images/home/trips.png",
                                  "title": "Trips",
                                  "route": "trips",
                                  "price": "70000.00 EGP",
                                },
                              ];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, items[index]["route"]!);
                                },
                                child: Container(
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
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap:(){
                        blog.animateToPage(0,duration: Duration(milliseconds: 60), curve: Curves.easeIn);
                      },
                      child: Container(
                        width: 167.w,
                        height: 50.h,
                        color: orange,
                        child: CustomText(
                          text: "Advertisments",
                          size: 14.sp,
                          color: white,
                          fontWeight: FontWeight.w600,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Container(
                      width: 167.w,
                      height: 50.h,
                      color: white,
                      child: CustomText(
                        text: "Blogs",
                        size: 14.sp,
                        color: black,
                        fontWeight: FontWeight.w600,
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
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
                                  text: "Advertisement  Type",
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
                                        value: HomeCubit.get(context).choseHours,
                                        hint: CustomText(text: "Advertisement  Type", size: 12.sp, color: black, fontWeight: FontWeight.w600),
                                        items: [
                                          "22-4-2024",
                                          "24-6-2569",
                                          "4-4-2024"
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
                                          HomeCubit.get(context)
                                              .choseHoursFunction(val);
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
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              CustomText(
                                  text: "Start Date",
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
                                        value: HomeCubit.get(context).choseHours,
                                        hint: CustomText(text: "Date", size: 12.sp, color: black, fontWeight: FontWeight.w600),
                                        items: [
                                          "22-4-2024",
                                          "24-6-2569",
                                          "4-4-2024"
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
                                          HomeCubit.get(context)
                                              .choseHoursFunction(val);
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
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              CustomText(
                                  text: "End date",
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
                                        value: HomeCubit.get(context).choseHours,
                                        hint: CustomText(text: "Date", size: 12.sp, color: black, fontWeight: FontWeight.w600),
                                        items: [
                                          "22-4-2024",
                                          "24-6-2569",
                                          "4-4-2024"
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
                                          HomeCubit.get(context)
                                              .choseHoursFunction(val);
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
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              CustomText(
                                  text: "Status",
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
                                        value: HomeCubit.get(context).choseHours,
                                        hint: CustomText(text: "Status", size: 12.sp, color: black, fontWeight: FontWeight.w600),
                                        items: [
                                          "22-4-2024",
                                          "24-6-2569",
                                          "4-4-2024"
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
                                          HomeCubit.get(context)
                                              .choseHoursFunction(val);
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
                      padding:  EdgeInsets.only(top: 30.h),
                      child: CustomText(text: "Reset", size: 18.sp, color: darkGrey, fontWeight: FontWeight.w400,textDecoration: TextDecoration.underline,),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 30.h),
                      child: Container(
                        width: 90.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20.r),
                          color: orange,
                        ),

                        child: CustomText(text: "Search", size: 18.sp, color: white, fontWeight: FontWeight.w400,alignment: Alignment.center,)
                        ,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
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
                          CustomText(text: "Blog", size: 20.sp, color: black, fontWeight: FontWeight.w600),
                          SizedBox(width: 30.w,),
                          CustomText(text: "( 30 Blog)", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500),
                          const Spacer(),
                          GestureDetector(
                            onTap: (){
                              blog.animateToPage(4, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                            },
                            child: Container(
                              width: 80.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.circular(10.r),
                                  color: orange
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add,color: white,),
                                  CustomText(text: "Add", size: 16.sp, color: white, fontWeight: FontWeight.w600),


                                ],
                              ),
                            ),
                          ),



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
                          child: HotelAccomandtion(controller: blog,))



                    ],
                  ),
                ),
              ),


            ],
          )),
    );
  }
}
