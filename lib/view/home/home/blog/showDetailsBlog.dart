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


   Showdetailsblog({super.key,required this.controller,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){
        if(state is EditBlogSuccessful){
          HomeCubit.get(context).getAllBlog(skip: 0, take: 10);
          HomeCubit.get(context).changeRead();
          HomeCubit.get(context).editTitle.clear();
          HomeCubit.get(context).editContent.clear();
          HomeCubit.get(context).editStartData.clear();
          HomeCubit.get(context).editEndData.clear();
          HomeCubit.get(context).getOneBlog(HomeCubit.get(context).getOneBlogModel!.data!.id.toString());

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Update Blog Successful'),
              duration: Duration(seconds: 2),
            ),
          );
        }

        else if(state is ChangeStatusSuccessful){

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Change Successful'),
              duration: Duration(seconds: 2),
            ),
          );
          HomeCubit.get(context).getOneBlog(HomeCubit.get(context).getOneBlogModel!.data!.id.toString());

          print("/*//////////////////////////////////////////////");

          HomeCubit.get(context).getAllBlog(skip: 0, take: 10);

        }
      },
      builder: (context,state){
        return Scaffold(
          body:
          state is GetOneBlogLoading ? const Center(child: CircularProgressIndicator()) :
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: (){
                            controller.animateToPage(0, duration: const Duration(milliseconds: 30), curve: Curves.easeIn);
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


                              HomeCubit.get(context).read == true ?
                              Row(
                                children: [
                                  Icon(Icons.edit_calendar,color: orange,),
                                  SizedBox(width: 5.w,),
                                  CustomText(text: "Edit Ad",
                                    function: (){
                                      HomeCubit.get(context).changeRead();
                                    },
                                    size: 18.sp, color: orange, fontWeight: FontWeight.w600,textDecoration: TextDecoration.underline,)
                                ],
                              ) : SizedBox.shrink()
                            ],
                          ),
                          SizedBox(height: 20.h,),
                          CustomText(text: "Article Title", size: 14.sp, color: black, fontWeight: FontWeight.w600),
                          Row(
                            children: [
                              SizedBox(
                                width:  447.w,
                                child: TextFormField(
                                  controller: HomeCubit.get(context).editTitle,
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
              
                                        value: HomeCubit.get(context).chooseBlogTypeEdit,
                                        hint: CustomText(text: "BlogType", size: 12.sp, color: black, fontWeight: FontWeight.w600),
                                        items: HomeCubit.get(context).blogTypeModel?.data
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
                                          HomeCubit.get(context).choseBlogTypeEdit(val!);

                                          HomeCubit.get(context).editCategoryId = val;
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
                              controller: HomeCubit.get(context).editContent,
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
                                      controller: HomeCubit.get(context).editStartData,

                                      onTap: (){
                                        if(HomeCubit.get(context).read == false){
                                          HomeCubit.get(context).PickDate(
                                              context: context,
                                              controller: HomeCubit.get(context).editStartData,
                                              firstDate: DateTime.now(), lastDate: DateTime(2030));
                                        }

                                      },
              
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
                                      controller: HomeCubit.get(context).editEndData,
                                      onTap: (){
                                        if(HomeCubit.get(context).read == false ){
                                          HomeCubit.get(context).PickDate(
                                              context: context,
                                              controller: HomeCubit.get(context).editEndData,
                                              firstDate: DateTime.now(), lastDate: DateTime(2030));
                                        }

                                      },
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
                              HomeCubit.get(context).read ?
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: Image.network(
                                  HomeCubit.get(context).getOneBlogModel!.data!.imageName.toString(),
                                  height: 200.h,
                                  fit: BoxFit.cover,
                                ),
                              ) :  Container(
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

                          HomeCubit.get(context).read ?
                          Center(
                            child:
                            HomeCubit.get(context).getOneBlogModel!.data?.status != "Inactive" ?
                            GestureDetector(
                              onTap: (){
                                HomeCubit.get(context).changeStatusBlog(HomeCubit.get(context).getOneBlogModel!.data!.id.toString());
                              },
                              child: Container(
                                width: 130.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadiusDirectional.circular(20.r)
                                ),
                                child: CustomText(text: "Stop This blog", size: 14.sp, color: white, fontWeight: FontWeight.w600,alignment: Alignment.center,),

                              ),
                            ) : GestureDetector(
                              onTap: (){
                                HomeCubit.get(context).changeStatusBlog(HomeCubit.get(context).getOneBlogModel!.data!.id.toString());

                              },
                              child: Container(
                                width: 130.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadiusDirectional.circular(20.r)
                                ),
                                child: CustomText(text: "Activate Blog", size: 14.sp, color: white, fontWeight: FontWeight.w600,alignment: Alignment.center,),

                              ),
                            ),
                          ) : Center(child: GestureDetector(
                              onTap: (){
                                HomeCubit.get(context).updateBlog(

                                    editTitle: HomeCubit.get(context).editTitle.text.trim().isNotEmpty ?
                                    HomeCubit.get(context).editTitle : HomeCubit.get(context).getOneBlogModel!.data!.title
                                    ,

                                    editContent: HomeCubit.get(context).editContent.text.trim().isNotEmpty ?
                                    HomeCubit.get(context).editContent : HomeCubit.get(context).getOneBlogModel!.data!.contant
                                    ,

                                    id: HomeCubit.get(context).getOneBlogModel!.data!.id.toString(),
                                    image:  HomeCubit.get(context).image as File,
                                    editStartData: HomeCubit.get(context).editStartData.text.trim().isNotEmpty ?
                                    HomeCubit.get(context).editStartData : HomeCubit.get(context).getOneBlogModel!.data!.startDate,
                                    editEndData: HomeCubit.get(context).editEndData.text.trim().isNotEmpty ?
                                    HomeCubit.get(context).editEndData : HomeCubit.get(context).getOneBlogModel!.data!.endDate);
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
                            ),
                          )
              
              
              
              
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
