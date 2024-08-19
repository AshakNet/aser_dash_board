import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/AcommandtionCubit/accomandtion_Cubit.dart';
import 'package:aser_dash_board/logic/AcommandtionCubit/accomandtion_state.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsServices extends StatelessWidget {
  PageController detailsServices = PageController();

  DetailsServices({super.key, required this.detailsServices});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccomandtionCubit,AccomandtionState>(
      listener: (context,state){
        if (state is ChangeStatusSuccessful){
          AccomandtionCubit.get(context).loadOne(id:
              AccomandtionCubit.get(context).getOneAccomandtionModel!.data!.serviceDetails!.serviceId.toString()
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Change Successful'),
              duration: Duration(seconds: 2),
            ),

          );

        }
        else if(state is ChangeStatusRejectedSuccessful){
          AccomandtionCubit.get(context).loadOne(id:
              AccomandtionCubit.get(context).getOneAccomandtionModel!.data!.serviceDetails!.serviceId.toString()
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Change Successful'),
              duration: Duration(seconds: 2),
            ),

          );
        }
      },
      builder: (context,state){
        var accomandtionCubit = AccomandtionCubit.get(context);

        return Scaffold(
          body:
          state is GetOneAccomandtionLoading ? const Center(child: CircularProgressIndicator()) :
          SingleChildScrollView(
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
                            AccomandtionCubit.get(context).getAllAccomandtion(skip: 0, take: 10);
                            detailsServices.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: CustomText(
                              text: "Accommodations<<",
                              size: 12.sp,
                              color: darkGrey,
                              fontWeight: FontWeight.w600)),
                      CustomText(
                          text: "${accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.serviceName}.<<",
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
                        onTap : (){
                          AccomandtionCubit.get(context).toggle(0);
                        },
                        child: Container(
                          width: 167.w,
                          height: 50.h,
                          color: AccomandtionCubit.get(context).change == 0 ? orange : white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Image.asset(
                                "assets/images/home/services.png",
                                color: white,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                text: "Service",
                                size: 14.sp,
                                color: white,
                                fontWeight: FontWeight.w600,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          AccomandtionCubit.get(context).toggle(1);
                          accomandtionCubit.getInsightAccomandtion(
                            accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.serviceId.toString()
                          );
                          detailsServices.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                        },
                        child: Container(
                          width: 167.w,
                          height: 50.h,
                          color: AccomandtionCubit.get(context).change == 1 ? orange : white,
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
                          height: 1000,
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
                                    text: "Service Details",
                                    size: 20.sp,
                                    color: black,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  height: 30.h,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.r),
                                  child: Image.network(
                                    accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.images![0],
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
                                               accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.images![index],
                                          width: 60.w,
                                          height: 60.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                      itemCount: accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.images!.length),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                CustomText(
                                    text: "Hotel Title",
                                    size: 16.sp,
                                    color: text,
                                    fontWeight: FontWeight.w600),
                                CustomText(
                                    text: accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.serviceName.toString(),
                                    size: 16.sp,
                                    color: text,
                                    fontWeight: FontWeight.w500),
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
                                    accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.about.toString(),
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: black,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                CustomText(
                                    text: "Amenities host have",
                                    size: 16.sp,
                                    color: text,
                                    fontWeight: FontWeight.w600),
                                GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10.w,
                                    childAspectRatio: (5).h,
                                  ),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.amenityName!.length,
                                  itemBuilder: (context, index) {
                                    var item = [
                                      {
                                        "image": 'assets/images/home/inrernet.png',
                                        "title": accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.amenityName![index],
                                      },
                                      {
                                        "image": 'assets/images/home/air.png',
                                        "title":  accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.amenityName![index],
                                      },
                                      {
                                        "image": 'assets/images/home/inrernet.png',
                                        "title":  accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.amenityName![index],
                                      },
                                    ];
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3.r),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.h),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            item[index]["image"]!,
                                            width: 20.w,
                                            height: 20.h,
                                          ),
                                          SizedBox(height: 10.w),
                                          Text(
                                            item[index]["title"]!,
                                            style: TextStyle(
                                              color: black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                CustomText(
                                    text: " Special features host have",
                                    size: 16.sp,
                                    color: text,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  height: 10.h,
                                ),
                                GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10.w,
                                    childAspectRatio: (5).h,
                                  ),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.specialName!.length,
                                  itemBuilder: (context, index) {
                                    var item = [
                                      {
                                        "image": 'assets/images/home/inrernet.png',
                                        "title": accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.specialName![index],
                                      },
                                      {
                                        "image": 'assets/images/home/air.png',
                                        "title":  accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.specialName![index],
                                      },
                                      {
                                        "image": 'assets/images/home/inrernet.png',
                                        "title":  accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.specialName![index],
                                      },
                                    ];
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3.r),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w, vertical: 10.h),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            item[index]["image"]!,
                                            width: 20.w,
                                            height: 20.h,
                                          ),
                                          SizedBox(height: 10.w),
                                          Text(
                                            item[index]["title"]!,
                                            style: TextStyle(
                                              color: black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                CustomText(
                                    text: " Staff languages",
                                    size: 16.sp,
                                    color: text,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                        text: accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.language.toString(),
                                        size: 14.sp,
                                        color: black,
                                        fontWeight: FontWeight.w500),

                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                CustomText(
                                    text: "Room details",
                                    size: 20.sp,
                                    color: text,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  height: 20.h,
                                ),
                                GridView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.room!.length,
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1.3.h,
                                    crossAxisSpacing: 5.w,
                                    mainAxisSpacing: 10.h,
                                  ),
                                  itemBuilder: (context, index) => Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.room![index].roomType! == "Single"
                                            ?"singleRoom"
                                            : accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.room![index].roomType! == "Double"
                                            ? "doubleRoom"
                                            : accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.room![index].roomType! == "Triple"
                                            ? "threeRoom" : "kingRoom",

                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: black,
                                            fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15.r),
                                        child: Image.network(
                                            accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.room![index].roomImage.toString(),
                                          width: 200.w,
                                          height: 200.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Price" + " : ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: black,
                                                  fontSize: 14.sp),
                                            ),
                                            TextSpan(
                                              text: "${accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.room![index].price.toString()} EGP",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: black,
                                                  fontSize: 14.sp),
                                            ),
                                            TextSpan(
                                              text: "                   Night",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: orange,
                                                  fontSize: 14.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.room![index].includeBreakFast == true ?
                                      Text(
                                        "Price Include BreakFast",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: black,
                                            fontSize: 12.sp),
                                      ) : SizedBox.shrink(),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        children: [
                                          CustomText(
                                              text: " :Enough for ",
                                              size: 14.sp,
                                              color: darkGrey,
                                              fontWeight: FontWeight.w500),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          CustomText(
                                              text: "${accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.room![index].guestsNo.toString()}  Guest",
                                              size: 14.sp,
                                              color: darkGrey,
                                              fontWeight: FontWeight.w500),
                                        ],
                                      )
                                    ],
                                  ),
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
                                    backgroundImage: NetworkImage(
                                        accomandtionCubit.getOneAccomandtionModel!.data!.companyDetails!.image.toString()),
                                  ),
                                  CustomText(
                                    text: accomandtionCubit.getOneAccomandtionModel!.data!.companyDetails!.title.toString(),
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
                                        text: accomandtionCubit.getOneAccomandtionModel!.data!.companyDetails!.owner.toString(),
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
                                        text: accomandtionCubit.getOneAccomandtionModel!.data!.companyDetails!.status.toString(),
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
                                          accomandtionCubit.changeStatusAccomandtionRejected(
                                            accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.serviceId.toString()
                                          );
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
                                            text: "Rejected ",
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
                                          accomandtionCubit.changeStatusAccomandtionAccepted(
                                              accomandtionCubit.getOneAccomandtionModel!.data!.serviceDetails!.serviceId.toString()
                                          );

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
                                            text: "Accepted ",
                                            size: 16.sp,
                                            color: black,
                                            fontWeight: FontWeight.w600,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ) ,
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: CustomText(
                                      text: "Contact Details",
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
                                        Image.asset(
                                            "assets/images/home/address.png"),
                                        CustomText(
                                            text:
                                            accomandtionCubit.getOneAccomandtionModel!.data!.companyDetails!.address.toString(),
                                            size: 16.sp,
                                            color: black,
                                            fontWeight: FontWeight.w400)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                                    child: CustomText(
                                      text: accomandtionCubit.getOneAccomandtionModel!.data!.companyDetails!.addressLink.toString(),
                                      size: 16.sp,
                                      color: orange,
                                      fontWeight: FontWeight.w400,
                                      alignment: Alignment.centerLeft,
                                      textDecoration: TextDecoration.underline,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      children: [
                                        Image.asset("assets/images/home/phon.png"),
                                        CustomText(
                                            text: accomandtionCubit.getOneAccomandtionModel!.data!.companyDetails!.phone.toString(),
                                            size: 16.sp,
                                            color: black,
                                            fontWeight: FontWeight.w400)
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
                                        Image.asset(
                                            "assets/images/home/location.png"),
                                        CustomText(
                                          text: accomandtionCubit.getOneAccomandtionModel!.data!.companyDetails!.website.toString(),
                                          size: 16.sp,
                                          color: orange,
                                          fontWeight: FontWeight.w400,
                                          textDecoration: TextDecoration.underline,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),

                          state is GetReviewSuccessful ?

                          Container(
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius:
                                BorderRadiusDirectional.circular(20.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 10.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: "Service Reviews",
                                      size: 20.sp,
                                      color: black,
                                      fontWeight: FontWeight.w600),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: "Overall Rating",
                                        size: 16.sp,
                                        color: Color.fromRGBO(53, 71, 100, 1),
                                        fontWeight: FontWeight.w700,
                                      ),
                                      SizedBox(
                                        width: 30.w,
                                      ),
                                      CustomText(
                                        text: "Recommend",
                                        size: 16.sp,
                                        color: Color.fromRGBO(53, 71, 100, 1),
                                        fontWeight: FontWeight.w700,
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
                                        text: accomandtionCubit.getReviewModel!.data!.totalRate.toString(),
                                        size: 24.sp,
                                        color: black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      SizedBox(
                                        width: 85.w,
                                      ),
                                      CustomText(
                                        text: accomandtionCubit.getReviewModel!.data!.recomendPercent.toString(),
                                        size: 24.sp,
                                        color: black,
                                        fontWeight: FontWeight.w700,
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
                                        text: accomandtionCubit.getReviewModel!.data!.reviewrsCount.toString(),
                                        size: 14.sp,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      CustomText(
                                        text: "Reviews",
                                        size: 14.sp,
                                        color: black,
                                        fontWeight: FontWeight.w400,
                                      ),

                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(color: white),
                                    child: SizedBox(
                                      height: 400.h,
                                      child: ListView.builder(
                                          itemCount: accomandtionCubit.getReviewModel!.data!.usersReviews.length,
                                          itemBuilder: (context, index) => Padding(
                                            padding: EdgeInsets.only(
                                                top: 5.h,
                                                right: 20.w,
                                                left: 20.w),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                ListTile(
                                                  contentPadding:
                                                  EdgeInsets.zero,
                                                  leading: const CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        "assets/images/home/profile.png"),
                                                  ),
                                                  title: Text(
                                                    accomandtionCubit.getReviewModel!.data!.usersReviews[index].userName.toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w700,
                                                        color: const Color.fromRGBO(
                                                            17, 17, 17, 1),
                                                        fontSize: 14.sp),
                                                  ),
                                                  subtitle: Text(
                                                    accomandtionCubit.getReviewModel!.data!.usersReviews[index].time.toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w700,
                                                        color: const Color.fromRGBO(
                                                            126, 126, 126, 1),
                                                        fontSize: 12.sp),
                                                  ),
                                                  trailing: SizedBox(
                                                    width: 100.w,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                      children: List.generate(
                                                        accomandtionCubit.getReviewModel!.data!.usersReviews[index].rate!.toInt(),
                                                            (index) => Icon(
                                                          Icons.star_rounded,
                                                          color: orange,
                                                          size: 20.r,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                    accomandtionCubit.getReviewModel!.data!.usersReviews[index].comment.toString(),
                                                  // "Services.contentComment".tr(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w400,
                                                      color: const Color.fromRGBO(
                                                          97, 97, 97, 1),
                                                      fontSize: 14.sp),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ) : const Center(child: CircularProgressIndicator()),
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
