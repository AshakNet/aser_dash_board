import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/booking/order_cubit/order_cubit.dart';
import 'package:aser_dash_board/logic/booking/order_cubit/order_state.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsOrderBooking extends StatelessWidget {
  PageController detailsOrderBooking = PageController();

  DetailsOrderBooking({super.key, required this.detailsOrderBooking});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is AcceptOrderSuccessful) {
          OrderCubit.get(context).getOrderDetails(OrderCubit.get(context)
              .getOrderDetailsModel!
              .data!
              .bookingId
              .toString());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Change Successful'),
              duration: Duration(seconds: 2),
            ),
          );
        }
        else if (state is AcceptOrderError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
              duration: Duration(seconds: 2),
            ),
          );
        }
        else if (state is CancelOrderSuccessful) {
          OrderCubit.get(context).getOrderDetails(OrderCubit.get(context)
              .getOrderDetailsModel!
              .data!
              .bookingId
              .toString());

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Change Successful'),
              duration: Duration(seconds: 2),
            ),
          );
        }
        else if (state is CancelOrderError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
              duration: const Duration(seconds: 2),
            ),
          );
        }
        else if (state is AddDeliverySuccessful) {
          OrderCubit.get(context).timeController.clear();
          OrderCubit.get(context).dateController.clear();
          OrderCubit.get(context).getOrderDetails(OrderCubit.get(context)
              .getOrderDetailsModel!
              .data!
              .bookingId
              .toString());
          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Successful'),
              duration: Duration(seconds: 2),
            ),
          );
        }
        else if(state is ConfirmOrderSuccessful){
          OrderCubit.get(context).getOrderDetails(
            OrderCubit.get(context).getOrderDetailsModel!.data!.bookingId.toString()
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('confirm Order Successful'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: state is GetOrderDetailsLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 20.w),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                OrderCubit.get(context)
                                    .getAllOrder(skip: 0, take: 10);
                                detailsOrderBooking.animateToPage(0,
                                    duration: const Duration(microseconds: 30),
                                    curve: Curves.easeIn);
                              },
                              child: CustomText(
                                  text: "Order",
                                  size: 12.sp,
                                  color: darkGrey,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            CustomText(
                                text: "New<<",
                                size: 12.sp,
                                color: black,
                                fontWeight: FontWeight.w700),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 60.w,
                          ),
                          Expanded(
                              flex: 60,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(20.r)),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w, vertical: 20.h),
                                        child: CustomText(
                                          text: "Order Details",
                                          size: 20.sp,
                                          color: black,
                                          fontWeight: FontWeight.w600,
                                          alignment: Alignment.centerLeft,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w, vertical: 20.h),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              border:
                                                  Border.all(color: darkGrey)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w,
                                                vertical: 20.h),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    CustomText(
                                                      text: "Type",
                                                      size: 16.sp,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      textDecoration:
                                                          TextDecoration
                                                              .underline,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    ),
                                                    Spacer(),
                                                    CustomText(
                                                      text:
                                                          "${OrderCubit.get(context).getOrderDetailsModel!.data!.type}",
                                                      size: 16.sp,
                                                      color: darkGrey,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      alignment:
                                                          Alignment.centerRight,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Row(
                                                  children: [
                                                    CustomText(
                                                      text: "Number of Pieces",
                                                      size: 16.sp,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    ),
                                                    Spacer(),
                                                    CustomText(
                                                      text:
                                                          "${OrderCubit.get(context).getOrderDetailsModel!.data!.noOfPieces}",
                                                      size: 16.sp,
                                                      color: darkGrey,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      alignment:
                                                          Alignment.centerRight,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Row(
                                                  children: [
                                                    CustomText(
                                                      text: "Price",
                                                      size: 16.sp,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    ),
                                                    Spacer(),
                                                    CustomText(
                                                      text:
                                                          "${OrderCubit.get(context).getOrderDetailsModel!.data!.price}",
                                                      size: 16.sp,
                                                      color: darkGrey,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      alignment:
                                                          Alignment.centerRight,
                                                    ),
                                                    CustomText(
                                                      text: " EGP ",
                                                      size: 16.sp,
                                                      color: darkGrey,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      alignment:
                                                          Alignment.centerRight,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Row(
                                                  children: [
                                                    CustomText(
                                                      text: "Delivered Address",
                                                      size: 16.sp,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    ),
                                                    Spacer(),
                                                    CustomText(
                                                      text:
                                                          "${OrderCubit.get(context).getOrderDetailsModel!.data!.deliveryAddress}",
                                                      size: 16.sp,
                                                      color: darkGrey,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      alignment:
                                                          Alignment.centerRight,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Row(
                                                  children: [
                                                    CustomText(
                                                      text: "Payment",
                                                      size: 16.sp,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    ),
                                                    Spacer(),
                                                    CustomText(
                                                      text:
                                                          "${OrderCubit.get(context).getOrderDetailsModel!.data!.payment} ",
                                                      size: 16.sp,
                                                      color: darkGrey,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      alignment:
                                                          Alignment.centerRight,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: CustomText(
                                          text: "Pieces Details",
                                          size: 20.sp,
                                          color: black,
                                          fontWeight: FontWeight.w600,
                                          alignment: Alignment.centerLeft,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w, vertical: 20.h),
                                        child: Container(
                                          height: 300.h,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              border:
                                                  Border.all(color: darkGrey)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w,
                                                vertical: 20.h),
                                            child: ListView.separated(
                                                itemBuilder: (context, index) =>
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            CustomText(
                                                              text:
                                                                  "${OrderCubit.get(context).getOrderDetailsModel!.data!.products![index].product}",
                                                              size: 16.sp,
                                                              color: black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                            ),
                                                            Spacer(),
                                                            CustomText(
                                                              text:
                                                                  "${OrderCubit.get(context).getOrderDetailsModel!.data!.products![index].amount}",
                                                              size: 16.sp,
                                                              color: darkGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              alignment: Alignment
                                                                  .centerRight,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(
                                                          height: 20.h,
                                                        ),
                                                itemCount:
                                                    OrderCubit.get(context)
                                                        .getOrderDetailsModel!
                                                        .data!
                                                        .products!
                                                        .length),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      OrderCubit.get(context)
                                                  .getOrderDetailsModel!
                                                  .data!
                                                  .status ==
                                              "Pending"
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    OrderCubit.get(context)
                                                        .acceptOrder(OrderCubit
                                                                .get(context)
                                                            .getOrderDetailsModel!
                                                            .data!
                                                            .bookingId
                                                            .toString());
                                                  },
                                                  child: Container(
                                                    width: 120.w,
                                                    height: 60.h,
                                                    decoration: BoxDecoration(
                                                        color: orange,
                                                        borderRadius:
                                                            BorderRadiusDirectional
                                                                .circular(10.r),
                                                        border: Border.all(
                                                            color: darkGrey)),
                                                    child: CustomText(
                                                      text: "Accept ",
                                                      size: 16.sp,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      alignment:
                                                          Alignment.center,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20.w,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    OrderCubit.get(context)
                                                        .cancelOrder(OrderCubit
                                                                .get(context)
                                                            .getOrderDetailsModel!
                                                            .data!
                                                            .bookingId
                                                            .toString());
                                                  },
                                                  child: Container(
                                                    width: 120.w,
                                                    height: 60.h,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadiusDirectional
                                                                .circular(10.r),
                                                        border: Border.all(
                                                            color: darkGrey)),
                                                    child: CustomText(
                                                      text: "Decline ",
                                                      size: 16.sp,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      alignment:
                                                          Alignment.center,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : OrderCubit.get(context)
                                                          .getOrderDetailsModel!
                                                          .data!
                                                          .deliveryDate ==
                                                      "" ||
                                                  OrderCubit.get(context)
                                                          .getOrderDetailsModel!
                                                          .data!
                                                          .deliveryTime ==
                                                      ""
                                              ? CustomText(
                                                  text: "Adding Delivery Time",
                                                  size: 18.sp,
                                                  color: black,
                                                  function: () {
                                                    showDeliveredPopup(
                                                        context: context,
                                                        date: OrderCubit.get(
                                                                context)
                                                            .dateController,
                                                        pickDate: () {
                                                          OrderCubit.get(context).PickDate(
                                                              context: context,
                                                              controller: OrderCubit
                                                                      .get(
                                                                          context)
                                                                  .dateController,
                                                              firstDate:
                                                                  DateTime
                                                                      .now(),
                                                              lastDate:
                                                                  DateTime(
                                                                      2030),
                                                              initialDate:
                                                                  DateTime
                                                                      .now());
                                                        },
                                                        pickTime: () {
                                                          OrderCubit.get(
                                                                  context)
                                                              .pickTime(
                                                                  context);
                                                        },
                                                        time: OrderCubit.get(
                                                                context)
                                                            .timeController,
                                                        function: () {
                                                          OrderCubit.get(
                                                                  context)
                                                              .addDeliveryTime(
                                                                  id: OrderCubit
                                                                          .get(
                                                                              context)
                                                                      .getOrderDetailsModel!
                                                                      .data!
                                                                      .orderId
                                                                      .toString());
                                                        });
                                                  },
                                                  fontWeight: FontWeight.w700,
                                                  textDecoration:
                                                      TextDecoration.underline,
                                                )
                                              : Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 20.w),
                                                      child: CustomText(
                                                          text:
                                                              "Delivered Details",
                                                          size: 18.sp,
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          color: black,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 20.w,
                                                              vertical: 20.h),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r),
                                                            border: Border.all(
                                                                color:
                                                                    darkGrey)),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      20.w,
                                                                  vertical:
                                                                      20.h),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  CustomText(
                                                                    text: "Day",
                                                                    size: 16.sp,
                                                                    color:
                                                                        black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                  ),
                                                                  Spacer(),
                                                                  CustomText(
                                                                    text:
                                                                        "${OrderCubit.get(context).getOrderDetailsModel!.data!.deliveryDate}",
                                                                    size: 16.sp,
                                                                    color:
                                                                        black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    alignment:
                                                                        Alignment
                                                                            .centerRight,
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 20.h,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  CustomText(
                                                                    text:
                                                                        "Time",
                                                                    size: 16.sp,
                                                                    color:
                                                                        black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                  ),
                                                                  Spacer(),
                                                                  CustomText(
                                                                    text:
                                                                        "${OrderCubit.get(context).getOrderDetailsModel!.data!.deliveryTime}",
                                                                    size: 16.sp,
                                                                    color:
                                                                        black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    alignment:
                                                                        Alignment
                                                                            .centerRight,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                    ],
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 60.w,
                          ),
                          Expanded(
                            flex: 40,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              20.r)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: Column(
                                      children: [
                                        const CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/images/home/pesrson.png"),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/images/home/profile.png"),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            CustomText(
                                              text:
                                                  "${OrderCubit.get(context).getOrderDetailsModel!.data!.email}",
                                              size: 14.sp,
                                              color: black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                              text:
                                                  "${OrderCubit.get(context).getOrderDetailsModel!.data!.status}",
                                              size: 14.sp,
                                              color: OrderCubit.get(context)
                                                          .getOrderDetailsModel!
                                                          .data!
                                                          .status ==
                                                      "Cancelled"
                                                  ? Colors.red
                                                  : Colors.green,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            (OrderCubit.get(context).getOrderDetailsModel!.data!.deliveryDate != "" ||
                                                OrderCubit.get(context).getOrderDetailsModel!.data!.deliveryTime != "")&&
                                                    OrderCubit.get(context).getOrderDetailsModel!.data!.status == "Upcoming"
                                                ?
                                            CustomText(
                                              text: "change to Delivered ",
                                              size: 12.sp,
                                              color: black,
                                              function: () {
                                                OrderCubit.get(context).confirmOrder(
                                                  OrderCubit.get(context).getOrderDetailsModel!.data!.bookingId.toString()

                                                );

                                              },
                                              fontWeight: FontWeight.w700,
                                              textDecoration:
                                              TextDecoration.underline,
                                            ) : SizedBox.shrink()

                                          ],
                                        ),
                                        SizedBox(
                                          height: 40.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: CustomText(
                                            text: "Owner profile",
                                            size: 20.sp,
                                            color: black,
                                            fontWeight: FontWeight.w600,
                                            alignment: Alignment.centerLeft,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Row(
                                            children: [
                                              CustomText(
                                                text: " : Name ",
                                                size: 14.sp,
                                                color: black,
                                                fontWeight: FontWeight.w700,
                                                alignment: Alignment.centerLeft,
                                              ),
                                              SizedBox(
                                                width: 10.h,
                                              ),
                                              CustomText(
                                                text:
                                                    "${OrderCubit.get(context).getOrderDetailsModel!.data!.ownerName}",
                                                size: 14.sp,
                                                color: black,
                                                fontWeight: FontWeight.w400,
                                                alignment:
                                                    Alignment.centerRight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Row(
                                            children: [
                                              CustomText(
                                                text: ": Email Address ",
                                                size: 14.sp,
                                                color: black,
                                                fontWeight: FontWeight.w700,
                                                alignment: Alignment.centerLeft,
                                              ),
                                              SizedBox(
                                                width: 10.h,
                                              ),
                                              Text(
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                "${OrderCubit.get(context).getOrderDetailsModel!.data!.email}",
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: black,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: Row(
                                            children: [
                                              CustomText(
                                                text: ": Gender",
                                                size: 14.sp,
                                                color: black,
                                                fontWeight: FontWeight.w700,
                                                alignment: Alignment.centerLeft,
                                              ),
                                              SizedBox(
                                                width: 10.h,
                                              ),
                                              CustomText(
                                                text:
                                                    "${OrderCubit.get(context).getOrderDetailsModel!.data!.gender}",
                                                size: 14.sp,
                                                color: black,
                                                fontWeight: FontWeight.w400,
                                                alignment:
                                                    Alignment.centerRight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: Row(
                                            children: [
                                              CustomText(
                                                text: " : Phone number",
                                                size: 14.sp,
                                                color: black,
                                                fontWeight: FontWeight.w700,
                                                alignment: Alignment.centerLeft,
                                              ),
                                              SizedBox(
                                                width: 10.h,
                                              ),
                                              CustomText(
                                                text:
                                                    "${OrderCubit.get(context).getOrderDetailsModel!.data!.phoneNo}",
                                                size: 14.sp,
                                                color: black,
                                                fontWeight: FontWeight.w400,
                                                alignment:
                                                    Alignment.centerRight,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 60.w,
                          ),
                        ],
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }

  void showDeliveredPopup(
      {required BuildContext context,
      required VoidCallback pickDate,
      required VoidCallback pickTime,
      required TextEditingController date,
      required TextEditingController time,
      required VoidCallback function}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: SizedBox(
            width: 400.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: date,
                  onTap: pickDate,
                  style: TextStyle(color: black),
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.calendar_today),
                    filled: true,
                    fillColor: white,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 13.w,
                      vertical: 20.h,
                    ),
                    constraints: const BoxConstraints(),
                    hintTextDirection: TextDirection.ltr,
                    hintStyle: TextStyle(
                      color: black,
                    ),
                    hintText: "DeliveredDate",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: darkGrey)),
                  ),
                  readOnly: true,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: time,
                  onTap: pickTime,
                  style: TextStyle(color: black),
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.access_time),
                    filled: true,
                    fillColor: white,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 13.w,
                      vertical: 20.h,
                    ),
                    constraints: const BoxConstraints(),
                    hintTextDirection: TextDirection.ltr,
                    hintStyle: TextStyle(
                      color: black,
                    ),
                    hintText: "Enter Delivered time",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: darkGrey)),
                  ),
                  readOnly: true,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: function,
                      child: Container(
                        width: 100.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.circular(15.r),
                            color: orange),
                        child: CustomText(
                            text: "Save",
                            alignment: Alignment.center,
                            size: 18.sp,
                            color: white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.circular(15.r),
                            color: darkGrey),
                        child: CustomText(
                            text: "Cancel",
                            alignment: Alignment.center,
                            size: 18.sp,
                            color: white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
