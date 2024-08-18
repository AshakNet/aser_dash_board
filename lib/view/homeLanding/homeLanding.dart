
import 'dart:ui';
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/homeNavigator/home_naviagtor.dart';
import 'package:aser_dash_board/logic/homeNavigator/home_state.dart';
import 'package:aser_dash_board/view/compaines/screen/compaines.dart';
import 'package:aser_dash_board/view/home/booking/booking.dart';
import 'package:aser_dash_board/view/home/home/home.dart';
import 'package:aser_dash_board/view/home/notification/notification.dart';
import 'package:aser_dash_board/view/home/orders/order.dart';
import 'package:aser_dash_board/view/home/services/activity/activity_home/activity_home.dart';
import 'package:aser_dash_board/view/home/services/products/home/productHome.dart';
import 'package:aser_dash_board/view/home/services/accomandation/services.dart';
import 'package:aser_dash_board/view/home/services/trips/home/tripsHome.dart';
import 'package:aser_dash_board/view/home/settings/settings.dart';
import 'package:aser_dash_board/widgets/customText/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeLanding extends StatelessWidget {
  HomeLanding({super.key});

  var search = TextEditingController();

  var controllerComment = TextEditingController();

  List<Widget> screens = [
    Home(),
    Services(),
    Trips(),
    ProductHome(),
    ActivityHome(),
    Compaines(),
    Booking(),
    Orders(),
    NotificationPage(),
    Settings()

  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeNavigatorCubit(),
      child: BlocConsumer<HomeNavigatorCubit, HomeNavigatorState>(
        listener: (context, state) {},
        builder: (BuildContext context, state) {
          return Scaffold(
            backgroundColor: white,
            //appBar: CustomAppBar(context: context),
            appBar: AppBar(

              backgroundColor: white,
              centerTitle: true,
              toolbarHeight: 80.h,
              leadingWidth: 120.w,
              leading:Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 5.w),
                child: Text("Nomadica",style: TextStyle(fontWeight:FontWeight.w700,fontSize: 20.sp,color: orange),),
              ),

              title: Padding(

                padding:  EdgeInsets.symmetric(vertical: 10.h),
                child: SizedBox(
                  width: 500.w,

                  child: TextFormField(
                    controller: TextEditingController(),
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
                      filled: true,

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
                      hintText: 'search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
                  child: Icon(Icons.notifications,color: Color.fromRGBO(93, 102, 121, 1),),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
                  child: CircleAvatar(
                    child: Image.asset("assets/images/profile.png"),
                  ),
                )
              ],

            ),
            body: Row(
              children: <Widget>[
                SizedBox(
                  width: 180.w,
                  child: Drawer(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    backgroundColor: white,
                    surfaceTintColor: white,
                    child: ListView(
                      children: <Widget>[

                        _sideBarBuilder(
                            image: 'assets/images/home/home.png', title: 'DashBoard', index: 0, iconWidth: 39.w, iconHeight: 35.h, context: context),

                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                          child: Container(
                            width: 140.w,

                            decoration: BoxDecoration(
                                        color:  HomeNavigatorCubit.get(context).selectedIndex == 1 ? orange : white,
                                        borderRadius: BorderRadiusDirectional.circular(20.r)
                            ),
                            child: ExpansionTile(

                              title:  CustomText(
                                text: "Services",
                                size: 16.sp,function: (){
                                HomeNavigatorCubit.get(context).onItemTapped(1);
                              },
                                color: HomeNavigatorCubit.get(context).selectedIndex == 1 ? white :  darkGrey,
                                fontWeight: FontWeight.w600,
                              ),
                              trailing: Icon(Icons.keyboard_arrow_down_sharp,color:HomeNavigatorCubit.get(context).selectedIndex == 1 ? white : black,),
                              leading: Image.asset(
                                           "assets/images/home/services.png",color: HomeNavigatorCubit.get(context).selectedIndex == 1 ? white : black,),
                              children: <Widget>[

                                _sideBarBuilder(
                                    image: 'assets/images/home/company.png', title: 'Trips', index: 2, iconWidth: 39.w, iconHeight: 28.h, context: context),
                                _sideBarBuilder(
                                    image: 'assets/images/home/company.png', title: 'Products', index: 3, iconWidth: 39.w, iconHeight: 28.h, context: context),

                                _sideBarBuilder(
                                    image: 'assets/images/home/company.png', title: 'Activity', index: 4, iconWidth: 39.w, iconHeight: 28.h, context: context),
                              ],
                            ),
                          ),
                        ),


                        _sideBarBuilder(
                            image: 'assets/images/home/company.png', title: 'Companies', index: 5, iconWidth: 39.w, iconHeight: 28.h, context: context),
                        _sideBarBuilder(
                            image: 'assets/images/home/booking.png', title: 'Booking', index: 6, iconWidth: 39.w, iconHeight: 28.h, context: context),
                        _sideBarBuilder(
                            image: 'assets/images/home/order.png', title: 'Orders', index: 7, iconWidth: 39.w, iconHeight: 28.h, context: context),
                        _sideBarBuilder(
                            image: 'assets/images/home/notification.png', title: 'Notifications', index: 8, iconWidth: 39.w, iconHeight: 36.h, context: context),
                        _sideBarBuilder(
                            image: 'assets/images/home/setting.png', title: 'Settings', index: 9, iconWidth: 36.w, iconHeight: 28.h, context: context),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: screens[HomeNavigatorCubit.get(context).selectedIndex],
                ),

                // const VerticalDivider(thickness: 0, width: 0),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _sideBarBuilder(
      {required String image,
        required String title,
        required int index,
        required double iconWidth,
        required double iconHeight,
        required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: GestureDetector(
        onTap: () {
          //_onItemTapped(index);
          HomeNavigatorCubit.get(context).onItemTapped(index);
        },
        child: Container(
          width: 140.w,
          height: 60.h,

          decoration: BoxDecoration(
            color:  HomeNavigatorCubit.get(context).selectedIndex == index ? orange : white,
            borderRadius: BorderRadiusDirectional.circular(20.r)
          ),
          child: Row(
            children: [
              Image.asset(
                image,
                width: iconWidth,
                height: iconHeight,
                color:HomeNavigatorCubit.get(context).selectedIndex == index ? white :  blue,
              ),
             SizedBox(width: 5.w,),
              CustomText(
                text: title,
                size: 18.sp,
                color: HomeNavigatorCubit.get(context).selectedIndex == index ? white :  darkGrey,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
