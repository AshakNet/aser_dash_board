
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/auth/auth/authCubit.dart';
import 'package:aser_dash_board/logic/auth/auth/authState.dart';
import 'package:aser_dash_board/widgets/button/customButton.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:aser_dash_board/widgets/formField/formField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePassword extends StatelessWidget {
  var emailController = TextEditingController();

  CreatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: white,
              elevation: 0.0,
              leading: IconButton(onPressed: (){
                Navigator.pop(context);
              },icon: const Icon(Icons.arrow_back,color: Colors.black),),
            ),
            backgroundColor:white,
            body: Row(

              children: [

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w),
                      child: Container(
                          width: 568.w,
                          height: 688.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(20.r),
                              color: orange
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(child: Text("Nomadica",style: TextStyle(fontWeight:FontWeight.w700,letterSpacing : 10.w,fontSize: 60.sp,color: white),)),
                              Center(child: Text("Unleash the explorer within you",style: TextStyle(fontWeight:FontWeight.w700,letterSpacing : 5.w ,fontSize: 10.sp,color: white),)),

                            ],
                          )),
                    ),
                  ],
                ),

                Spacer(),

                Container(

                  height: 1024.h,
                  decoration: BoxDecoration(color: white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: 'New Password',
                          fontWeight: FontWeight.w700,
                          size: 36.sp,
                          color: orange),
                      SizedBox(
                        height: 50.h,
                      ),

                      Padding(
                        padding: EdgeInsets.only(right: 88.0.w),
                        child: CustomText(
                          text: 'password',
                          size: 24.sp,
                          color: orange,
                          alignment: Alignment.centerRight,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 88.0.w),
                        child: inputField(
                          controller: AuthCubit.get(context).createPassword,
                          height: 56,
                          width: 458,
                          hintText: 'enter password',
                          validator: () {},
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 88.0.w),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomText(
                              text: 'confirm Password',
                              size: 24.sp,
                              color: orange,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 88.0.w),
                        child: inputField(
                            controller: AuthCubit.get(context).createPasswordConfirm,
                            height: 56,
                            width: 458,
                            hintText: 'enter Password',
                            validator: () {},
                            isPassword: true),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      SizedBox(
                        height: 80.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 88.0.w),
                        child: CustomButton(
                          width: 458.w,
                          height: 72.h,
                          text: 'Log In',
                          backgroudColor: orange,
                          size: 24.sp,
                          fontWeight: FontWeight.w700,
                          function: () {
                            // AuthCubit.get(context).login();
                            // Navigator.pushNamed(context, "");
                          },
                        ),

                      ),

                    ],
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
