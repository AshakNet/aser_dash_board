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
   DetailsOrderBooking({super.key,required this.detailsOrderBooking});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit,OrderState>(
      listener: (context,state){

        if(state is AcceptOrderSuccessful){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Change Successful'),
              duration: Duration(seconds: 2),
            ),
          );
        }
        else if (state is AcceptOrderError){
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
              duration: Duration(seconds: 2),
            ),
          );
        }
        else if (state is CancelOrderSuccessful){
          OrderCubit.get(context).getAllOrder(skip: 0, take: 10);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Change Successful'),
              duration: Duration(seconds: 2),
            ),
          );
        }
        else if(state is CancelOrderError){
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context,state){
        return Scaffold(
          body: SingleChildScrollView(
            child:
            state is GetOrderDetailsLoading  ? const Center(child: CircularProgressIndicator()):
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap:(){
                          detailsOrderBooking.animateToPage(0, duration: const Duration(microseconds: 30), curve: Curves.easeIn);

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
                              borderRadius: BorderRadiusDirectional.circular(20.r)),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                                  child: CustomText(text: "Order Details", size: 20.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                ),
                                SizedBox(height: 20.h,),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.r),
                                        border: Border.all(color: darkGrey)

                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              CustomText(text: "Type", size: 16.sp, color: black, fontWeight: FontWeight.w600,textDecoration: TextDecoration.underline,alignment: Alignment.centerLeft,),
                                              Spacer(),
                                              CustomText(text: "${OrderCubit.get(context).getOrderDetailsModel!.data!.type}", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),


                                            ],
                                          ),
                                          SizedBox(height: 10.h,),

                                          Row(
                                            children: [
                                              CustomText(text: "Number of Pieces", size: 16.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                              Spacer(),
                                              CustomText(text: "${OrderCubit.get(context).getOrderDetailsModel!.data!.noOfPieces}", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),


                                            ],
                                          ),
                                          SizedBox(height: 10.h,),
                                          Row(
                                            children: [
                                              CustomText(text: "Price", size: 16.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                              Spacer(),
                                              CustomText(text: "${OrderCubit.get(context).getOrderDetailsModel!.data!.price}", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),
                                              CustomText(text: " EGP ", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),


                                            ],
                                          ),
                                          SizedBox(height: 10.h,),
                                          Row(
                                            children: [
                                              CustomText(text: "Delivered Address", size: 16.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                              Spacer(),
                                              CustomText(text: "${OrderCubit.get(context).getOrderDetailsModel!.data!.deliveryAddress}", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),


                                            ],
                                          ),
                                          SizedBox(height: 10.h,),
                                          Row(
                                            children: [
                                              CustomText(text: "Payment", size: 16.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                              Spacer(),
                                              CustomText(text: "${OrderCubit.get(context).getOrderDetailsModel!.data!.payment} ", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),


                                            ],
                                          ),




                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h,),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                  child: CustomText(text: "Pieces Details", size: 20.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                ),
                                SizedBox(height: 20.h,),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                                  child: Container(
                                    height: 300.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.r),
                                        border: Border.all(color: darkGrey)

                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                                      child: ListView.separated(itemBuilder: (context,index)=>Column(
                                        children: [
                                          Row(
                                            children: [
                                              CustomText(text: "${OrderCubit.get(context).getOrderDetailsModel!.data!.products![index].product}", size: 16.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                              Spacer(),
                                              CustomText(text: "${OrderCubit.get(context).getOrderDetailsModel!.data!.products![index].amount}", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),


                                            ],
                                          ),


                                        ],
                                      ), separatorBuilder: (context,index)=>SizedBox(height: 20.h,), itemCount: OrderCubit.get(context).getOrderDetailsModel!.data!.products!.length),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    GestureDetector(
                                      onTap:(){
                                        // OrderCubit.get(context).acceptOrder(
                                        //   OrderCubit.get(context).getOrderDetailsModel!.data!.bookingId.toString()
                                        // );
                                      },
                                      child: Container(
                                        width: 120.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                            color: orange,
                                            borderRadius:
                                            BorderRadiusDirectional.circular(
                                                10.r),
                                            border: Border.all(color: darkGrey)),
                                        child: CustomText(
                                          text: "Accept ",
                                          size: 16.sp,
                                          color: black,
                                          fontWeight: FontWeight.w600,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      width: 20.w,
                                    ),

                                    GestureDetector(
                                      onTap: (){
                                        // OrderCubit.get(context).cancelOrder(
                                        //     OrderCubit.get(context).getOrderDetailsModel!.data!.bookingId.toString()
                                        //
                                        // );
                                      },
                                      child: Container(
                                        width: 120.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadiusDirectional.circular(
                                                10.r),
                                            border: Border.all(color: darkGrey)),
                                        child: CustomText(
                                          text: "Decline ",
                                          size: 16.sp,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),


                              ],
                            ),
                          ),
                        )

                    ),
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
                                BorderRadiusDirectional.circular(20.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/images/home/pesrson.png"),
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
                                        text: "${OrderCubit.get(context).getOrderDetailsModel!.data!.email}",
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
                                        text: "Pending",
                                        size: 14.sp,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),

                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
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
                                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
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
                                          "${OrderCubit.get(context).getOrderDetailsModel!.data!.ownerName}",
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
                                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(

                                      children: [
                                        CustomText(
                                          text:
                                          ": Email Address ",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                        SizedBox(width: 10.h,),
                                        Text(
                                          maxLines: 1,

                                          overflow: TextOverflow.ellipsis,
                                          "${OrderCubit.get(context).getOrderDetailsModel!.data!.email}",style: TextStyle(
                                          fontSize: 14.sp,

                                          color: black,
                                          fontWeight: FontWeight.w400,
                                        ),)


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
                                          ": Gender",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                        SizedBox(width: 10.h,),

                                        CustomText(
                                          text:
                                          "${OrderCubit.get(context).getOrderDetailsModel!.data!.gender}",
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
                                          "${OrderCubit.get(context).getOrderDetailsModel!.data!.phoneNo}",
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
}
