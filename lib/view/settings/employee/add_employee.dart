
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/user_cubit/user_cubit.dart';
import 'package:aser_dash_board/logic/user_cubit/user_state.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEmployee extends StatelessWidget {
  PageController addEmployee = PageController();
   AddEmployee({super.key,required this.addEmployee});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserState>(
      listener: (context,state){
        if(state is AddMemberLoaded){
          UserCubit.get(context).getAllAdmins(skip: 0, take: 10);
          UserCubit.get(context).password.clear();
          UserCubit.get(context).confirmPassword.clear();
          UserCubit.get(context).addEmail.clear();
          UserCubit.get(context).addFName.clear();
          UserCubit.get(context).addPhone.clear();
          UserCubit.get(context).nationalId.clear();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Create Admin Successful'),
              duration: Duration(seconds: 2),
            ),
          );

        }
        else if(state is AddMemberError){
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context,state){
        return  Scaffold(
          body: Form(
            key: UserCubit.get(context).formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap:(){
                          //settingContent.animateToPage(0, duration: const Duration(microseconds: 30), curve: Curves.easeIn);

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
                          text: "Settings<<",
                          size: 12.sp,
                          function: (){
                            addEmployee.previousPage( duration: const Duration(milliseconds: 30), curve: Curves.easeIn);
                          },
                          color: black,
                          fontWeight: FontWeight.w700),
                      SizedBox(
                        width: 5.w,
                      ),

                      CustomText(
                          text: "Member<<",
                          size: 12.sp,
                          color: black,
                          fontWeight: FontWeight.w700),
                    ],
                  ),
                ),
                SizedBox(height: 40.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 50.h,horizontal: 50.w),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15.r),
                        color: white
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 30.h,horizontal: 40.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "Add Member", size: 20.sp, color: black, fontWeight: FontWeight.w600),
                          SizedBox(height: 30.h,),

                          SizedBox(height: 30.h,),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(text: "User Name", size: 14.sp, color: black, fontWeight: FontWeight.w500),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10.h),
                                        child: SizedBox(
                                          width: 447.w,
                                          child: TextFormField(
                                            controller: UserCubit.get(context).addFName,

                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Please Enter name";
                                              }
                                              return null;
                                            },
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(

                                              fillColor:
                                              const Color.fromRGBO(247, 247, 247, 1),
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
                                              hintText: 'Moataz ',
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                                borderSide: BorderSide(color: orange),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(width: 20.h,),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(text: "Email", size: 14.sp, color: black, fontWeight: FontWeight.w500),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10.h),
                                        child: SizedBox(
                                          width: 447.w,
                                          child: TextFormField(
                                            controller: UserCubit.get(context).addEmail,

                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Please Enter email";
                                              }
                                              return null;
                                            },
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(

                                              fillColor:
                                              const Color.fromRGBO(247, 247, 247, 1),
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
                                              hintText: 'mo3tzelrawy1111@gmail.com ',
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                                borderSide: BorderSide(color: orange),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),

                              SizedBox(height: 20.h,),

                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(text: "Phone Number", size: 14.sp, color: black, fontWeight: FontWeight.w500),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10.h),
                                        child: SizedBox(
                                          width: 447.w,
                                          child: TextFormField(
                                            controller: UserCubit.get(context).addPhone,

                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Please Enter phone";
                                              }
                                              return null;
                                            },
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(

                                              fillColor:
                                              const Color.fromRGBO(247, 247, 247, 1),
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
                                              hintText: '01117191257 ',
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                                borderSide: BorderSide(color: orange),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(width: 20.h,),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(text: "national Id", size: 14.sp, color: black, fontWeight: FontWeight.w500),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10.h),
                                        child: SizedBox(
                                          width: 447.w,
                                          child: TextFormField(
                                            controller: UserCubit.get(context).nationalId,

                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Please Enter National Id";
                                              }
                                              return null;
                                            },
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(

                                              fillColor:
                                              const Color.fromRGBO(247, 247, 247, 1),
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
                                              hintText: '253685786876 ',
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                                borderSide: BorderSide(color: orange),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h,),


                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(text: "Password", size: 14.sp, color: black, fontWeight: FontWeight.w500),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10.h),
                                        child: SizedBox(
                                          width: 447.w,
                                          child: TextFormField(
                                            controller: UserCubit.get(context).password,

                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Please Enter Password";
                                              }
                                              else if(!RegExp(r'^(?=.*?[0-9])').hasMatch(context.read<UserCubit>().password.text)){
                                                return 'enter number';
                                              }
                                              else if(!RegExp(r'^(?=.*?[A-Z])(?=.*[a-z])').hasMatch(context.read<UserCubit>().password.text)){
                                                return 'enter lowerCase';
                                              }
                                              else if(!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(context.read<UserCubit>().password.text)){
                                                return 'enter symbol';
                                              }
                                              return null;
                                            },
                                            obscureText: UserCubit.get(context).isPasswordChange,

                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(

                                              suffixIcon: IconButton(onPressed: (){
                                                UserCubit.get(context).changPasswordIcon();
                                              }, icon:  UserCubit.get(context).isPasswordChange == true ?
                                              const Icon(Icons.visibility_off) : const Icon(Icons.visibility)),

                                              fillColor:
                                              const Color.fromRGBO(247, 247, 247, 1),
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
                                              hintText: 'password ',
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                                borderSide: BorderSide(color: orange),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(width: 20.h,),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(text: "confirmPassword", size: 14.sp, color: black, fontWeight: FontWeight.w500),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10.h),
                                        child: SizedBox(
                                          width: 447.w,
                                          child: TextFormField(
                                            controller: UserCubit.get(context).confirmPassword,
                                            obscureText: UserCubit.get(context).isPasswordChange,

                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Please Enter ConfirmPassword";
                                              }
                                              return null;
                                            },
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(onPressed: (){
                                                UserCubit.get(context).changPasswordIcon();

                                              }, icon:        UserCubit.get(context).isPasswordChange == true ? 
                                                  Icon(Icons.visibility_off) : Icon(Icons.visibility)),

                                              fillColor:
                                              const Color.fromRGBO(247, 247, 247, 1),
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
                                              hintText: 'ConfirmPassword ',
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8.r),
                                                borderSide: BorderSide(color: orange),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 50.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if(UserCubit.get(context).formKey.currentState!.validate()){
                                    UserCubit.get(context).addMember();

                                  }

                                },
                                child: Container(
                                  width: 109.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadiusDirectional.circular(
                                        10.r),
                                    color: orange,

                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: "save",
                                        size: 14.sp,
                                        color: white,
                                        fontWeight: FontWeight.w600,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w,),

                              GestureDetector(
                                onTap: () {
                                  UserCubit.get(context).password.clear();
                                  UserCubit.get(context).confirmPassword.clear();
                                  UserCubit.get(context).addEmail.clear();
                                  UserCubit.get(context).addFName.clear();
                                  UserCubit.get(context).addPhone.clear();
                                  UserCubit.get(context).nationalId.clear();

                                  //addEmployee.previousPage(duration: Duration(milliseconds: 30), curve: Curves.easeIn);



                                  //HomeCubit.get(context).getAllBlog();
                                },
                                child: Container(
                                  width: 80.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadiusDirectional.circular(
                                          10.r),
                                      color: darkGrey
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: "cancel",
                                        size: 14.sp,
                                        color: white,
                                        fontWeight: FontWeight.w600,
                                        alignment: Alignment.center,
                                      ),

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
                )
              ],
            ),
          ),
        );
      },

    );
  }
}
