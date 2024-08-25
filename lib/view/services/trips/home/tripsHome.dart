import 'package:aser_dash_board/logic/trips_cubit/tripe_cubit.dart';
import 'package:aser_dash_board/view/services/trips/addTrips/addTrips.dart';
import 'package:aser_dash_board/view/services/trips/details/tripDetails.dart';
import 'package:aser_dash_board/view/services/trips/home/trips_content.dart';
import 'package:aser_dash_board/view/services/trips/order/orderdetails.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../insigth/insightsTriple.dart';
import '../order/orders.dart';

class Trips extends StatelessWidget {
  PageController tripsController = PageController();
   Trips({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(

      create: (BuildContext context)=>TripsCubit()..load(),
      child: PageView(
        controller:tripsController ,
        children: [
          TripsContent(tripleContent: tripsController,),
          TripDetails(detailsTrips: tripsController,),
          InsightsTrips(insights: tripsController,),
          OrdersTrips(order: tripsController,),
          OrderDetails(detailsOrder: tripsController,),
          AddTrips(addTrips: tripsController,)


        ],
      )
    );
  }
}
