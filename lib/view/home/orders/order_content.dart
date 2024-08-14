import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/constant/table/order/table_booking_order.dart';
import 'package:aser_dash_board/logic/booking/order_cubit/order_cubit.dart';
import 'package:aser_dash_board/logic/booking/order_cubit/order_state.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderContent extends StatelessWidget {
  PageController orderContent = PageController();
   OrderContent({super.key,required this.orderContent});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit,OrderState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 40.h),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
            
                      Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 10.h),
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
                                controller: OrderCubit.get(context)
                                    .addtionalDate,
                                maxLines: 1,
            
                                onTap: () {
                                  print("object");
                                  OrderCubit.get(context).PickDate(
                                      context : context,
                                      controller:
                                      OrderCubit.get(context)
                                          .addtionalDate,
                                      lastDate: DateTime(2025),
                                      firstDate: DateTime.now(),
            
                                      initialDate: DateTime.now()
            
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
            
                      SizedBox(width: 40.w,),
            
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
                                          OrderCubit.get(context)
                                              .status,
                                          hint: CustomText(
                                              text: "Status",
                                              size: 12.sp,
                                              color: darkGrey,
                                              fontWeight:
                                              FontWeight.w600),
                                          items: OrderCubit.get(context).statusList
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
                                            if (val == "Pending") {
                                              OrderCubit.get(context)
                                                  .statusConvert =
                                              "0";
                                              print(OrderCubit.get(
                                                  context)
                                                  .statusConvert);
                                            } else if (val ==
                                                "UpComing") {
                                              OrderCubit.get(context)
                                                  .statusConvert =
                                              "1";
                                              print(OrderCubit.get(
                                                  context)
                                                  .statusConvert);
                                            }
                                            else if(val == "Complete"){
                                              OrderCubit.get(context)
                                                  .statusConvert =
                                              "2";
                                            }
                                            else if(val == "Cancelled"){
                                              OrderCubit.get(context)
                                                  .statusConvert =
                                              "3";
                                            }
                                            OrderCubit.get(context)
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
                      const Spacer(),
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
                      SizedBox(width: 40.w,),
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
                SizedBox(height: 30.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: white
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CustomText(
                                  text: "Orders",
                                  size: 20.sp,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                              SizedBox(
                                width: 30.w,
                              ),
                              CustomText(
                                  text: "(23 Order)",
                                  size: 16.sp,
                                  color: darkGrey,
                                  fontWeight: FontWeight.w500),

                            ],
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: SizedBox(
                              child: TextFormField(
                                controller: TextEditingController(),
                                maxLines: 1,
                                onChanged: (value){
                                  // HomeCubit.get(context).getAllBlog(0, 10);
                                },
                                onSaved: (value){
                                  // HomeCubit.get(context).getAllBlog(0, 0);
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
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
            
                OrderBookingTable(orderBookingTable: orderContent,),
            
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
            
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
        );
      },

    );
  }
}
