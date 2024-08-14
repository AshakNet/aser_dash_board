import 'package:aser_dash_board/constant/color.dart';
import 'package:aser_dash_board/logic/booking/bookingActivityCubit/BookingActivityCubit.dart';

import 'package:aser_dash_board/view/home/booking/booking_content.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'details/detailsBooking.dart';
import 'details/details_trips.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    PageController booking = PageController();
    return BlocProvider(

      create: (BuildContext context)=>BookingActivityAndTripsCubit(),
      child: PageView(
        controller: booking,
        children: [
          BookingContent(bookingContent: booking),
          DetailsBooking(detailsBookingOrder: booking,),
          DetailsBookingTrips(detailsBookingTrips: booking,)
        ],
      )
    );
  }
}
