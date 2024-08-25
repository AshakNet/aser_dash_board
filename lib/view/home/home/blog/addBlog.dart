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

class AddBlog extends StatelessWidget {
  PageController controller = PageController();
   AddBlog({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){
        if(state is CreateBlogLoading){
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

        else if(state is CreateBlogSuccessful){
          HomeCubit.get(context).getAllBlog(skip: 0, take: 10);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Create Blog Successful'),
              duration: Duration(seconds: 2),
            ),
          );

          Navigator.pop(context);

          HomeCubit.get(context).title.clear();
          HomeCubit.get(context).content.clear();
          HomeCubit.get(context).startDateAddBlog.clear();
          HomeCubit.get(context).endDateAddBlog.clear();



        }

        else if(state is CreateBlogError){
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
            padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
            child: SingleChildScrollView(
              child: Form(
                key: HomeCubit.get(context).formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: (){
                              controller.animateToPage(0, duration: Duration(milliseconds: 30), curve: Curves.easeIn);
                            },
                            child: CustomText(text: "Dashboard  ", size: 12.sp, color: darkGrey, fontWeight: FontWeight.w600)),
                        CustomText(text: "Add Blog >> ", size: 12.sp, color: black, fontWeight: FontWeight.w700)

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
                            CustomText(text: "Add Title", size: 14.sp, color: black, fontWeight: FontWeight.w600),
                            Row(
                              children: [
                                SizedBox(
                                  width:  447.w,
                                  child: TextFormField(
                                    controller: HomeCubit.get(context).title,
                                    maxLines: 1,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Title";
                                      }
                                      return null;
                                    },
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
                                      hintText: 'Enter Title',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.r),
                                        borderSide: BorderSide(color: orange),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 75.w,),
                                Container(
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius:
                                      BorderRadiusDirectional
                                          .circular(10.r)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w),
                                    child: SizedBox(
                                      width: 150.w,
                                      child: DropdownButton(
                                          menuMaxHeight: 200.0,
                                          isExpanded: true,
                                          focusColor: white,
                                          dropdownColor: white,
                                          icon: Align(
                                              alignment:
                                              Alignment.center,
                                              child: Icon(
                                                  Icons
                                                      .keyboard_arrow_down,
                                                  color: orange,
                                                  size: 30.sp)),
                                          borderRadius:
                                          BorderRadius.circular(
                                              10.r),
                                          underline: SizedBox(),
                                          value:
                                          HomeCubit.get(context)
                                              .chosseTypeBlog,
                                          hint: CustomText(
                                              text: "Blog  Type",
                                              size: 12.sp,
                                              color: darkGrey,
                                              fontWeight:
                                              FontWeight.w600),
                                          items: HomeCubit.get(
                                              context)
                                              .blogTypeModel!
                                              .data
                                              ?.map((e) =>
                                              DropdownMenuItem(
                                                value: e.id,
                                                child: Padding(
                                                  padding: EdgeInsets
                                                      .only(
                                                      right:
                                                      20.w),
                                                  child:
                                                  CustomText(
                                                    text: e.name
                                                        .toString(),
                                                    color:
                                                    orange,
                                                    fontWeight:
                                                    FontWeight
                                                        .w700,
                                                    size: 14.sp,
                                                    alignment:
                                                    Alignment
                                                        .center,
                                                  ),
                                                ),
                                              ))
                                              .toList(),
                                          onChanged: (val) {
                                            HomeCubit.get(context)
                                                .chhoseBlogType(
                                                val!);
                                             HomeCubit.get(context).categoryId = val;
                                             print("*******************************************${HomeCubit.get(context).categoryId}");
                                          }),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 30.h,),
                            CustomText(text: "Add Content", size: 14.sp, color: black, fontWeight: FontWeight.w600),
                            SizedBox(
                              width:  710.w,
                              child: TextFormField(
                                controller: HomeCubit.get(context).content,
                                maxLines: 6,minLines: 5,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Content";
                                  }
                                  return null;
                                },
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
                                  hintText: 'Enter Add description',
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
                                    CustomText(text: " Ad Start Date", size: 14.sp, color: black, fontWeight: FontWeight.w600),

                                    SizedBox(
                                      width:  346.w,
                                      child: TextFormField(
                                        controller: HomeCubit.get(context).startDateAddBlog,
                                        maxLines: 1,minLines: 1,
                                        onTap: (){
                                          HomeCubit.get(context).PickDate(context:context,controller: HomeCubit.get(context).startDateAddBlog,
                                          firstDate: DateTime.now(),
                                            lastDate: DateTime(2050)
                                          );
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Enter startDateAddBlog";
                                          }
                                          return null;
                                        },
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                        ),
                                        readOnly: true,
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
                                          hintText: 'Enter Start Date',
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
                                    CustomText(text: " Ad End Date", size: 14.sp, color: black, fontWeight: FontWeight.w600),

                                    SizedBox(
                                      width:  346.w,
                                      child: TextFormField(
                                        controller: HomeCubit.get(context).endDateAddBlog,
                                        maxLines: 1,minLines: 1,
                                        readOnly: true,
                                        onTap: (){
                                          HomeCubit.get(context).PickDate(context : context,controller:  HomeCubit.get(context).endDateAddBlog,
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2050)
                                          );

                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Enter EndDate";
                                          }
                                          return null;
                                        },
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(

                                          //filled: true,

                                          fillColor: const Color.fromRGBO(247, 247, 247, 1),
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
                                          hintText: 'Enter End Date',
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
                                CustomText(text: " Ad photo", size: 14.sp, color: black, fontWeight: FontWeight.w600),

                                Container(
                                  width: 708.w,
                                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: darkGrey),
                                      borderRadius: BorderRadiusDirectional.circular(20.r)
                                  ),
                                  child: GestureDetector(
                                    onTap: (){
                                      HomeCubit.get(context).getImage(ImageSource.gallery);

                                    },
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/home/upload.png",color: orange,),

                                        SizedBox(height: 15.h,),
                                        CustomText(text: " Upload photo of ad", size: 14.sp, color: orange, fontWeight: FontWeight.w600),
                                        HomeCubit.get(context).image == null  ? SizedBox.shrink() :
                                        Image.file(
                                          //height: 100.h,fit: BoxFit.cover,width: double.infinity,
                                            File(HomeCubit.get(context)
                                                .image!
                                                .path),width: 200.w,height: 200.h,)



                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 30.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 130.w,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                      color: darkGrey,
                                      borderRadius: BorderRadiusDirectional.circular(20.r)
                                  ),
                                  child: CustomText(text: "Cancel", size: 14.sp, color: white, fontWeight: FontWeight.w600,alignment: Alignment.center,),

                                ),
                                SizedBox(width: 20.w,),
                                GestureDetector(
                                  onTap: (){
                                    if(HomeCubit.get(context).formKey.currentState!.validate()){
                                      if(HomeCubit.get(context).categoryId == null){
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Enter Blog Type'),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                      else{
                                        HomeCubit.get(context).addBlog();

                                      }
                                    }


                                  },
                                  child: Container(
                                    width: 130.w,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                        color: orange,
                                        borderRadius: BorderRadiusDirectional.circular(20.r)
                                    ),
                                    child: CustomText(text: "Save", size: 14.sp, color: white, fontWeight: FontWeight.w600,alignment: Alignment.center,),

                                  ),
                                )
                              ],
                            )




                          ],
                        ),
                      ),
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
