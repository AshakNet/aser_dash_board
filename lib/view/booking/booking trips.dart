import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/constant/table/booking/booking%20table_trips.dart';
import 'package:aser_dash_board/logic/booking/bookingActivityAndTripsCubit/booking_activity_andtrips.dart';
import 'package:aser_dash_board/logic/booking/bookingActivityAndTripsCubit/booking_actvity_and%20_trips_state.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingTrips  extends StatelessWidget {
  PageController booking = PageController();
   BookingTrips({super.key,required this.booking});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<BookingActivityAndTripsCubit,BookingActivityState>(
        listener: (context,state){},
        builder: (context,state){
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.h),
                  child: Row(
                    children: [

                      GestureDetector(
                        onTap:(){
                          BookingActivityAndTripsCubit.get(context).toggle(0);
                          booking.animateToPage(0, duration: Duration(milliseconds: 30), curve: Curves.easeIn);



                        },
                        child: Container(
                          width: 167.w,
                          height: 50.h,
                          color:BookingActivityAndTripsCubit.get(context).change == 0 ? orange : white
                          ,
                          child: CustomText(
                            text: "Activity",
                            size: 14.sp,
                            color: black,
                            fontWeight: FontWeight.w600,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){

                          BookingActivityAndTripsCubit.get(context).toggle(1);

                        },
                        child: Container(
                          width: 167.w,
                          height: 50.h,
                          color:  BookingActivityAndTripsCubit.get(context).change == 1 ? orange : white,
                          child:  CustomText(
                            text: "Trips",
                            size: 14.sp,
                            color: black,
                            fontWeight: FontWeight.w600,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 30.w),
                  child: SizedBox(
                    child: TextFormField(
                      controller: BookingActivityAndTripsCubit.get(context).searchTrips,
                      maxLines: 1,
                      onChanged: (value){
                        BookingActivityAndTripsCubit.get(context).getAllBookingTrips(skip: 0, take: 10);
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
                        hintText: 'search by name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: orange),
                        ),
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 20.h),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),color: white
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CustomText(
                                    text: "Trips",
                                    size: 20.sp,
                                    color: black,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  width: 30.w,
                                ),
                                CustomText(
                                    text: "(${BookingActivityAndTripsCubit.get(context).getAllTripsBookingModel!.data!.totalCount} Order)",
                                    size: 16.sp,
                                    color: darkGrey,
                                    fontWeight: FontWeight.w500),
                                Spacer(),

                              ],
                            ),

                            SizedBox(height: 20.h),
                            BookingTableTrips(bookingTriple: booking,context: context,),
                            SizedBox(height: 20.h),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    BookingActivityAndTripsCubit.get(context).scrollLeftTrips();

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

                                    BookingActivityAndTripsCubit.get(context).scrollRightTrips();

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
                    ),
                  ),
                )
              ],
            ),
          );
        },

      ),
    );
  }
}
