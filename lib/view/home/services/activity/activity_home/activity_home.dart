
import 'package:aser_dash_board/logic/activity_cubit/activitycubit.dart';
import 'package:aser_dash_board/view/home/services/activity/addActivity/addActivity.dart';
import 'package:aser_dash_board/view/home/services/activity/detailsActivity/detailsActivity.dart';
import 'package:aser_dash_board/view/home/services/activity/insight/insightActivity.dart';
import 'package:aser_dash_board/view/home/services/activity/order/order.dart';
import 'package:aser_dash_board/view/home/services/activity/order/orderDetails.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../content/content.dart';




class ActivityHome extends StatelessWidget {
  PageController activityHome = PageController();
  ActivityHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(

      create: (BuildContext context)=>ActivityCubit()..load(),
      child: PageView(
        controller:activityHome ,
        children:  [
          /// 0
          ActivityContent(activity: activityHome),
          // /// 1
          ActivityDetails(activity: activityHome,),
          /// 2
          InsightsActivityPage(insightsActivity: activityHome,),

          /// 3
          OrderActivity(orderActivity: activityHome,),
          /// 4
          OrderDetailsActivity(detailsOrderActivity: activityHome,),

          /// 5
          AddActivity(addActivity: activityHome,)

          /// add Activity


        ],
      )
    );
  }
}
