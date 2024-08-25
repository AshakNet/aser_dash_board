import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/constant/table/employee/employee.dart';
import 'package:aser_dash_board/logic/user_cubit/user_cubit.dart';
import 'package:aser_dash_board/logic/user_cubit/user_state.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Employee extends StatelessWidget {
  PageController employee =PageController();
   Employee({super.key,required this.employee});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: SingleChildScrollView(
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
                            employee.animateToPage(0, duration: const Duration(milliseconds: 30), curve: Curves.easeIn);
                          },
                          color: darkGrey,
                          fontWeight: FontWeight.w700),
                      SizedBox(
                        width: 5.w,
                      ),

                      CustomText(
                          text: "Members<<",
                          size: 12.sp,
                          color: black,
                          fontWeight: FontWeight.w700),
                    ],
                  ),
                ),

                SizedBox(height: 40.h,),

                Padding(

                  padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 30.w),
                  child: SizedBox(


                    child: TextFormField(
                      controller: UserCubit.get(context).search,
                      maxLines: 1,
                      onChanged: (value){
                        UserCubit.get(context).getAllAdmins(skip: 0, take: 10);
                      },
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

                        fillColor: Color.fromRGBO(247, 247, 247, 1),
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
                        hintText: 'search by name ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: orange),
                        ),
                      ),
                    ),
                  ),
                ),



                state is GetAllAdminsLoading ? const Center(child: CircularProgressIndicator()) :

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 30.h),
                  child: Container(
                    height: 900.h,
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
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CustomText(text: "Member", size: 20.sp, color: black, fontWeight: FontWeight.w600),
                                SizedBox(width: 30.w,),
                                CustomText(text: "( ${UserCubit.get(context).getAllAdminModel!.data!.totalCount} Members)", size: 16.sp, color: darkGrey, fontWeight: FontWeight.w500),
                                Spacer(),
                                GestureDetector(
                                  onTap: (){
                                    employee.animateToPage(4, duration: Duration(milliseconds: 20), curve: Curves.easeIn);
                                  },
                                  child: Container(
                                    width: 100.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.r),
                                        color: orange
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                      child: Row(

                                        children: [
                                          Icon(Icons.add,color: white,),
                                          SizedBox(width: 5.w,),

                                          CustomText(text: "Add", size: 16.sp, color: white, fontWeight: FontWeight.w700,alignment: Alignment.center,),
                                        ],
                                      ),
                                    ),
                                  ),
                                )





                              ],
                            ),

                            Container(


                              child: EmployeeTable(employeeTable: employee,context: context,),
                            ),
                            SizedBox(height: 20.h),
                            Row(

                              children: [
                                GestureDetector(
                                  onTap:(){
                                    UserCubit.get(context).scrollLeft();

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
                                    UserCubit.get(context).scrollRight();

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
              ],
            ),
          ),
        );
      },

    );
  }
}
