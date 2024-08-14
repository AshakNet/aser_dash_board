import 'package:aser_dash_board/logic/booking/order_cubit/order_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'details_order_Booking.dart';
import 'order_content.dart';

class Orders extends StatelessWidget {
   Orders({super.key});

  @override
  Widget build(BuildContext context) {
    PageController bookingOrder = PageController();

    return BlocProvider(

      create: (BuildContext context)=>OrderCubit(),
      child: PageView(
        controller:bookingOrder,
        children: [
          OrderContent(orderContent: bookingOrder,),
           DetailsOrderBooking(detailsOrderBooking: bookingOrder,)

        ],
      ),
    );
  }
}
