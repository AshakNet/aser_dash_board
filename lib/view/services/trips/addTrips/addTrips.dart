import 'dart:io';

import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/trips_cubit/tripe_cubit.dart';
import 'package:aser_dash_board/logic/trips_cubit/trips_state.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:aser_dash_board/widgets/formField/formField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddTrips extends StatelessWidget {
  PageController addTrips = PageController();

   AddTrips({super.key,required this.addTrips});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<TripsCubit,TripsState>(
      listener: (context,state){
        if(state is CreateTripsLoading){
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Center(
                  child: CircularProgressIndicator(
                    color: orange,
                  ));
            },
          );
        }
        else if(state is CreateTripsSuccessful){
          // TripsCubit.get(context).getAllTrips(skip: 0, take: 10);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Create Trips Successful'),
              duration: Duration(seconds: 2),
            ),
          );
          Navigator.pop(context);
        }
        else if(state is CreateTripsError){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Colors.red,
              content: Text(state.error),
              duration: const Duration(seconds: 2),
            ),
          );
          Navigator.pop(context);
        }
      },
      builder: (context,state){
        return Scaffold(
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.h),
            child: SingleChildScrollView(
              child: Form(
                key: TripsCubit.get(context).formKey,
                child: Column(

                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                      child: Row(
                        children: [
                          CustomText(
                              text: "Services",
                              size: 12.sp,
                              color: darkGrey,
                              fontWeight: FontWeight.w600),
                          SizedBox(
                            width: 5.w,
                          ),
                          GestureDetector(
                              onTap: () {
                                addTrips.animateToPage(0,
                                    duration: const Duration(milliseconds: 5),
                                    curve: Curves.easeIn);
                                TripsCubit.get(context).getAllTrips(skip: 0, take: 10);
                              },
                              child: CustomText(
                                  text: "Trips<<",
                                  size: 12.sp,
                                  color: darkGrey,
                                  fontWeight: FontWeight.w600)),
                          GestureDetector(
                            onTap: (){
                              addTrips.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                            child: CustomText(
                                text: "Add Trip<<",
                                size: 12.sp,
                                color: black,
                                fontWeight: FontWeight.w700),
                          ),

                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 60,
                            child: Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 40.h),
                                    child: CustomText(text: "Trip Details", size: 18.sp, color: black, fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                  ),

                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(text: "Trip Heading", size: 14.sp, color: black, fontWeight: FontWeight.w500,alignment: Alignment.centerLeft,),
                                  ),

                                  SizedBox(height: 10.h,),

                                  textFormFildBuilder(context, width: 597.w, hint: "Enter the trip name", controller: TripsCubit.get(context).tripName, validation: (value){
                                    if (value!.isEmpty) {
                                      return "Please Enter name";
                                    }
                                  }),

                                  SizedBox(height: 10.h,),

                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(text: "The number of available seats", size: 14.sp, color: black, fontWeight: FontWeight.w500,alignment: Alignment.centerLeft,),
                                  ),
                                  SizedBox(height: 10.h,),
                                  Padding(

                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: SizedBox(
                                      width:597.w ,

                                      child: TextFormField(
                                        controller: TripsCubit.get(context).numberOfSeats,
                                        maxLines: 1,
                                        minLines: 1,


                                        validator: (value){
                                          if (value!.isEmpty) {
                                            return "Please Enter numberOfSeats";
                                          }
                                        },
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly, // Allow only digits
                                        ],
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(


                                          fillColor: Color.fromRGBO(247, 247, 247, 1),
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
                                          hintText: "Enter the number of available seats",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.r),
                                            borderSide: BorderSide(color: orange),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),



                                  SizedBox(height: 10.h,),

                                  Row(
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                        child: CustomText(text: "Trip Price (EGP)", size: 14.sp, color: black, fontWeight: FontWeight.w500,alignment: Alignment.centerLeft,),
                                      ),

                                      SizedBox(width: 200.w,),

                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                        child: CustomText(text: "Trip Price per person (EGP)", size: 14.sp, color: black, fontWeight: FontWeight.w500,alignment: Alignment.centerLeft,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h,),

                                  Row(
                                    children: [
                                      Padding(

                                        padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                        child: SizedBox(
                                          width:280.w ,

                                          child: TextFormField(
                                            controller: TripsCubit.get(context).tripPrice,
                                            maxLines: 1,
                                            minLines: 1,


                                            validator: (value){
                                              if (value!.isEmpty) {
                                                return "Please Enter price";
                                              }
                                            },
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly, // Allow only digits
                                            ],
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(


                                              fillColor: const Color.fromRGBO(247, 247, 247, 1),
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
                                              hintText: "Enter the trip price",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                                borderSide: BorderSide(color: orange),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5.w,),
                                      Padding(

                                        padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                        child: SizedBox(
                                          width:280.w ,

                                          child: TextFormField(
                                            controller: TripsCubit.get(context).tripPricePerPerson,
                                            maxLines: 1,
                                            minLines: 1,


                                            validator: (value){
                                              if (value!.isEmpty) {
                                                return "Please Enter PricePerPerson";
                                              }
                                            },
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly, // Allow only digits
                                            ],
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(


                                              fillColor: Color.fromRGBO(247, 247, 247, 1),
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
                                              hintText: "Enter the person price",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                                borderSide: BorderSide(color: orange),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )





                                    ],
                                  ),
                                  SizedBox(height: 10.h,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(text: "Enter the Description", size: 14.sp, color: black, fontWeight: FontWeight.w500,alignment: Alignment.centerLeft,),
                                  ),
                                  SizedBox(height: 10.h,),

                                  textFormFildBuilder(context, width: 579.w, hint: "Trip Description", controller: TripsCubit.get(context).tripsDescription, validation: (value){
                                    if (value!.isEmpty) {
                                      return "Please Enter description";
                                    }
                                  },manLines: 4,maxLines: 5),

                                  SizedBox(height: 10.h,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(text: "Trip Rules", size: 14.sp, color: black, fontWeight: FontWeight.w500,alignment: Alignment.centerLeft,),
                                  ),
                                  SizedBox(height: 10.h,),

                                  textFormFildBuilder(context, width: 579.w, hint: "Enter the trip rules", controller: TripsCubit.get(context).tripsRules, validation: (value){
                                    if (value!.isEmpty) {
                                      return "Please Enter tripRules";
                                    }
                                  },manLines: 4,maxLines: 5),

                                  SizedBox(height: 10.h,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(text: "Photo of destination", size: 14.sp, color: black, fontWeight: FontWeight.w500,alignment: Alignment.centerLeft,),
                                  ),
                                  SizedBox(height: 10.h,),

                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Container(
                                      width: 708.w,



                                      decoration: BoxDecoration(
                                          border: Border.all(color: darkGrey),
                                          borderRadius: BorderRadiusDirectional.circular(20.r)
                                      ),
                                      child: GestureDetector(
                                        onTap: (){
                                          TripsCubit.get(context).getImage(ImageSource.gallery);

                                        },
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/images/home/upload.png",color: orange,),

                                            SizedBox(height: 15.h,),
                                            CustomText(text: " Upload photo", size: 14.sp, color: orange, fontWeight: FontWeight.w600),
                                            TripsCubit.get(context).image == null  ? SizedBox.shrink() :
                                            Image.file(
                                              //height: 100.h,fit: BoxFit.cover,width: double.infinity,
                                                File(TripsCubit.get(context)
                                                    .image!
                                                    .path))



                                          ],
                                        ),
                                      ),
                                    ),
                                  ),





                                ],
                              ),


                            )),
                        SizedBox(width: 40.w,),

                        Expanded(
                            flex: 40,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: white,
                                  ),

                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(vertical: 20.h),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                          child: CustomText(text: "Destination Details", size: 18.sp, color: black, fontWeight: FontWeight.w700,alignment: Alignment.bottomLeft,),
                                        ),
                                        SizedBox(height: 20.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(

                                                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                                  child: CustomText(text: "Meeting Point", size: 14.sp, color: black, fontWeight: FontWeight.w500),
                                                ),
                                                SizedBox(height: 10.h,),
                                                textFormFildBuilder(context, width: 178.w,read: true,
                                                    onTap: (){
                                                     TripsCubit.get(context).PickDate(context : context,
                                                     controller:     TripsCubit.get(context).meetingPoint,
                                                         first: DateTime.now(),
                                                         lastTime: DateTime(2030)
                                                     );
                                                    },
                                                    hint: "Enter meeting point", controller: TripsCubit.get(context).meetingPoint, validation: (value){
                                                  if (value!.isEmpty) {
                                                    return "Please Enter startDate";
                                                  }
                                                })
                                              ],
                                            ),

                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(

                                                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                                  child: CustomText(text: "Trip Destination ", size: 14.sp, color: black, fontWeight: FontWeight.w500),
                                                ),
                                                SizedBox(height: 10.h,),
                                                textFormFildBuilder(context, width: 178.w,
                                                    read: true,
                                                    onTap: (){
                                                      TripsCubit.get(context).PickDate(context :context,
                                                          first: DateTime.now(),
                                                          lastTime: DateTime(2030),
                                                          controller:  TripsCubit.get(context).tripDestention);

                                                    },
                                                    hint: "Enter destination ", controller: TripsCubit.get(context).tripDestention, validation: (value){
                                                  if (value!.isEmpty) {
                                                    return "Please Enter destination";
                                                  }
                                                })
                                              ],
                                            )

                                          ],
                                        ),
                                        SizedBox(height: 20.h,),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                          child: CustomText(text: "Date Details", size: 18.sp, color: black, fontWeight: FontWeight.w700,alignment: Alignment.bottomLeft,),
                                        ),
                                        SizedBox(height: 20.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(

                                                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                                  child: CustomText(text: "Trip Start Date", size: 14.sp, color: black, fontWeight: FontWeight.w500),
                                                ),
                                                SizedBox(height: 10.h,),
                                                textFormFildBuilder(context, width: 178.w,
                                                    read:  true,
                                                    onTap: (){
                                                      TripsCubit.get(context).PickDate(context :context,

                                                          first: DateTime.now(),
                                                          lastTime: DateTime(2030),
                                                          controller:  TripsCubit.get(context).tripsStartDate);

                                                    },
                                                    hint: "Enter start date ", controller: TripsCubit.get(context).tripsStartDate, validation: (value){
                                                  if (value!.isEmpty) {
                                                    return "Please Enter startDate";
                                                  }
                                                },
                                                    icon: IconButton(onPressed: (){}, icon: const Icon(Icons.date_range_outlined))
                                                )
                                              ],
                                            ),

                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(

                                                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                                  child: CustomText(text: "Enter end date", size: 14.sp, color: black, fontWeight: FontWeight.w500),
                                                ),
                                                SizedBox(height: 10.h,),
                                                textFormFildBuilder(context, width: 178.w,
                                                    read: true,
                                                    onTap: (){
                                                      TripsCubit.get(context).PickDate(context : context, controller:  TripsCubit.get(context).tripsEndDate,
                                                          first: DateTime.now(),
                                                          lastTime: DateTime(2030)
                                                      );

                                                    },
                                                    hint: "Enter end date", controller: TripsCubit.get(context).tripsEndDate, validation: (value){
                                                  if (value!.isEmpty) {
                                                    return "Please Enter end Date";
                                                  }
                                                },
                                                    icon: IconButton(onPressed: (){}, icon: const Icon(Icons.date_range_outlined))
                                                )
                                              ],
                                            )

                                          ],
                                        ),
                                        SizedBox(height: 20.h,),

                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                          child: CustomText(text: "Company Details", size: 18.sp, color: black, fontWeight: FontWeight.w700,alignment: Alignment.bottomLeft,),
                                        ),
                                        SizedBox(height: 20.h,),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                          child: CustomText(text: "Company Name", size: 14.sp, color: black, fontWeight: FontWeight.w500,alignment: Alignment.bottomLeft,),
                                        ),
                                        SizedBox(height: 20.h,),
                                        Container(

                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius: BorderRadiusDirectional.circular(10.r),
                                              border: Border.all(color: darkGrey)
                                          ),
                                          child: Padding(

                                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                                            child: SizedBox(

                                              child: DropdownButton(
                                                  menuMaxHeight: 200.0,hint: CustomText(text: "enter company name", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w600),

                                                  isExpanded: true,
                                                  focusColor: white,
                                                  dropdownColor: white,

                                                  icon: Align(
                                                      alignment: Alignment.center,
                                                      child: Icon(Icons.keyboard_arrow_down,
                                                          color: orange, size: 30.sp)),
                                                  borderRadius: BorderRadius.circular(10.r),
                                                  underline: SizedBox(),
                                                  value: TripsCubit.get(context).selectCompanyVar,

                                                  items: TripsCubit.get(context).getAllCompanyModel?.data
                                                      ?.map((e) => DropdownMenuItem(
                                                    value: e.id,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 20.w),

                                                      child: CustomText(
                                                        text: e.name.toString(),
                                                        color: orange,
                                                        fontWeight: FontWeight.w700,
                                                        size: 14.sp,
                                                        alignment: Alignment.center,
                                                      ),
                                                    ),
                                                  ))
                                                      .toList(),
                                                  onChanged: (val) {
                                                    TripsCubit.get(context)
                                                        .selectCompany(val);
                                                    print(val);
                                                  }),
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),

                                ),

                                SizedBox(height: 40.h,),

                                GestureDetector(
                                  onTap: (){
                                    if(TripsCubit.get(context).formKey.currentState!.validate()){
                                      if(TripsCubit.get(context).selectCompanyVar == null){
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            backgroundColor:darkGrey ,
                                            content: const Text('Please enter companyName'),
                                            duration: const Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                      else {
                                        TripsCubit.get(context).addTrips();
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusDirectional.circular(10.r),
                                        color: orange
                                    ),
                                    child: CustomText(text: "Add Trip", size: 16.sp, color: white, fontWeight: FontWeight.w600,alignment: Alignment.center,),
                                  ),
                                ),
                                SizedBox(height: 20.h,),
                                Container(
                                  width: double.infinity,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: darkGrey),
                                    borderRadius: BorderRadiusDirectional.circular(10.r),

                                  ),
                                  child: CustomText(text: "Clear", size: 16.sp, color: orange, fontWeight: FontWeight.w600,alignment: Alignment.center,),
                                )
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
