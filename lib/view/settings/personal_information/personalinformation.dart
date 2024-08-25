import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/user_cubit/user_cubit.dart';
import 'package:aser_dash_board/logic/user_cubit/user_state.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInformation extends StatelessWidget {
  PageController personalInformation = PageController();
   PersonalInformation({super.key,required this.personalInformation});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: Column(
            children: [

              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
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
                      onTap:(){
                        personalInformation.animateToPage(0, duration: const Duration(microseconds: 30), curve: Curves.easeIn);

                      },
                      child: CustomText(
                          text: "Settings<<",
                          size: 12.sp,
                          color: black,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomText(
                        text: "Profile<<",
                        size: 12.sp,
                        color: black,
                        fontWeight: FontWeight.w700),

                  ],
                ),
              ),
              SizedBox(height: 60.h,),
              state is GetPersonalInformationLoading ? CircularProgressIndicator() :
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 100.w,vertical: 100.h),
                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: white,

                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 40.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/images/home/imagePersonal.png"),
                            SizedBox(width: 20.w,),
                            Spacer(),
                            Image.asset("assets/images/home/edit.png",color: orange
                              ,),
                            SizedBox(width: 5.w,),
                            CustomText(text: "Edit Profile", size: 16.sp, color: orange,
                              function: (){
                                personalInformation.animateToPage(2, duration: const Duration(milliseconds: 30), curve: Curves.easeIn);
                              },
                              fontWeight: FontWeight.w600,textDecoration: TextDecoration.underline,),



                          ],
                        ),
                        SizedBox(height: 30.h,),
                        Row(
                          children: [
                            CustomText(text: ":Name", size: 16.sp, color: black, fontWeight: FontWeight.w600),
                            SizedBox(width: 15.w,),
                            CustomText(text: "${UserCubit.get(context).getPersonalDataModel!.data!.userName}", size: 16.sp, color: black, fontWeight: FontWeight.w400)

                          ],
                        ),
                        SizedBox(height: 20.h,),

                        Row(
                          children: [
                            CustomText(text: ":Email", size: 16.sp, color: black, fontWeight: FontWeight.w600),
                            SizedBox(width: 15.w,),
                            CustomText(text: "${UserCubit.get(context).getPersonalDataModel!.data!.email}", size: 16.sp, color: black, fontWeight: FontWeight.w400)

                          ],
                        ),
                        SizedBox(height: 20.h,),

                        Row(
                          children: [
                            CustomText(text: ":Phone number:", size: 16.sp, color: black, fontWeight: FontWeight.w600),
                            SizedBox(width: 15.w,),
                            CustomText(text: "${UserCubit.get(context).getPersonalDataModel!.data!.phoneNumber}", size: 16.sp, color: black, fontWeight: FontWeight.w400)

                          ],
                        )

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },

    );
  }
}
