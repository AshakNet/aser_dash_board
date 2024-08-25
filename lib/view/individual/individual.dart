
import 'package:aser_dash_board/logic/booking/bookingActivityAndTripsCubit/booking_activity_andtrips.dart';
import 'package:aser_dash_board/logic/indivdulCubit/indivadulCubit.dart';
import 'package:aser_dash_board/view/individual/induviadul_content.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'indivadualDetails.dart';



class Individual extends StatelessWidget {
  const Individual({super.key});

  @override
  Widget build(BuildContext context) {
    PageController individual = PageController();
    return BlocProvider(

        create: (BuildContext context)=>IndividualCubit()..load(),
        child: PageView(
          controller: individual,
          children: [
            IndividualContent( individualContent: individual,),
            IndividualDetails(detailIndividualsBooking: individual,)


          ],
        )
    );
  }
}
