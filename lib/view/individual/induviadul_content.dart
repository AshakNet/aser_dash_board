import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/constant/table/indavidual/induvadul.dart';
import 'package:aser_dash_board/logic/indivdulCubit/indivadulCubit.dart';
import 'package:aser_dash_board/logic/indivdulCubit/indivadulState.dart';




import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndividualContent extends StatelessWidget {
  PageController individualContent = PageController();
  IndividualContent({super.key,required this.individualContent});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IndividualCubit,IndividualState>(
      listener: (context,state){
        if(state is PickDateBlocSSuccessfulState){
          IndividualCubit.get(context).getAllIndividual(skip: 0, take: 10);
        }
      },
      builder: (context,state){
        return Scaffold(
          body:

          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap:(){
                          individualContent.animateToPage(0, duration: Duration(microseconds: 30), curve: Curves.easeIn);
                        },
                        child: CustomText(
                            text: "Home",
                            size: 12.sp,
                            color: darkGrey,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      CustomText(
                          text: "Companies<<",
                          size: 12.sp,
                          color: black,
                          fontWeight: FontWeight.w700),
                    ],
                  ),
                ),

                SizedBox(height: 40.h,),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                CustomText(
                                    text: "Gender",
                                    size: 16.sp,
                                    color: black,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(

                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadiusDirectional.circular(10.r)
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
                                          value: IndividualCubit.get(context).gender,
                                          hint: CustomText(text: "Gender", size: 12.sp, color: black, fontWeight: FontWeight.w600),
                                          items: ["male","female"]
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
                                            IndividualCubit.get(context)
                                                .changeGender(val);
                                            IndividualCubit.get(context).getAllIndividual(skip: 0, take: 10);
                                          }),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                CustomText(
                                    text: "Transaction",
                                    size: 16.sp,
                                    color: black,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(

                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadiusDirectional.circular(10.r)
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
                                          value: IndividualCubit.get(context).transaction,
                                          hint: CustomText(text: "Transaction", size: 12.sp, color: black, fontWeight: FontWeight.w600),
                                          items: ["5","8","10"].map((e) => DropdownMenuItem(
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
                                            IndividualCubit.get(context)
                                                .changeTransaction(val);
                                            IndividualCubit.get(context).getAllIndividual(skip: 0, take: 10);

                                          }),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),



                      Padding(

                        padding:  EdgeInsets.symmetric(vertical: 10.h),
                        child: SizedBox(
                          width: 200.w,

                          child: Column(
                            children: [
                              CustomText(
                                  text: " Additional date",
                                  size: 16.sp,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                              TextFormField(
                                controller: IndividualCubit.get(context).addtionalDate,
                                maxLines: 1,
                                readOnly: true,
                                onTap: (){
                                  IndividualCubit.get(context).PickDate(context : context, controller:  IndividualCubit.get(context).addtionalDate,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2050-2-8)
                                  );
                                },
                                validator: (value) {},
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: orange,size: 20.sp,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: white,
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
                                  hintText: 'Date',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                CustomText(
                                    text: " Service status",
                                    size: 16.sp,
                                    color: black,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(

                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadiusDirectional.circular(10.r)
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
                                          value: IndividualCubit.get(context).status,
                                          hint: CustomText(text: "Service status", size: 12.sp, color: black, fontWeight: FontWeight.w600),
                                          items: [
                                            "Active",
                                            "Restricted",
                                            "Deleted",
                                            "Pending"
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
                                            if(val == "Active"){
                                              IndividualCubit.get(context).convertNumberStatus = "0";
                                            }
                                            else if(val == "Deleted"){
                                              IndividualCubit.get(context).convertNumberStatus = "1";

                                            }
                                            else if(val == "Restricted"){
                                              IndividualCubit.get(context).convertNumberStatus = "2";

                                            }
                                            else{
                                              IndividualCubit.get(context).convertNumberStatus = "3";

                                            }
                                            IndividualCubit.get(context)
                                                .changeStatus(val);
                                            IndividualCubit.get(context).getAllIndividual(skip: 0, take: 10);

                                          }),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 30.h),
                            child: CustomText(text: "Reset",

                              function: (){
                                IndividualCubit.get(context).addtionalDate.clear();
                                IndividualCubit.get(context).search.clear();
                                IndividualCubit.get(context).status = null;
                                IndividualCubit.get(context).convertNumberStatus = null;
                                IndividualCubit.get(context).transaction = null;
                                IndividualCubit.get(context).getAllIndividual(skip: 0, take: 10);


                              },
                              size: 18.sp, color: darkGrey, fontWeight: FontWeight.w400,textDecoration: TextDecoration.underline,),
                          ),
                          SizedBox(width: 10.w,),

                        ],
                      ),






                    ],
                  ),
                ),

                Padding(

                  padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 40.w),
                  child: SizedBox(


                    child: TextFormField(
                      controller: IndividualCubit.get(context).search,
                      onChanged: (value){
                        IndividualCubit.get(context).getAllIndividual(skip: 0, take: 10);
                      },
                      maxLines: 1,
                      validator: (value) {},
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: darkGrey,
                          ),
                        ),
                        //filled: true,

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
                        hintText: 'search by name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: orange),
                        ),
                      ),
                    ),
                  ),
                ),




                state is GetAllIndividualLoading ? const Center(child: CircularProgressIndicator()):

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 30.h),
                  child: Container(

                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadiusDirectional.circular(10.r)
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30.w),
                      child: Container(

                        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10.r),
                          color: white,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CustomText(text: "Individual", size: 20.sp, color: black, fontWeight: FontWeight.w600),
                                  SizedBox(width: 30.w,),
                                  CustomText(text: "( ${IndividualCubit.get(context).getAllIndividulsModel!.data!.totalCount} Customer)", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500),
                                  Spacer(),






                                ],
                              ),
                              SizedBox(height: 20.h),

                              IndividualTable(individualDetails: individualContent,context: context,),
                              SizedBox(height: 20.h),
                              Row(

                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      IndividualCubit.get(context).scrollLeft();

                                    },
                                    child: Container(
                                      width: 109.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadiusDirectional.circular(10.r),
                                          border: Border.all(
                                              color: Colors.grey.shade500
                                          )
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.keyboard_arrow_left_sharp,color : Colors.grey.shade500,),

                                          CustomText(text: "Previous", size: 14.sp, color: Colors.grey.shade500, fontWeight: FontWeight.w600,alignment: Alignment.center,),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: (){
                                      IndividualCubit.get(context).scrollRight();
                                    },
                                    child: Container(
                                      width: 80.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadiusDirectional.circular(10.r),
                                          border: Border.all(
                                              color: Colors.grey.shade500
                                          )
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,

                                        children: [


                                          CustomText(text: "Next", size: 14.sp, color: Colors.grey.shade500, fontWeight: FontWeight.w600,alignment: Alignment.center,),
                                          Icon(Icons.keyboard_arrow_right,color : Colors.grey.shade500,),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )






                            ],
                          ),
                        ),
                      ),
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
