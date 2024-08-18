import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationContent extends StatelessWidget {

  PageController notificationContent =PageController();
   NotificationContent({super.key,required this.notificationContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onTap: (){
                      notificationContent.animateToPage(0, duration: const Duration(microseconds: 30), curve: Curves.easeIn);
                    },
                    child: CustomText(
                        text: "Notifications<<",
                        size: 12.sp,
                        color: black,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
        
                ],
              ),
            ),
        
            SizedBox(height: 40.h,),
        
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 40.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15.r),
                        color: white,

                      ),child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 40.w,vertical: 30.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          CustomText(text: "Notifications", size: 20.sp, color: black, fontWeight: FontWeight.w600),

                          SizedBox(height: 10.h,),
                          CustomText(text: "Target", size: 20.sp, color: black, fontWeight: FontWeight.w600),
                          SizedBox(height: 10.h,),

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
                                hintText: 'Search',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: BorderSide(color: orange),
                                ),
                              ),
                            ),
                          ),

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
                              maxLines: 6,minLines: 5,
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


                        ],
                                            ),
                      ),
                    ),
                  ),

                  SizedBox(width: 30.w,),

                  Expanded(
                    flex: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15.r),
                        color: white,

                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
                        child: Column(
                          children: [
                            CustomText(text: "Notification", size: 20.sp, color: black, fontWeight: FontWeight.w600,alignment: Alignment.centerLeft,),
                            SizedBox(height: 20.h,),
                            SizedBox(
                              height: 600.h,

                              child:

                              ListView.separated(

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
                        ),
                      ),
                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
