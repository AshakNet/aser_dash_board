import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/booking/bookingActivityAndTripsCubit/booking_activity_andtrips.dart';
import 'package:aser_dash_board/logic/booking/bookingActivityAndTripsCubit/booking_actvity_and%20_trips_state.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsBooking extends StatelessWidget {
  PageController detailsBookingOrder = PageController();
   DetailsBooking({super.key,required this.detailsBookingOrder});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingActivityAndTripsCubit,BookingActivityState>(
      listener: (context,state){
         if(state is AcceptBookingSuccessful){
           BookingActivityAndTripsCubit.get(context).getBookingDetailsActivity(
               BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.id.toString()
           );
           ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(
               backgroundColor: Colors.green,
               content: Text('Change Successful'),
               duration: Duration(seconds: 2),
             ),
           );

         }
         else if(state is AcceptBookingError){
           ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
               backgroundColor: Colors.red,
               content: Text(state.error),
               duration: Duration(seconds: 2),
             ),
           );
         }

         else if(state is CancelBookingSuccessful ){
           BookingActivityAndTripsCubit.get(context).getBookingDetailsActivity(
               BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.id.toString()
           );
           ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(
               backgroundColor: Colors.green,
               content: Text('Change Successful'),
               duration: Duration(seconds: 2),
             ),
           );
         }
         else if(state is CancelBookingError ){
           ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
               backgroundColor: Colors.red,
               content: Text(state.error),
               duration: Duration(seconds: 2),
             ),
           );
         }
      },
      builder: (context,state){
        return Scaffold(
          body: SingleChildScrollView(
            child:
            state is GetBookingActivityDetailsLoading  ?const Center(child: CircularProgressIndicator()) :
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap:(){
                          detailsBookingOrder.animateToPage(0, duration: const Duration(microseconds: 30), curve: Curves.easeIn);
                        },
                        child: CustomText(
                            text: "Booking",
                            size: 12.sp,
                            color: darkGrey,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      CustomText(
                          text: "${BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.title}<<",
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
                        flex: 2,
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
                                  child: CustomText(text: "Booking Details", size: 20.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
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
                                              CustomText(text: "${BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.type}", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),


                                            ],
                                          ),
                                          SizedBox(height: 10.h,),
                                          Row(
                                            children: [
                                              CustomText(text: "Company name", size: 16.sp, color: black, fontWeight: FontWeight.w600,textDecoration: TextDecoration.underline,alignment: Alignment.centerLeft,),
                                              Spacer(),
                                              CustomText(text: "${BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.companyName}", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),


                                            ],
                                          ),
                                          SizedBox(height: 10.h,),
                                          Row(
                                            children: [
                                              CustomText(text: "activity Type", size: 16.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                              Spacer(),
                                              CustomText(text: "${BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.title}", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),


                                            ],
                                          ),
                                          SizedBox(height: 10.h,),
                                          Row(
                                            children: [
                                              CustomText(text: "Number of persons", size: 16.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                              Spacer(),
                                              CustomText(text:"${BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.noOfPersons}", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),


                                            ],
                                          ),
                                          SizedBox(height: 10.h,),
                                          Row(
                                            children: [
                                              CustomText(text: "Price", size: 16.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                              Spacer(),
                                              CustomText(text: "${BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.price}", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),
                                              CustomText(text: " EGP ", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500,alignment: Alignment.centerRight,),


                                            ],
                                          ),


                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h,),
                                BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.status == "Pending"
                                    || BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.status == "Upcoming" ?

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    GestureDetector(
                                      onTap:(){
                                        BookingActivityAndTripsCubit.get(context).acceptBooking(
                                            BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.id.toString()
                                        );
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
                                        BookingActivityAndTripsCubit.get(context).cancelBooking(
                                            BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.id.toString()

                                        );

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
                                ) :SizedBox.shrink()

                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 60.w,
                    ),
                    Expanded(
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
                                    backgroundImage: NetworkImage(
                                       "${BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.logo}"),
                                  ),
                                  CustomText(
                                    text: "${BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.companyName}",
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
                                        text:" ${BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.email}",
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
                                        text: "${BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.status}",
                                        size: 14.sp,
                                        color:
                                        BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.status == "Cancelled" ?
                                            Colors.red :
                                        Colors.green,
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
                                          "${BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.ownerName}",
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
                                          " : Email Address ",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                        SizedBox(width: 10.h,),

                                        CustomText(
                                          text:
                                          "${BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.email}",
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
                                          "${BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.phoneNo}",
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
                                          " : National ID",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                        SizedBox(width: 10.h,),

                                        CustomText(
                                          text:
                                          "${BookingActivityAndTripsCubit.get(context).getBookingDetailsActivityModel!.data!.nationalId}",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w400,alignment: Alignment.centerRight,),


                                      ],
                                    ),
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
