
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/compaines/compaines_state/compaines_state.dart';
import 'package:aser_dash_board/logic/compaines/compines_cubit/companies_Cubit.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompaniesDetails extends StatelessWidget {
  PageController companyDetails = PageController();
   CompaniesDetails({super.key,required this.companyDetails});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompaniesCubit,CompaniesState>(
      listener: (context,state){
        if(state is ChangeStatusActiveSuccessful){
          CompaniesCubit.get(context).loadOne(CompaniesCubit.get(context).getCampnyDetailsModel!.data!.companyId.toString());

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Change Successful'),
              duration: Duration(seconds: 2),
            ),

          );
        }

        else if(state is ChangeProfitSuccessful){
          CompaniesCubit.get(context).loadOne(CompaniesCubit.get(context).getCampnyDetailsModel!.data!.companyId.toString());

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Profit Successful'),
              duration: Duration(seconds: 2),
            ),

          );
        }

        else if(state is ChangeStatusActiveError){
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
              duration: Duration(seconds: 2),
            ),

          );
        }
        else if(state is PickDateChangeStatusSSuccessfulState){
          CompaniesCubit.get(context).changeStatusCompainesRestrict(CompaniesCubit.get(context).getCampnyDetailsModel!.data!.ownerId.toString());
        }
        else if (state is ChangeStatusRejectedSuccessful){
          CompaniesCubit.get(context).loadOne(CompaniesCubit.get(context).getCampnyDetailsModel!.data!.companyId.toString());

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Change Successful'),
              duration: Duration(seconds: 2),
            ),

          );
        }
        else if (state is ChangeStatusRejectedError){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
              duration: Duration(seconds: 2),
            ),

          );
        }
        else if (state is ChangeStatusUnRestrictSuccessful){
          CompaniesCubit.get(context).loadOne(CompaniesCubit.get(context).getCampnyDetailsModel!.data!.companyId.toString());

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Change Successful'),
              duration: Duration(seconds: 2),
            ),

          );
        }
        else if(state is ChangeStatusUnRestrictError){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
              duration: Duration(seconds: 2),
            ),

          );
        }
        else if (state is ChangeStatusDeleteSuccessful){
          CompaniesCubit.get(context).loadOne(CompaniesCubit.get(context).getCampnyDetailsModel!.data!.companyId.toString());

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
        return Scaffold(
          body:

          state is GetCompanyDetailsLoading || state is GetCompanyDetailsInsideLoading ? const Center(child: CircularProgressIndicator()) :
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
                        onTap: (){
                          companyDetails.animateToPage(0, duration: const Duration(microseconds: 30), curve: Curves.easeIn);
                          CompaniesCubit.get(context).getAllCompany(skip: 0, take: 10);
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
                          text: "${CompaniesCubit.get(context).getCampnyDetailsModel!.data!.companyName.toString()}<<",
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
                          companyDetails.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            
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
                          companyDetails.animateToPage(3, duration: Duration(milliseconds: 30), curve: Curves.easeIn);
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
                            padding:  EdgeInsets.symmetric(vertical: 30.h,horizontal: 30.w ),
                            child: Column(
                              children: [

                                SizedBox(
                                  height: 600.h,
                                  child:  GridView.builder(
                                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                                    itemCount: CompaniesCubit.get(context).getCompanyServicesModel?.data?.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 100.0.w,
                                      mainAxisSpacing: 16.0,
                                      childAspectRatio: 1,
                                    ),
                                    itemBuilder: (context, index) =>  Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(15.r),
                                          child: Image.network(
                                            "${CompaniesCubit.get(context).getCompanyServicesModel?.data![index].image.toString()}",
                                            width: 240.w,
                                            height: 181.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(height: 5.h,),
                                        CustomText(text:" ${CompaniesCubit.get(context).getCompanyServicesModel?.data![index].name.toString()}", size: 16.sp, color: black, fontWeight: FontWeight.w600)
                                      ],
                                    ),
                                  ),
                                ),

                                Container(
                                  width: 140.w,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    color: black,
                                    borderRadius: BorderRadiusDirectional.circular(20.r)
                                  ),
                                  child: CustomText(text: "zeroProfit", size: 18.sp,alignment: Alignment.center, color: white, fontWeight: FontWeight.w700,function: (){
                                    CompaniesCubit.get(context).zeroProfit(
                                  
                                        CompaniesCubit.get(context).getCampnyDetailsModel!.data!.companyId.toString()
                                    );
                                  },),
                                )


            

            
                              ],
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
                                  backgroundImage: NetworkImage(
                                      "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.logo}"),
                                ),
                                CustomText(
                                  text: "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.companyName}",
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
                                      text: "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.ownerName}",
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

                                    Row(
                                      children: [
                                        CustomText(
                                          text: "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.status}",
                                          size: 14.sp,
                                          color:
                                          CompaniesCubit.get(context).getCampnyDetailsModel!.data!.status == "Restricted" ||
                                              CompaniesCubit.get(context).getCampnyDetailsModel!.data!.status == "Deleted"
                                          ? Colors.red :
                                          Colors.green,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(width: 20.w,),

                                        CompaniesCubit.get(context).getCampnyDetailsModel!.data!.status == "Restricted"?
                                        Row(
                                          children: [
                                            CustomText(
                                              text: "Till",
                                              size: 14.sp,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            SizedBox(width: 10.w,),

                                            CustomText(
                                              text: CompaniesCubit.get(context).restricted.text.trim(),
                                              size: 14.sp,
                                              color: Colors.red,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ],
                                        ) : SizedBox.shrink()
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                CompaniesCubit.get(context).getCampnyDetailsModel!.data!.status == "Deleted" ?
                                GestureDetector(
                                  onTap : (){
                                    CompaniesCubit.get(context).changeStatusCompainesActive(
                                      CompaniesCubit.get(context).getCampnyDetailsModel!.data!.ownerId.toString()
                                    );


                                  },
                                  child: Container(
                                    width: 180.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadiusDirectional.circular(
                                            10.r),
                                        border: Border.all(color: darkGrey)),
                                    child: CustomText(
                                      text: "Active",
                                      size: 16.sp,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ) :

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap : (){
                                        CompaniesCubit.get(context).changeStatusCompainesDelete(
                                          CompaniesCubit.get(context).getCampnyDetailsModel!.data!.ownerId.toString()
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
                                          text: "Delete  ",
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
                                    CompaniesCubit.get(context).getCampnyDetailsModel!.data!.status == "Pending" ?
                                    GestureDetector(
                                      onTap: (){
                                        CompaniesCubit.get(context).changeStatusCompainesActive(
                                            CompaniesCubit.get(context).getCampnyDetailsModel!.data!.ownerId.toString()
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
                                          text: "Active ",
                                          size: 16.sp,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ) :
                                    CompaniesCubit.get(context).getCampnyDetailsModel!.data!.status == "Restricted" ?
                                    GestureDetector(
                                      onTap: (){
                                        CompaniesCubit.get(context).changeStatusCompainesUnRestrict(
                                          CompaniesCubit.get(context).getCampnyDetailsModel!.data!.ownerId.toString()
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
                                          text: "UnRestrict",
                                          size: 16.sp,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    )
                                        : GestureDetector(
                                      onTap: (){
                                        CompaniesCubit.get(context).PickDateChangeRestricted(context: context,controller: CompaniesCubit.get(context).restricted, firstDate: DateTime.now(), lastDate: DateTime(2030),);

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
                                          text: "Restrict ",
                                          size: 16.sp,
                                          color: black,
                                          fontWeight: FontWeight.w600,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    )

            
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
                                            "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.service}",
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
                                            "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.governate}",
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
                                            "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.address}",
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
                                            "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.website}",
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
                                            "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.ownerName}",
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
                                            "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.email}",
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
                                            "${CompaniesCubit.get(context).getCampnyDetailsModel?.data!.phone}",
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
          ),
        );
      },

    );
  }
}
