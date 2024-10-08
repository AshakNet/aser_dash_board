import 'dart:ui';
import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/homeNavigator/home_naviagtor.dart';
import 'package:aser_dash_board/logic/homeNavigator/home_state.dart';
import 'package:aser_dash_board/view/booking/booking.dart';
import 'package:aser_dash_board/view/compaines/screen/compaines.dart';
import 'package:aser_dash_board/view/home/home/home.dart';

import 'package:aser_dash_board/view/individual/individual.dart';
import 'package:aser_dash_board/view/notification/notification.dart';
import 'package:aser_dash_board/view/orders/order.dart';
import 'package:aser_dash_board/view/services/accomandation/services.dart';
import 'package:aser_dash_board/view/services/activity/activity_home/activity_home.dart';
import 'package:aser_dash_board/view/services/products/home/productHome.dart';
import 'package:aser_dash_board/view/services/trips/home/tripsHome.dart';
import 'package:aser_dash_board/view/settings/settings.dart';
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
    Individual(),
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
              leading: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                child: Image.asset('assets/images/home/logo.png',fit: BoxFit.cover,color: black,height: 200.h,width: 200.w,),

              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                  child: Icon(
                    Icons.notifications,
                    color: Color.fromRGBO(93, 102, 121, 1),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                //   child: CircleAvatar(
                //     child: Image.asset("assets/images/profile.png"),
                //   ),
                // )
              ],
            ),
            body: Row(
              children: <Widget>[
                SizedBox(
                  width: 180.w,
                  child: Drawer(
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    backgroundColor: white,
                    surfaceTintColor: white,
                    child: ListView(
                      children: <Widget>[
                        _sideBarBuilder(
                            image: 'assets/images/home/home.png',
                            title: 'DashBoard',
                            index: 0,
                            iconWidth: 39.w,
                            iconHeight: 35.h,
                            context: context),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Container(
                            decoration: BoxDecoration(
                                color: HomeNavigatorCubit.get(context)
                                            .selectedIndex ==
                                        1
                                    ? orange
                                    : white,
                                borderRadius:
                                    BorderRadiusDirectional.circular(20.r)),
                            child: ExpansionTile(
                              initiallyExpanded: true,
                              title: CustomText(
                                text: "Services",
                                size: 16.sp,
                                function: () {
                                  HomeNavigatorCubit.get(context)
                                      .onItemTapped(1);
                                },
                                color: HomeNavigatorCubit.get(context)
                                            .selectedIndex ==
                                        1
                                    ? white
                                    : darkGrey,
                                fontWeight: FontWeight.w600,
                              ),
                              trailing: Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: HomeNavigatorCubit.get(context)
                                            .selectedIndex ==
                                        1
                                    ? white
                                    : black,
                              ),
                              leading: Image.asset(
                                "assets/images/home/services.png",
                                color: HomeNavigatorCubit.get(context)
                                            .selectedIndex ==
                                        1
                                    ? white
                                    : black,
                              ),
                              children: <Widget>[
                                _sideBarBuilder(
                                    image: 'assets/images/home/company.png',
                                    title: 'Trips',
                                    index: 2,
                                    iconWidth: 39.w,
                                    iconHeight: 28.h,
                                    context: context),
                                _sideBarBuilder(
                                    image: 'assets/images/home/company.png',
                                    title: 'Products',
                                    index: 3,
                                    iconWidth: 39.w,
                                    iconHeight: 28.h,
                                    context: context),
                                _sideBarBuilder(
                                    image: 'assets/images/home/company.png',
                                    title: 'Activity',
                                    index: 4,
                                    iconWidth: 39.w,
                                    iconHeight: 28.h,
                                    context: context),
                              ],
                            ),
                          ),
                        ),
                        _sideBarBuilder(
                            image: 'assets/images/home/company.png',
                            title: 'Companies',
                            index: 5,
                            iconWidth: 39.w,
                            iconHeight: 28.h,
                            context: context),
                        _sideBarBuilder(
                            image: 'assets/images/home/booking.png',
                            title: 'Booking',
                            index: 6,
                            iconWidth: 39.w,
                            iconHeight: 28.h,
                            context: context),
                        _sideBarBuilder(
                            image: 'assets/images/home/order.png',
                            title: 'Orders',
                            index: 7,
                            iconWidth: 39.w,
                            iconHeight: 28.h,
                            context: context),
                        _sideBarBuilder(
                            image: 'assets/images/home/order.png',
                            title: 'Individual',
                            index: 8,
                            iconWidth: 39.w,
                            iconHeight: 28.h,
                            context: context),
                        _sideBarBuilder(
                            image: 'assets/images/home/notification.png',
                            title: 'Notifications',
                            index: 9,
                            iconWidth: 39.w,
                            iconHeight: 36.h,
                            context: context),
                        _sideBarBuilder(
                            image: 'assets/images/home/setting.png',
                            title: 'Settings',
                            index: 10,
                            iconWidth: 36.w,
                            iconHeight: 28.h,
                            context: context),
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
              color: HomeNavigatorCubit.get(context).selectedIndex == index
                  ? orange
                  : white,
              borderRadius: BorderRadiusDirectional.circular(20.r)),
          child: Row(
            children: [
              Image.asset(
                image,
                width: iconWidth,
                height: iconHeight,
                color: HomeNavigatorCubit.get(context).selectedIndex == index
                    ? white
                    : blue,
              ),
              SizedBox(
                width: 5.w,
              ),
              CustomText(
                text: title,
                size: 18.sp,
                color: HomeNavigatorCubit.get(context).selectedIndex == index
                    ? white
                    : darkGrey,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
