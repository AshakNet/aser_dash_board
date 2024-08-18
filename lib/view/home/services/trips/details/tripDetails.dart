import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/trips_cubit/tripe_cubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripDetails extends StatelessWidget {
  PageController detailsTrips = PageController();
   TripDetails({super.key,required this.detailsTrips});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      },
                      child: CustomText(
                          text: "Trips<<",
                          size: 12.sp,
                          color: darkGrey,
                          fontWeight: FontWeight.w600)),
                  CustomText(
                      text: "The grand Egyptian Meusume<<",
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
                    flex: 2,
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
                                text: "The grand Egyptian Museum",
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
                              "The Grand Egyptian Museum in Giza, Egypt is set to be the largest archaeological museum in the world, showcasing over 100,000 artifacts from ancient Egyptian civilization. The museum is scheduled to open to the public in mid-2024 after years of delays and setbacks.When the museum fully opens, visitors will be able to see the complete collection of King Tutankhamun's treasures for the first time, including around 5,000 items from his tomb that have never been displayed before. Other highlights will include a 30-foot-tall granite statue of Ramses ",
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
                              "1-Please gather at the designated meeting point at least   15 minutes before the departure time.\n 2- Ensure that you have your valid identification documents, such as passports or identification cards, with you \n 3- Listen carefully to the instructions provided by the tour guide or organizer. \n 4- Board the designated vehicle or mode of transportation and find a comfortable seat. \n 5- Fasten your seatbelts and listen to any safety briefings provided by the driver or tour guide. \n 6- During the journey, please refrain from loud conversations or disruptive behavior that may disturb other participants. \n 7- If you have any questions or concerns, feel free to approach the tour guide or organizer for assistance. \n 8- Enjoy the scenic views along the way, but refrain from opening the windows without permission. \n 9- Stay seated while the vehicle is in motion and avoid unnecessary movement that may affect the balance or safety of the vehicle. \n 10- Follow any rest or meal break schedules provided by the tour guide. \n 11- Respect the environment and dispose of any waste in designated trash bins. \n 12- Upon arrival in Cairo, follow the instructions of the tour guide regarding disembarkation and group activities. \n 13- Stay together as a group and avoid wandering off without informing the tour guide. \n 14- Take note of the meeting point and time for the return journey to Alexandria. \n 15- Enjoy your time in Cairo, follow the tour itinerary, and make the most of your visit to the city's attractions.",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: black,
                                  fontWeight: FontWeight.w400),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: Image.network(
                                "https://www.shutterstock.com/image-photo/credit-card-on-holiday-blurred-600nw-441566938.jpg",
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
                              CustomText(
                                text: "Al Amal Company",
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
                                    text: "mahmoud",
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
                                    text: "Active",
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
                                  Container(
                                    width: 120.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadiusDirectional.circular(
                                            10.r),
                                        border: Border.all(color: darkGrey)),
                                    child: CustomText(
                                      text: "Cancel ",
                                      size: 16.sp,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Container(
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
                                            "The Egyptian Grand Museum",
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
                                            "Alexandria",
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
                                            "15 Jun - 17 Jun",
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
                                            "3 Days",
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
                                            "30 People",
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
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                child: CustomText(
                                  text: "3000 EGP / Individual ",
                                  size: 14.sp,
                                  color: darkGrey,
                                  alignment: Alignment.centerLeft,
                                  fontWeight: FontWeight.w600,
                                ),
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
                                              text: "15 Jun",
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
                                              text: "15 Jun",
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
      ),
    );
  }
}
