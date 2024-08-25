
import 'package:aser_dash_board/logic/booking/bookingActivityAndTripsCubit/booking_activity_andtrips.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'booking trips.dart';
import 'booking_content.dart';
import 'details/detailsBooking.dart';
import 'details/details_trips.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    PageController booking = PageController();
    return BlocProvider(

      create: (BuildContext context)=>BookingActivityAndTripsCubit()..load(),
      child: PageView(
        controller: booking,
        children: [
          BookingContentActivity(bookingContent: booking),
          BookingTrips(booking: booking,),
          DetailsBooking(detailsBookingOrder: booking,),
          DetailsBookingTrips(detailsBookingTrips: booking,),

        ],
      )
    );
  }
}
