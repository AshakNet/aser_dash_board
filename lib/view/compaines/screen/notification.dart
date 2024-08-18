import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/compaines/compaines_state/compaines_state.dart';
import 'package:aser_dash_board/logic/compaines/compines_cubit/companies_Cubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCompaines extends StatelessWidget {
  PageController notification = PageController();
  PageController sendNotification = PageController();

  NotificationCompaines({super.key,required this.notification});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompaniesCubit,CompaniesState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: Column(
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
                      onTap: (){
                        notification.animateToPage(0, duration: const Duration(microseconds: 30), curve: Curves.easeIn);
                      },
                      child: CustomText(
                          text: "Companies<<",
                          size: 12.sp,
                          color: darkGrey,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomText(
                        text: "Al Amal company<<",
                        size: 12.sp,
                        color: black,
                        fontWeight: FontWeight.w700),
                  ],
                ),
              ),

              SizedBox(height: 40.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  children: [

                    GestureDetector(
                      onTap:(){
                        CompaniesCubit.get(context).toggle(0);
                        notification.animateToPage(1, duration: const Duration(milliseconds: 30), curve: Curves.easeIn);

                      },
                      child: Container(
                        width: 167.w,
                        height: 50.h,
                        color:CompaniesCubit.get(context).change == 0 ? orange : white
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
                        notification.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.easeIn);

                        CompaniesCubit.get(context).toggle(2);

                      },
                      child: Container(
                        width: 167.w,
                        height: 50.h,
                        color: CompaniesCubit.get(context).change == 2 ? orange : white,
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

                    GestureDetector(
                      onTap: (){

                        //companyDetails.animateToPage(4, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                        CompaniesCubit.get(context).toggle(1);


                      },
                      child: Container(
                        width: 167.w,
                        height: 50.h,
                        color:  CompaniesCubit.get(context).change == 1 ? orange : white,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            Image.asset(
                              "assets/images/home/notification.png",
                              color: black,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            CustomText(
                              text: "Notifications",
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
              SizedBox(height: 40.h,),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 50.w),
                child: Row(
                  children: [
                    Expanded(
                      flex:60,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(15.r),
                          color: white,
                        ),

                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.h),
                          child: SizedBox(
                            height: 600.h,
                            child: PageView(
                              controller: sendNotification,
                              children: [
                                /// 1
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(text: "Notifications", size: 20.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),

                                        GestureDetector(
                                          onTap: (){
                                            sendNotification.animateToPage(1, duration: Duration(milliseconds: 30), curve: Curves.easeIn);
                                          },
                                          child: Container(
                                            width: 191.w,
                                            height: 50.h,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadiusDirectional.circular(15.r),
                                                color: orange

                                            ),
                                            child: CustomText(text: "Send a notification", size: 18.sp, color: white, fontWeight: FontWeight.w400,alignment: Alignment.center,),
                                          ),
                                        ),



                                      ],
                                    ),

                                    SizedBox(height: 20.h,),

                                    SizedBox(
                                      height: 500.h,
                                      child:

                                      ListView.separated(itemBuilder: (context,index)=>Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 40.r,
                                                backgroundImage: AssetImage(
                                                    "assets/images/home/pesrson.png"),

                                              ),

                                              SizedBox(width: 5.w,),

                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(text: "Your service is under review", size: 16.sp, color: black, fontWeight: FontWeight.w600),
                                                  SizedBox(height: 10.h,),

                                                  Row(
                                                    children: [
                                                      CustomText(text: "Today", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w400),
                                                      SizedBox(width: 10.w,),
                                                      CustomText(text: "|", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w400),
                                                      SizedBox(width: 10.w,),
                                                      CustomText(text: "09:56 AM", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w400),


                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10.h,),
                                          Text("Your request is under review by the administration. Once it’s live, we’ll notify you with instructions and details.",style: TextStyle(
                                              color: black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400


                                          ),)
                                        ],
                                      ), separatorBuilder:(context,index)=> SizedBox(height: 20.h,), itemCount: 10),
                                    )


                                  ],
                                ),

                                /// 2
                                ///
                                ListView(
                                 children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       IconButton(onPressed: (){
                                         sendNotification.previousPage(duration: Duration(milliseconds: 30), curve: Curves.easeIn);
                                       }, icon: const Icon(Icons.keyboard_arrow_left)),

                                       CustomText(text: "Notifications", size: 20.sp, color: black, fontWeight: FontWeight.w600),

                                       SizedBox(height: 20.h,),

                                       CustomText(text: "Notification Title", size: 14.sp, color: black, fontWeight: FontWeight.w700),

                                       SizedBox(height: 5.h,),
                                       SizedBox(
                                         width:  600.w,
                                         child: TextFormField(
                                           controller: TextEditingController(),
                                           maxLines: 1,minLines: 1,
                                           validator: (value) {},
                                           style: TextStyle(
                                             fontSize: 16.sp,
                                             color: Colors.black,
                                           ),
                                           decoration: InputDecoration(

                                             //filled: true,

                                             fillColor: Color.fromRGBO(247, 247, 247, 1),
                                             contentPadding: EdgeInsets.symmetric(
                                               horizontal: 13.w,
                                               vertical: 5.h,
                                             ),
                                             constraints: BoxConstraints(
                                               minHeight: 64.h,
                                               minWidth: 372.w,
                                             ),

                                             hintStyle: TextStyle(
                                                 fontSize: 16.sp,
                                                 color: darkGrey,
                                                 fontWeight: FontWeight.w400
                                             ),
                                             hintText: 'Title',
                                             border: OutlineInputBorder(
                                               borderRadius: BorderRadius.circular(8.r),
                                               borderSide: BorderSide(color: orange),
                                             ),
                                           ),
                                         ),
                                       ),

                                       CustomText(text: "Notification Content", size: 14.sp, color: black, fontWeight: FontWeight.w700),

                                       SizedBox(height: 5.h,),
                                       SizedBox(
                                         width:  600.w,
                                         child: TextFormField(
                                           controller: TextEditingController(),
                                           maxLines: 4,minLines: 3,
                                           validator: (value) {},
                                           style: TextStyle(
                                             fontSize: 16.sp,
                                             color: Colors.black,
                                           ),
                                           decoration: InputDecoration(

                                             //filled: true,

                                             fillColor: Color.fromRGBO(247, 247, 247, 1),
                                             contentPadding: EdgeInsets.symmetric(
                                               horizontal: 13.w,
                                               vertical: 5.h,
                                             ),
                                             constraints: BoxConstraints(
                                               minHeight: 64.h,
                                               minWidth: 372.w,
                                             ),


                                             hintStyle: TextStyle(
                                                 fontSize: 16.sp,
                                                 color: darkGrey,
                                                 fontWeight: FontWeight.w400
                                             ),
                                             hintText: 'Placeholder',
                                             border: OutlineInputBorder(
                                               borderRadius: BorderRadius.circular(8.r),
                                               borderSide: BorderSide(color: orange),
                                             ),
                                           ),
                                         ),
                                       ),

                                       SizedBox(height: 20.h,),
                                       
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.end,
                                         children: [
                                           Container(
                                             width: 120.w,
                                             height: 40.h,

                                             decoration: BoxDecoration(
                                               borderRadius: BorderRadiusDirectional.circular(10.r),
                                               color: orange,


                                             ),
                                             child: CustomText(text: "Send", size: 18.sp, color: white, fontWeight: FontWeight.w400,alignment: Alignment.center,),
                                           ),
                                         ],
                                       ),

                                       SizedBox(

                                         child:

                                         ListView.separated(
                                             shrinkWrap: true,
                                             itemBuilder: (context,index)=>Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 Row(
                                                   children: [
                                                     CircleAvatar(
                                                       radius: 40.r,
                                                       backgroundImage: AssetImage(
                                                           "assets/images/home/pesrson.png"),

                                                     ),

                                                     SizedBox(width: 5.w,),

                                                     Column(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: [
                                                         CustomText(text: "Your service is under review", size: 16.sp, color: black, fontWeight: FontWeight.w600),
                                                         SizedBox(height: 10.h,),

                                                         Row(
                                                           children: [
                                                             CustomText(text: "Today", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w400),
                                                             SizedBox(width: 10.w,),
                                                             CustomText(text: "|", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w400),
                                                             SizedBox(width: 10.w,),
                                                             CustomText(text: "09:56 AM", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w400),


                                                           ],
                                                         )
                                                       ],
                                                     )
                                                   ],
                                                 ),
                                                 SizedBox(height: 10.h,),
                                                 Text("Your request is under review by the administration. Once it’s live, we’ll notify you with instructions and details.",style: TextStyle(
                                                     color: black,
                                                     fontSize: 14.sp,
                                                     fontWeight: FontWeight.w400


                                                 ),)
                                               ],
                                             ), separatorBuilder:(context,index)=> SizedBox(height: 20.h,), itemCount: 10),
                                       )


                                     ],
                                   )
                                 ],
                                ),
                              ],
                            ),
                          ),
                        ),

                      ),
                    ),
                    SizedBox(width: 50.w,),
                    Expanded(
                      flex: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(15.r),
                          color: white,
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical: 20.h),
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
                                      text: "Delete  ",
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
                                      text: "Restrict ",
                                      size: 16.sp,
                                      color: black,
                                      fontWeight: FontWeight.w600,
                                      alignment: Alignment.center,
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 20.h,),
                              Column(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(text: "Company profile", size: 20.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                  ),
                                  SizedBox(height: 30.h,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Row(

                                      children: [
                                        CustomText(
                                          text:
                                          " : Service",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                        SizedBox(width: 10.h,),

                                        CustomText(
                                          text:
                                          "Accommodation",
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
                                          " : Governate ",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                        SizedBox(width: 10.h,),

                                        CustomText(
                                          text:
                                          "Cairo",
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
                                          " : Address",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                        SizedBox(width: 10.h,),

                                        CustomText(
                                          text:
                                          "Address",
                                          size: 14.sp,
                                          color: orange,
                                          textDecoration: TextDecoration.underline,
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
                                          " : Website ",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                        SizedBox(width: 10.h,),

                                        CustomText(
                                          text:
                                          "Website",
                                          size: 14.sp,
                                          color: orange,
                                          textDecoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w400,alignment: Alignment.centerRight,),


                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 20.h,),
                              /// owner profile
                              Column(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CustomText(text: "Owner profile", size: 20.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                                  ),
                                  SizedBox(height: 30.h,),
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
                                          "Esraa Badwy",
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
                                          " : Email Address",
                                          size: 14.sp,
                                          color: black,
                                          fontWeight: FontWeight.w700,alignment: Alignment.centerLeft,),
                                        SizedBox(width: 10.h,),

                                        CustomText(
                                          text:
                                          "mo3tzelrawy151@gmail.com",
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
                                          "01117191258",
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
                              )

                            ],
                          ),
                        ),

                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
