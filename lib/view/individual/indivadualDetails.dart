import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/indivdulCubit/indivadulCubit.dart';
import 'package:aser_dash_board/logic/indivdulCubit/indivadulState.dart';

import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndividualDetails extends StatelessWidget {
  PageController detailIndividualsBooking = PageController();

  IndividualDetails({super.key, required this.detailIndividualsBooking});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IndividualCubit, IndividualState>(
      listener: (context, state) {


      },
      builder: (context, state) {
        return Scaffold(
            body: SingleChildScrollView(
              child:
              state is GetIndividualDetailsLoading ? const Center(
                  child: CircularProgressIndicator()) :
              Column(
                  children: [
              Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      //detailsOrderBooking.animateToPage(0, duration: const Duration(microseconds: 30), curve: Curves.easeIn);

                    },
                    child: CustomText(
                        text: "Individuals",
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
              children: [
                GestureDetector(
                  onTap: () {
                    IndividualCubit.get(context).toggle(0);
                  },
                  child: Container(
                    width: 167.w,
                    height: 50.h,
                    color: IndividualCubit
                        .get(context)
                        .change == 0 ? orange : white
                    ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          text: "Booking",
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
            SizedBox(
              height: 50.h,
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "Bookings", size: 20.sp, color: black, fontWeight: FontWeight.w600),

                          CustomText(text: "( services ${IndividualCubit.get(context).getAllIndivadualBookingModel!.data!.count.toString()})", size: 20.sp, color: black, fontWeight: FontWeight.w600),


                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              Container(width: double.infinity,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadiusDirectional.circular(
                                        15.r), border: Border.all(color: darkGrey)),
                                child:Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 30.w),
                                  child: Column(
                                    children: [
                                      Row(

                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          CustomText(text: "${IndividualCubit.get(context).getAllIndivadualBookingModel!.data!.details![index].serviceName}", size: 18.sp, color: black, fontWeight: FontWeight.w600),
                                          CustomText(text: "${IndividualCubit.get(context).getAllIndivadualBookingModel!.data!.details![index].serviceName}", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w600)
                                        ],
                                      ),

                                      SizedBox(height: 15.h,),

                                      Row(

                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          CustomText(text: "TotalCost", size: 18.sp, color: black, fontWeight: FontWeight.w600),
                                          CustomText(text: "${IndividualCubit.get(context).getAllIndivadualBookingModel!.data!.details![index].price}", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w600)
                                        ],
                                      ),
                                      SizedBox(height: 15.h,),

                                      Row(

                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          CustomText(text: "Service Status", size: 18.sp, color: black, fontWeight: FontWeight.w600),
                                          CustomText(text: "${IndividualCubit.get(context).getAllIndivadualBookingModel!.data!.details![index].bookingStatus}", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w600)
                                        ],
                                      ),
                                      SizedBox(height: 15.h,),

                                      Row(

                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          CustomText(text: "Payment", size: 18.sp, color: black, fontWeight: FontWeight.w600),
                                          CustomText(text: "${IndividualCubit.get(context).getAllIndivadualBookingModel!.data!.details![index].paymentStatus}", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w600)
                                        ],
                                      ),




                                    ],
                                  ),
                                ) ,

                              ),
                          separatorBuilder: (context, index) => SizedBox(height: 20.h,),
                          itemCount: IndividualCubit.get(context).getAllIndivadualBookingModel!.data!.details!.length),
                    ],
                  )


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
        text: "mhmwdzhran02@gmail.com",
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
        padding: EdgeInsets.symmetric(horizontal: 20.w),
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
        padding: EdgeInsets.symmetric(horizontal: 10.w),
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
        "mahmoud",
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
        padding: EdgeInsets.symmetric(horizontal: 10.w),
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
        "lmkmkmkm",style: TextStyle(
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
        padding: EdgeInsets.symmetric(horizontal: 20.w),
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
        "kmkmkmklm",
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
        padding: EdgeInsets.symmetric(horizontal: 20.w),
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
        "01154515454",
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
