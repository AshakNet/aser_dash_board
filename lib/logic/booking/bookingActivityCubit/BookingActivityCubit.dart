import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'booking_actvity_state.dart';

class BookingActivityAndTripsCubit extends Cubit<BookingActivityState> {
  BookingActivityAndTripsCubit() : super(HomeInatialState());

  static BookingActivityAndTripsCubit get(context) => BlocProvider.of(context);

  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController addtionalDate = TextEditingController();
  String? statusConvert;

  int change = 0;

  void toggle(int check) {
    change = check;
    emit(changeBackGround());
  }


  /// choose type trip

  String ? choseTypeTrip;

  void changeTypeTrips(value){
    choseTypeTrip = value;

    emit(ChoseTypeTripsLoadded());
  }

  List <String> typeTrips = ["Company","individual"] ;

  List <String> statusList = [
    "Pending",
    "UpComing",
    "Complete",
    "Cancelled"
  ];

  String? status;
  void changeStatus(value){
    status = value;

    emit(ChangeStatusLoaded());
  }


  void PickDate(
      {context, required TextEditingController controller,required DateTime firstDate,required DateTime lastDate,required DateTime initialDate}) async {
    emit(PickDateBlocLoading());
    DateTime? pickDate = await showDatePicker(
      //selectableDayPredicate: ,
        context: context,

        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);

    if (pickDate != null) {
      controller.text = pickDate.toString().split(" ")[0];
    }
    emit(PickDateBlocSSuccessfulState());
  }


}