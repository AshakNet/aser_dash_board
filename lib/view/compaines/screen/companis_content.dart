import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/constant/table/companyies/company_table.dart';
import 'package:aser_dash_board/logic/compaines/compaines_state/compaines_state.dart';
import 'package:aser_dash_board/logic/compaines/compines_cubit/companies_Cubit.dart';

import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanisContent extends StatelessWidget {
  PageController companyContent = PageController();
   CompanisContent({super.key,required this.companyContent});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompaniesCubit,CompaniesState>(
      listener: (context,state){
        if(state is PickDateBlocSSuccessfulState){
          CompaniesCubit.get(context).getAllCompany(skip: 0, take: 10);
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
                          companyContent.animateToPage(0, duration: Duration(microseconds: 30), curve: Curves.easeIn);
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
                                    text: "Company Service",
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
                                          value: CompaniesCubit.get(context).selectCompanyVar,
                                          hint: CustomText(text: "Service Type", size: 12.sp, color: black, fontWeight: FontWeight.w600),
                                          items: CompaniesCubit.get(context).getApplicationServicesModel?.data
                                              ?.map((e) => DropdownMenuItem(
                                            value: e.id,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: 20.w),
                                              child: CustomText(
                                                text: e.serviceName.toString(),
                                                color: orange,
                                                fontWeight: FontWeight.w700,
                                                size: 14.sp,
                                                alignment: Alignment.center,
                                              ),
                                            ),
                                          ))
                                              .toList(),
                                          onChanged: (val) {
                                            CompaniesCubit.get(context)
                                                .selectCompany(val);
                                            CompaniesCubit.get(context).getAllCompany(skip: 0, take: 10);
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
                                    text: " Company governate",
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
                                          value: CompaniesCubit.get(context).government,
                                          hint: CustomText(text: "Governate", size: 12.sp, color: black, fontWeight: FontWeight.w600),
                                          items: CompaniesCubit.get(context).governmentsModel?.data
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
                                            CompaniesCubit.get(context)
                                                .changeCountry(val);
                                            CompaniesCubit.get(context).getAllCompany(skip: 0, take: 10);

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
                                controller: CompaniesCubit.get(context).addtionalDate,
                                maxLines: 1,
                                readOnly: true,
                                onTap: (){
                                  CompaniesCubit.get(context).PickDate(context : context, controller:  CompaniesCubit.get(context).addtionalDate,
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
                                          value: CompaniesCubit.get(context).status,
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
                                              CompaniesCubit.get(context).convertNumberStatus = "0";
                                            }
                                            else if(val == "Deleted"){
                                              CompaniesCubit.get(context).convertNumberStatus = "1";

                                            }
                                            else if(val == "Restricted"){
                                              CompaniesCubit.get(context).convertNumberStatus = "2";

                                            }
                                            else{
                                              CompaniesCubit.get(context).convertNumberStatus = "3";

                                            }
                                            CompaniesCubit.get(context)
                                                .changeStatus(val);
                                            CompaniesCubit.get(context).getAllCompany(skip: 0, take: 10);

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
                                 CompaniesCubit.get(context).addtionalDate.clear();
                                 CompaniesCubit.get(context).search.clear();
                                 CompaniesCubit.get(context).status = null;
                                 CompaniesCubit.get(context).selectCompanyVar = null;
                                 CompaniesCubit.get(context).government = null;
                                 CompaniesCubit.get(context).getAllCompany(skip: 0, take: 10);


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
                      controller: CompaniesCubit.get(context).search,
                      onChanged: (value){
                        CompaniesCubit.get(context).getAllCompany(skip: 0, take: 10);
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
                        hintText: 'search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: orange),
                        ),
                      ),
                    ),
                  ),
                ),




                state is GetAllCompanySuccessful ?

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
                                  CustomText(text: "Companies", size: 20.sp, color: black, fontWeight: FontWeight.w600),
                                  SizedBox(width: 30.w,),
                                  CustomText(text: "( ${CompaniesCubit.get(context).getAllCompanyModel!.totalCount.toString()} Companies)", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500),
                                  Spacer(),






                                ],
                              ),
                              SizedBox(height: 20.h),

                              CompainesTable(companyDetails: companyContent,context: context,),
                              SizedBox(height: 20.h),
                              Row(

                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      CompaniesCubit.get(context).scrollLeft();

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
                                      CompaniesCubit.get(context).scrollRight();
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
                ) :
                const Center(child: CircularProgressIndicator())



            
            
              ],
            ),
          ),
        );
      },

    );
  }
}
