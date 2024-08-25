import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/trips_cubit/tripe_cubit.dart';
import 'package:aser_dash_board/logic/trips_cubit/trips_state.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripDetails extends StatelessWidget {
  PageController detailsTrips = PageController();
   TripDetails({super.key,required this.detailsTrips});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: BlocConsumer<TripsCubit,TripsState>(
        listener: (context,state){

          if(state is ActiveSuccessful){

            TripsCubit.get(context).getOneTripsMethod(TripsCubit.get(context).getOneTripsModel!.data!.id.toString());
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text('Change Successful'),
                duration: Duration(seconds: 2),
              ),

            );
          }
          else if(state is ActiveError){
            ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.error),
                duration: Duration(seconds: 2),
              ),

            );
          }

          else if (state is DeleteTripsSuccessful){
            TripsCubit.get(context).getAllTrips(skip: 0, take: 10);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text('delete Successful'),
                duration: Duration(seconds: 2),
              ),

            );
          }
        },
        builder: (context,state){
          return SingleChildScrollView(
            child:
            state is GetOneTripsLoading ? const Center(child: CircularProgressIndicator()) :
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Row(
                    children: [
                      CustomText(
                          text: "Home",
                          size: 12.sp,
                          color: darkGrey,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        width: 5.w,
                      ),
                      GestureDetector(
                          onTap: () {
                            detailsTrips.animateToPage(0,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                            TripsCubit.get(context).getAllTrips(skip: 0, take: 10);
                          },
                          child: CustomText(
                              text: "Trips<<",
                              size: 12.sp,
                              color: darkGrey,
                              fontWeight: FontWeight.w600)),
                      CustomText(
                          text: "${TripsCubit.get(context).getOneTripsModel!.data!.title.toString()}<<",
                          size: 12.sp,
                          color: black,
                          fontWeight: FontWeight.w700),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    children: [

                      GestureDetector(
                        onTap:(){
                          TripsCubit.get(context).toggle(0);

                        },
                        child: Container(
                          width: 167.w,
                          height: 50.h,
                          color:TripsCubit.get(context).change == 0 ? orange : white
                          ,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                text: "Service",
                                size: 14.sp,
                                color: black,
                                fontWeight: FontWeight.w600,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: (){

                          detailsTrips.animateToPage(3, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                          TripsCubit.get(context).toggle(1);


                        },
                        child: Container(
                          width: 167.w,
                          height: 50.h,
                          color:  TripsCubit.get(context).change == 1 ? orange : white,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Image.asset(
                                "assets/images/home/chart.png",
                                color: black,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                text: "Orders",
                                size: 14.sp,
                                color: black,
                                fontWeight: FontWeight.w600,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          detailsTrips.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                          TripsCubit.get(context).toggle(2);

                        },
                        child: Container(
                          width: 167.w,
                          height: 50.h,
                          color: TripsCubit.get(context).change == 2 ? orange : white,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Image.asset(
                                "assets/images/home/chart.png",
                                color: black,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                text: "Insights",
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: "Trip Information",
                                    size: 20.sp,
                                    color: black,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  height: 30.h,
                                ),
                                CustomText(
                                    text: "Trip Title",
                                    size: 16.sp,
                                    color: black,
                                    fontWeight: FontWeight.w700),
                                SizedBox(
                                  height: 20.h,
                                ),
                                CustomText(
                                    text: TripsCubit.get(context).getOneTripsModel!.data!.title.toString(),
                                    size: 14.sp,
                                    color: darkGrey,
                                    fontWeight: FontWeight.w700),

                                SizedBox(
                                  height: 20.h,
                                ),

                                CustomText(
                                    text: "About",
                                    size: 16.sp,
                                    color: text,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                              TripsCubit.get(context).getOneTripsModel!.data!.description.toString(),
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: black,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                CustomText(
                                    text: "Rules",
                                    size: 16.sp,
                                    color: text,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                           TripsCubit.get(context).getOneTripsModel!.data!.tripRoles.toString(),
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: black,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 20.h,),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.r),
                                  child: Image.network(
                                    TripsCubit.get(context).getOneTripsModel!.data!.photo.toString(),
                                    height: 200.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                SizedBox(
                                  height: 80.h,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(15.r),
                                        child: Image.network(
                                          "https://www.shutterstock.com/image-photo/credit-card-on-holiday-blurred-600nw-441566938.jpg",
                                          width: 60.w,
                                          height: 60.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                      itemCount: 6),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),

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
                                BorderRadiusDirectional.circular(20.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        TripsCubit.get(context).getOneTripsModel!.data!.photo.toString()),
                                  ),
                                  CustomText(
                                    text: TripsCubit.get(context).getOneTripsModel!.data!.companyName.toString(),
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
                                        text: TripsCubit.get(context).getOneTripsModel!.data!.ownerName.toString(),
                                        size: 14.sp,
                                        color: black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      CustomText(
                                        text: "(Owner)",
                                        size: 14.sp,
                                        color: darkGrey,
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
                                        text: TripsCubit.get(context).getOneTripsModel!.data!.isActive.toString(),
                                        size: 14.sp,
                                        color: Colors.green,
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
                                      GestureDetector(
                                        onTap: (){
                                          TripsCubit.get(context).deleteTrips(TripsCubit.get(context).getOneTripsModel!.data!.id.toString());
                                        },
                                        child: Container(
                                          width: 120.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  10.r),
                                              border: Border.all(color: darkGrey)),
                                          child: CustomText(
                                            text: "Delete ",
                                            size: 16.sp,
                                            color: Colors.red,
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
                                          TripsCubit.get(context).activeTrips(TripsCubit.get(context).getOneTripsModel!.data!.id.toString());
                                        },
                                        child: Container(
                                          width: 120.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  10.r),
                                              border: Border.all(color: darkGrey)),
                                          child: CustomText(
                                            text: "Edit ",
                                            size: 16.sp,
                                            color: black,
                                            fontWeight: FontWeight.w600,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: CustomText(
                                      text: "Trip Details",
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
                                    padding:  EdgeInsets.symmetric(horizontal: 40.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text:
                                          "Destination",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),

                                        CustomText(
                                          text:
                                          "Meeting Point",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),

                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.h,),

                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: [
                                        Row(

                                          children: [
                                            Image.asset(
                                                "assets/images/home/location.png"),
                                            SizedBox(width: 5.w,),
                                            SizedBox(
                                              width: 150.w,
                                              child: Text(
                                                TripsCubit.get(context).getOneTripsModel!.data!.destination.toString(),
                                                style: TextStyle(
                                                    fontSize: 16.sp,

                                                    color: black,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            )
                                          ],
                                        ),

                                        Row(

                                          children: [
                                            Image.asset(
                                                "assets/images/home/location.png"),
                                            SizedBox(width: 5.w,),
                                            SizedBox(
                                              width: 100.w,
                                              child: Text(
                                                TripsCubit.get(context).getOneTripsModel!.data!.meetingPoint.toString(),
                                                style: TextStyle(
                                                    fontSize: 16.sp,

                                                    color: black,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            )
                                          ],
                                        )

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 40.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text:
                                          "Date",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),

                                        CustomText(
                                          text:
                                          "Duration",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w600,alignment: Alignment.centerRight,),

                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.h,),


                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: [
                                        Row(

                                          children: [
                                            Image.asset(
                                                "assets/images/home/date.png"),
                                            SizedBox(width: 5.w,),
                                            SizedBox(
                                              width: 150.w,
                                              child: Text(
                                                TripsCubit.get(context).getOneTripsModel!.data!.arrivalDate.toString(),
                                                style: TextStyle(
                                                    fontSize: 16.sp,

                                                    color: black,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            )
                                          ],
                                        ),

                                        Row(

                                          children: [
                                            Image.asset(
                                                "assets/images/home/time.png"),
                                            SizedBox(width: 5.w,),
                                            SizedBox(
                                              width: 100.w,
                                              child: Text(
                                                "${TripsCubit.get(context).getOneTripsModel!.data!.duration.toString()} Days",
                                                style: TextStyle(
                                                    fontSize: 16.sp,

                                                    color: black,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            )
                                          ],
                                        ),


                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 40.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text:
                                          "Group Size",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.h,),

                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: [
                                        Row(

                                          children: [
                                            Image.asset(
                                                "assets/images/home/group.png"),
                                            SizedBox(width: 5.w,),
                                            SizedBox(
                                              width: 150.w,
                                              child: Text(
                                                "${TripsCubit.get(context).getOneTripsModel!.data!.groupSize.toString()} People",
                                                style: TextStyle(
                                                    fontSize: 16.sp,

                                                    color: black,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            )
                                          ],
                                        ),



                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20.h,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(
                                      text: "Ticket Price",
                                      size: 14.sp,
                                      color: Colors.green,
                                      alignment: Alignment.centerLeft,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 20.h,),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                        child: CustomText(
                                          text: "${TripsCubit.get(context).getOneTripsModel!.data!.price.toString()} ",
                                          size: 14.sp,
                                          color: darkGrey,
                                          alignment: Alignment.centerLeft,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                        child: CustomText(
                                          text: " EGP / Individual ",
                                          size: 14.sp,
                                          color: darkGrey,
                                          alignment: Alignment.centerLeft,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            CustomText(
                                              text: "Movement Time",
                                              size: 14.sp,
                                              color: black,
                                              alignment: Alignment.centerLeft,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            Row(
                                              children: [
                                                CustomText(
                                                  text: TripsCubit.get(context).getOneTripsModel!.data!.arrivalDate.toString(),
                                                  size: 14.sp,
                                                  color: darkGrey,
                                                  alignment: Alignment.centerLeft,
                                                  fontWeight: FontWeight.w500,
                                                ),

                                              ],
                                            )
                                          ],
                                        ),

                                        Image.asset("assets/images/home/arrow.png"),


                                        Column(
                                          children: [
                                            CustomText(
                                              text: "Movement Time",
                                              size: 14.sp,
                                              color: black,
                                              alignment: Alignment.centerLeft,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            Row(
                                              children: [
                                                CustomText(
                                                  text: TripsCubit.get(context).getOneTripsModel!.data!.movementDate.toString(),
                                                  size: 14.sp,
                                                  color: darkGrey,
                                                  alignment: Alignment.centerLeft,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                SizedBox(width: 5.w,),
                                                CustomText(
                                                  text: "(05:00 AM)",
                                                  size: 14.sp,
                                                  color: darkGrey,
                                                  alignment: Alignment.centerLeft,
                                                  fontWeight: FontWeight.w500,
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )





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
          );
        },

      ),
    );
  }
}
