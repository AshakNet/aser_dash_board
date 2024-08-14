import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/constant/table/table_Advertisement.dart';
import 'package:aser_dash_board/logic/home/home_cubit.dart';
import 'package:aser_dash_board/logic/home/home_state.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeMain extends StatelessWidget {
  PageController controller = PageController();

  HomeMain({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: state is GetSystemProfitsLoading ||
                  state is GetBlogLoading ||
                  state is GetAllBlogLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                  children: [
                    Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 30.h, horizontal: 30.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(20.r),
                                  color: white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 20.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            text: HomeCubit.get(context)
                                                .systemProfit!
                                                .data!
                                                .total
                                                .toString(),
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
                                                value: HomeCubit.get(context)
                                                    .choosesMonth,
                                                hint: CustomText(
                                                    text: "Month",
                                                    size: 12.sp,
                                                    color: darkGrey,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                items: HomeCubit.get(context)
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
                                                    HomeCubit.get(context).fix =
                                                        "1";
                                                  } else if (val ==
                                                      "February") {
                                                    HomeCubit.get(context).fix =
                                                        "2";
                                                  } else if (val == "March") {
                                                    HomeCubit.get(context).fix =
                                                        "2";
                                                  } else if (val == "April") {
                                                    HomeCubit.get(context).fix =
                                                        "4";
                                                  } else if (val == "May") {
                                                    HomeCubit.get(context).fix =
                                                        "5";
                                                  } else if (val == "June") {
                                                    HomeCubit.get(context).fix =
                                                        "6";
                                                  } else if (val == "July") {
                                                    HomeCubit.get(context).fix =
                                                        "7";
                                                  } else if (val == "August") {
                                                    HomeCubit.get(context).fix =
                                                        "8";
                                                  } else if (val ==
                                                      "September") {
                                                    HomeCubit.get(context).fix =
                                                        "9";
                                                  } else if (val == "October") {
                                                    HomeCubit.get(context).fix =
                                                        "10";
                                                  } else if (val ==
                                                      "November") {
                                                    HomeCubit.get(context).fix =
                                                        "11";
                                                  } else if (val ==
                                                      "December") {
                                                    HomeCubit.get(context).fix =
                                                        "12";
                                                  }
                                                  print(HomeCubit.get(context)
                                                      .fix);
                                                  HomeCubit.get(context)
                                                      .chooseMonthFunction(val);
                                                  HomeCubit.get(context)
                                                      .getSystemProfits();

                                                  // HomeCubit.get(context).chooseYears = null ;
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
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                            width: 20.w,
                                          ),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 4,
                                          itemBuilder: (context, index) {
                                            var items = [
                                              {
                                                "image":
                                                    "assets/images/home/accom.png",
                                                "title": "Accommodation",
                                                "route": "accommodations",
                                                "price": HomeCubit.get(context)
                                                    .systemProfit!
                                                    .data!
                                                    .accomodation
                                                    .toString(),
                                              },
                                              {
                                                "image":
                                                    "assets/images/home/product.png",
                                                "title": "Products",
                                                "route": "product",
                                                "price": HomeCubit.get(context)
                                                    .systemProfit!
                                                    .data!
                                                    .product
                                                    .toString(),
                                              },
                                              {
                                                "image":
                                                    "assets/images/home/activity.png",
                                                "title": "Activities",
                                                "route": "activities",
                                                "price": HomeCubit.get(context)
                                                    .systemProfit!
                                                    .data!
                                                    .activity
                                                    .toString(),
                                              },
                                              {
                                                "image":
                                                    "assets/images/home/trips.png",
                                                "title": "Trips",
                                                "route": "trips",
                                                "price": HomeCubit.get(context)
                                                    .systemProfit!
                                                    .data!
                                                    .trip
                                                    .toString(),
                                              },
                                            ];
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    items[index]["route"]!);
                                              },
                                              child: Container(
                                                width: 242.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadiusDirectional
                                                            .circular(20.r),
                                                    color: Color.fromRGBO(
                                                        249, 239, 233, 1)),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 15.h,
                                                              horizontal: 10.w),
                                                      child: Row(
                                                        children: [
                                                          CustomText(
                                                              text: items[index]
                                                                  ["title"]!,
                                                              size: 12.sp,
                                                              color: darkGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 15.h,
                                                              horizontal: 10.w),
                                                      child: Row(
                                                        children: [
                                                          CustomText(
                                                              text: items[index]
                                                                  ['price']!,
                                                              size: 12.sp,
                                                              color: black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                          Spacer(),
                                                          Image.asset(
                                                              items[index]
                                                                  ['image']!)
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
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: Row(
                                children: [
                                  Container(
                                    width: 167.w,
                                    height: 50.h,
                                    color: orange,
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
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            CustomText(
                                                text: "Blog  Type ",
                                                size: 16.sp,
                                                color: black,
                                                fontWeight: FontWeight.w600),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .circular(10.r)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.w),
                                                child: SizedBox(
                                                  width: 150.w,
                                                  child: DropdownButton(
                                                      menuMaxHeight: 200.0,
                                                      isExpanded: true,
                                                      focusColor: white,
                                                      dropdownColor: white,
                                                      icon: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down,
                                                              color: orange,
                                                              size: 30.sp)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      underline: SizedBox(),
                                                      value:
                                                          HomeCubit.get(context)
                                                              .chosseTypeBlog,
                                                      hint: CustomText(
                                                          text: "Blog  Type",
                                                          size: 12.sp,
                                                          color: darkGrey,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      items: HomeCubit.get(
                                                              context)
                                                          .blogTypeModel!
                                                          .data
                                                          ?.map((e) =>
                                                              DropdownMenuItem(
                                                                value: e.name,
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              20.w),
                                                                  child:
                                                                      CustomText(
                                                                    text: e.name
                                                                        .toString(),
                                                                    color:
                                                                        orange,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    size: 14.sp,
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                  ),
                                                                ),
                                                              ))
                                                          .toList(),
                                                      onChanged: (val) {
                                                        HomeCubit.get(context)
                                                            .chhoseBlogType(
                                                                val!);
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
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: SizedBox(
                                      width: 200.w,
                                      child: Column(
                                        children: [
                                          CustomText(
                                              text: " Start date",
                                              size: 16.sp,
                                              color: black,
                                              fontWeight: FontWeight.w600),
                                          TextFormField(
                                            controller: HomeCubit.get(context)
                                                .addtionalDate,
                                            maxLines: 1,
                                            readOnly: true,
                                            onTap: () {
                                              HomeCubit.get(context).PickDate(
                                                  context,
                                                  HomeCubit.get(context)
                                                      .addtionalDate);
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
                                                  color: orange,
                                                  size: 20.sp,
                                                ),
                                              ),
                                              filled: true,
                                              fillColor: white,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
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
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: SizedBox(
                                      width: 200.w,
                                      child: Column(
                                        children: [
                                          CustomText(
                                              text: " End date",
                                              size: 16.sp,
                                              color: black,
                                              fontWeight: FontWeight.w600),
                                          TextFormField(
                                            controller:
                                                HomeCubit.get(context).endDate,
                                            maxLines: 1,
                                            readOnly: true,
                                            onTap: () {
                                              HomeCubit.get(context).PickDate(
                                                  context,
                                                  HomeCubit.get(context)
                                                      .endDate);
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
                                                  color: orange,
                                                  size: 20.sp,
                                                ),
                                              ),
                                              filled: true,
                                              fillColor: white,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
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
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                borderSide: BorderSide.none,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
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
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .circular(10.r)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.w),
                                                child: SizedBox(
                                                  width: 150.w,
                                                  child: DropdownButton(
                                                      menuMaxHeight: 200.0,
                                                      isExpanded: true,
                                                      focusColor: white,
                                                      dropdownColor: white,
                                                      icon: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down,
                                                              color: orange,
                                                              size: 30.sp)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      underline: SizedBox(),
                                                      value:
                                                          HomeCubit.get(context)
                                                              .status,
                                                      hint: CustomText(
                                                          text: "Status",
                                                          size: 12.sp,
                                                          color: darkGrey,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      items: [
                                                        "Active",
                                                        "Inactive",
                                                      ]
                                                          .map((e) =>
                                                              DropdownMenuItem(
                                                                value: e,
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              20.w),
                                                                  child:
                                                                      CustomText(
                                                                    text: e,
                                                                    color:
                                                                        orange,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    size: 14.sp,
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                  ),
                                                                ),
                                                              ))
                                                          .toList(),
                                                      onChanged: (val) {
                                                        if (val == "Active") {
                                                          HomeCubit.get(context)
                                                                  .statusConvert =
                                                              "0";
                                                          print(HomeCubit.get(
                                                                  context)
                                                              .statusConvert);
                                                        } else if (val ==
                                                            "Inactive") {
                                                          HomeCubit.get(context)
                                                                  .statusConvert =
                                                              "1";
                                                          print(HomeCubit.get(
                                                                  context)
                                                              .statusConvert);
                                                        }
                                                        HomeCubit.get(context)
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
                                  Padding(
                                    padding: EdgeInsets.only(top: 30.h),
                                    child: CustomText(
                                      text: "Reset",
                                      size: 18.sp,
                                      color: darkGrey,
                                      fontWeight: FontWeight.w400,
                                      textDecoration: TextDecoration.underline,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 30.h),
                                    child: Container(
                                      width: 90.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                20.r),
                                        color: orange,
                                      ),
                                      child: CustomText(
                                        text: "Search",
                                        size: 18.sp,
                                        color: white,
                                        fontWeight: FontWeight.w400,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),

                    ///////////////
                    SizedBox(
                      height: 30.h,
                    ),

                    SizedBox(height: 20.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10.r),
                          color: white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CustomText(
                                    text: "Blogs",
                                    size: 20.sp,
                                    color: black,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  width: 30.w,
                                ),
                                CustomText(
                                    text: "( ${HomeCubit.get(context).getAllBlogModel?.totalCount.toString()} Blog)",
                                    size: 16.sp,
                                    color: darkGrey,
                                    fontWeight: FontWeight.w500),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    controller.animateToPage(3,
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.easeIn);
                                  },
                                  child: Container(
                                    width: 80.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                10.r),
                                        color: orange),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: white,
                                        ),
                                        CustomText(
                                            text: "Add",
                                            size: 16.sp,
                                            color: white,
                                            fontWeight: FontWeight.w600),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: SizedBox(
                                child: TextFormField(
                                  controller: HomeCubit.get(context).search,
                                  maxLines: 1,
                                  onChanged: (value){
                                    HomeCubit.get(context).getAllBlog(0, 10);
                                  },
                                  onSaved: (value){
                                    HomeCubit.get(context).getAllBlog(0, 0);
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

                                    fillColor:
                                        const Color.fromRGBO(247, 247, 247, 1),
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
                            SizedBox(
                                height: 650.h,
                                width: 900.w,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    controller: HomeCubit.get(context).table,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        HotelAccomandtion(
                                          controller: controller,
                                          context: context,
                                        ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                    itemCount: HomeCubit.get(context)
                                        .getAllBlogModel!
                                        .data!
                                        .length)),
                            SizedBox(height: 20.h),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    HomeCubit.get(context).scrollLeft(900.w);
                                  },
                                  child: Container(
                                    width: 109.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                10.r),
                                        border: Border.all(
                                            color: Colors.grey.shade500)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.keyboard_arrow_left_sharp,
                                          color: Colors.grey.shade500,
                                        ),
                                        CustomText(
                                          text: "Previous",
                                          size: 14.sp,
                                          color: Colors.grey.shade500,
                                          fontWeight: FontWeight.w600,
                                          alignment: Alignment.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    HomeCubit.get(context).scrollRight(900.w);

                                    //HomeCubit.get(context).getAllBlog();
                                  },
                                  child: Container(
                                    width: 80.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                10.r),
                                        border: Border.all(
                                            color: Colors.grey.shade500)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: "Next",
                                          size: 14.sp,
                                          color: Colors.grey.shade500,
                                          fontWeight: FontWeight.w600,
                                          alignment: Alignment.center,
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.grey.shade500,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
        );
      },
    );
  }
}
