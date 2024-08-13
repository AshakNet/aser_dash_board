import 'dart:io';

import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/home/home_cubit.dart';
import 'package:aser_dash_board/logic/home/home_state.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class Showdetailsblog extends StatelessWidget {
PageController controller = PageController();

   Showdetailsblog({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body:
          state is GetOneBlogLoading ? Center(child: CircularProgressIndicator()) :
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          controller.animateToPage(0, duration: Duration(milliseconds: 30), curve: Curves.easeIn);
                        },
                        child: CustomText(text: "Dashboard  ", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w600)),
                    CustomText(text: "Blog Details >> ", size: 12.sp, color: black, fontWeight: FontWeight.w700)

                  ],
                ),
                SizedBox(height: 30.h,),

                Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(20.r),
                      color: white
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 200.w,vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(text: "Status", size: 18.sp, color: black, fontWeight: FontWeight.w700),
                            SizedBox(width: 10.w,),
                            Container(
                              width: 70.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.circular(10.r),color: Color.fromRGBO(231, 248, 240, 1)
                              ),
                              child: CustomText(text: HomeCubit.get(context).getOneBlogModel!.data!.status.toString(), size: 12.sp, color: Color.fromRGBO(65, 197, 136, 1), fontWeight: FontWeight.w600,alignment: Alignment.center,),
                            ),
                            Spacer(),
                            Icon(Icons.edit_calendar,color: orange,),
                            SizedBox(width: 5.w,),
                            CustomText(text: "Edit Ad", size: 18.sp, color: orange, fontWeight: FontWeight.w600,textDecoration: TextDecoration.underline,)
                          ],
                        ),
                        SizedBox(height: 20.h,),
                        CustomText(text: "Article Title", size: 14.sp, color: black, fontWeight: FontWeight.w600),
                        Row(
                          children: [
                            SizedBox(
                              width:  447.w,
                              child: TextFormField(
                                controller: TextEditingController(),
                                maxLines: 1,
                                readOnly: HomeCubit.get(context).read,
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
                                    fontSize: 8.sp,
                                    color: darkGrey,
                                  ),
                                  hintText: '${HomeCubit.get(context).getOneBlogModel!.data!.title.toString()}',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide(color: orange),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 75.w,),
                            HomeCubit.get(context).read == true ? Container(
                              width: 210.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: darkGrey)
                              ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  children: [
                                    CustomText(text: "${HomeCubit.get(context).getOneBlogModel!.data!.category.toString()} ", size: 18.sp, color: darkGrey, fontWeight: FontWeight.w600),
                                   Spacer(),
                                   Icon(Icons.keyboard_arrow_down,size: 18.sp,)
                                  ],
                                ),
                              ),
                            ) :
                            Container(

                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadiusDirectional.circular(10.r),
                                  border: Border.all(color: darkGrey)
                              ),
                              child: Padding(

                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: SizedBox(
                                  width: 150.w,
                                  child: DropdownButton(
                                      menuMaxHeight: 200.0,

                                      isExpanded: true,
                                      focusColor: white,
                                      dropdownColor: white,

                                      icon: Align(
                                          alignment: Alignment.center,
                                          child: Icon(Icons.keyboard_arrow_down,
                                              color: orange, size: 30.sp)),
                                      borderRadius: BorderRadius.circular(10.r),
                                      underline: SizedBox(),

                                      value: HomeCubit.get(context).choseHours,
                                      hint: CustomText(text: "BlogType", size: 12.sp, color: black, fontWeight: FontWeight.w600),
                                      items: [
                                        "Product",
                                        "Active",
                                        "Activity"
                                      ]
                                          .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: 20.w),
                                          child: CustomText(
                                            text: e,
                                            color: orange,
                                            fontWeight: FontWeight.w700,
                                            size: 14.sp,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ))
                                          .toList(),
                                      onChanged: (val) {
                                        HomeCubit.get(context)
                                            .choseHoursFunction(val);
                                      }),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 30.h,),
                        CustomText(text: "Article  Content", size: 14.sp, color: black, fontWeight: FontWeight.w600),
                        SizedBox(
                          width:  710.w,
                          child: TextFormField(
                            readOnly: HomeCubit.get(context).read,
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
                                fontSize: 8.sp,
                                color: darkGrey,
                              ),
                              hintText: '${HomeCubit.get(context).getOneBlogModel?.data?.contant.toString()}',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide(color: orange),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h,),

                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: " Article Start Date ", size: 14.sp, color: black, fontWeight: FontWeight.w600),

                                SizedBox(
                                  width:  346.w,
                                  child: TextFormField(
                                    controller: HomeCubit.get(context).startDate,

                                    maxLines: 1,minLines: 1,

                                    validator: (value) {},
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                    ),
                                    readOnly: HomeCubit.get(context).read,
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
                                      suffixIcon: Icon(Icons.date_range),

                                      hintStyle: TextStyle(
                                        fontSize: 8.sp,
                                        color: darkGrey,

                                      ),
                                      hintText: HomeCubit.get(context).getOneBlogModel!.data!.startDate.toString(),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.r),
                                        borderSide: BorderSide(color: orange),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: " Article  End Date", size: 14.sp, color: black, fontWeight: FontWeight.w600),

                                SizedBox(
                                  width:  346.w,
                                  child: TextFormField(
                                    controller: HomeCubit.get(context).endDate,
                                    maxLines: 1,minLines: 1,
                                    readOnly: HomeCubit.get(context).read,

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
                                      suffixIcon: Icon(Icons.date_range),

                                      hintStyle: TextStyle(
                                        fontSize: 8.sp,
                                        color: darkGrey,

                                      ),
                                      hintText: HomeCubit.get(context).getOneBlogModel!.data!.endDate.toString(),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.r),
                                        borderSide: BorderSide(color: orange),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 30.h,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: " Article cover", size: 14.sp, color: black, fontWeight: FontWeight.w600),

                            SizedBox(height: 10.h,),

                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: Image.network(
                                HomeCubit.get(context).getOneBlogModel!.data!.imageName.toString(),
                                height: 200.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 30.h,),
                        Center(
                          child: Container(
                            width: 130.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadiusDirectional.circular(20.r)
                            ),
                            child: CustomText(text: "Stop This blog", size: 14.sp, color: white, fontWeight: FontWeight.w600,alignment: Alignment.center,),

                          ),
                        )




                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },

    );
  }
}
