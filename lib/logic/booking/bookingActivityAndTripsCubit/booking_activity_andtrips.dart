import 'dart:convert';

import 'package:aser_dash_board/model/booking/bookingActivity.dart';
import 'package:aser_dash_board/model/booking/bookingTrips.dart';
import 'package:aser_dash_board/model/booking/booking_details_activity.dart';
import 'package:aser_dash_board/model/booking/getdetails_trips.dart';

import 'package:aser_dash_board/repositories/api/api%20consumer/apiConsumer.dart';
import 'package:aser_dash_board/repositories/api/enpoint/enpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'booking_actvity_and _trips_state.dart';
import 'package:http/http.dart' as http;


class BookingActivityAndTripsCubit extends Cubit<BookingActivityState> {
  BookingActivityAndTripsCubit() : super(HomeInatialState());

  static BookingActivityAndTripsCubit get(context) => BlocProvider.of(context);
  final storage = new FlutterSecureStorage();


  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController addtionalDateActivity = TextEditingController();
  TextEditingController search = TextEditingController();
  TextEditingController searchTrips = TextEditingController();
  String? statusConvert;
  GetAllBookingActivityModel? getAllBookingActivityModel;
  GetAllBookingTripsModel ? getAllTripsBookingModel;
  GetBookingDetailsActivityModel? getBookingDetailsActivityModel;
  GetBookingDetailsTripsModel? getBookingDetailsTripsModel;
  int skip = 0;
  int take = 10;


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


  void PickDate({context, required TextEditingController controller,required DateTime firstDate,required DateTime lastDate,required DateTime initialDate}) async {
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

 void load ()async {
    await getAllBookingActivity(skip: 0, take: 10);
    await getAllBookingTrips(skip: 0, take: 10);
 }

  /// get booking activity

  Future getAllBookingActivity({required int skip, required int take}) async {

    emit(GetAllBookingActivityLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:
    search.text.trim().isEmpty && addtionalDateActivity.text.trim().isEmpty && statusConvert == null ?
    "${EndPoint.apiUrl}AdminBooking/GetAllActivitesBooking?skip=$skip&take=$take" :

    addtionalDateActivity.text.trim().isNotEmpty ?
    "${EndPoint.apiUrl}AdminBooking/GetAllActivitesBooking?BookingDate=${addtionalDateActivity.text.trim()}&skip=$skip&take=$take" :
      statusConvert != null ?
      "${EndPoint.apiUrl}AdminBooking/GetAllActivitesBooking?BookingStatus=$statusConvert&skip=$skip&take=$take "  :

    "${EndPoint.apiUrl}AdminBooking/GetAllActivitesBooking?SearchValue=${search.text.trim()}&skip=$skip&take=$take"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getAllBookingActivityModel = GetAllBookingActivityModel.fromJson(responseData);
      emit(GetAllBookingActivitySuccessful());

    } else {
      print(response.body);
      emit(GetAllBookingActivityError(response.body));
    }


  }




  Future getAllBookingTrips({required int skip, required int take}) async {

    emit(GetAllBookingTripsLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:
    searchTrips.text.trim().isEmpty ?
    "${EndPoint.apiUrl}AdminBooking/GetAllTripsBooking?skip=$skip&take=$take" :

    "${EndPoint.apiUrl}AdminBooking/GetAllTripsBooking?SearchValue=${searchTrips.text.trim()}&skip=$skip&take=$take"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getAllTripsBookingModel = GetAllBookingTripsModel.fromJson(responseData);
      emit(GetAllBookingTripsSuccessful());

    } else {
      print(response.body);
      emit(GetAllBookingTripsError(response.body));
    }


  }

  void loadOne (String id)async{
    await getBookingDetailsActivity(id);
    await getBookingDetailsTrips(id);
}

  /// details
  Future getBookingDetailsActivity(String id) async {

    emit(GetBookingActivityDetailsLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:

    "${EndPoint.apiUrl}AdminBooking/GetOneBookingActivityDetails?BookingId=$id"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getBookingDetailsActivityModel = GetBookingDetailsActivityModel.fromJson(responseData);
      emit(GetBookingActivityDetailsSuccessful());

    } else {
      print(response.body);
      emit(GetBookingActivityDetailsError(response.body));
    }


  }

  ///
  Future getBookingDetailsTrips(String id) async {

    emit(GetBookingTripsDetailsLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:

    "${EndPoint.apiUrl}AdminBooking/GetOneBookingTripDetails?BookingId=$id"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getBookingDetailsTripsModel = GetBookingDetailsTripsModel.fromJson(responseData);
      emit(GetBookingTripsDetailsSuccessful());

    } else {
      print(response.body);
      emit(GetBookingTripsDetailsError(response.body));
    }


  }


  /// accept
  void acceptBooking(String id)async{
    emit(AcceptBookingLoading());
    var token  =await storage.read(key: 'token');
    http.Response response = await ApiConsumer().post(
        uri:"${EndPoint.apiUrl}Booking/AcceptBooking?id=$id", rawData: {

    },token: token);
    var jsonBody = json.decode(response.body);
    if(response.statusCode == 200){
      print(response.body);
      emit(AcceptBookingSuccessful());
    }
    else{
      print(jsonBody['message']);
      emit(AcceptBookingError( jsonBody['message']));
    }
  }

  /// delete
  void cancelBooking(String id)async{
    emit(CancelBookingLoading());
    var token  =await storage.read(key: 'token');
    http.Response response = await ApiConsumer().post(
        uri:"${EndPoint.apiUrl}Booking/CancelBooking?id=$id", rawData: {
    },token: token);
    var jsonBody = json.decode(response.body);
    if(response.statusCode == 200){
      print(response.body);
      emit(CancelBookingSuccessful());
    }
    else{
      print(response.body);
      emit(CancelBookingError( jsonBody['message']));
    }
  }



  void scrollLeftActivity() {



    if(skip == 0){
      print("object");
    }
    else{
      skip = skip - 10 ;
      getAllBookingActivity(skip: skip,take: 10);
      emit(ScrollSusccessfulLeftActivity());
    }


  }

  void scrollRightActivity() {


    if(skip >= getAllBookingActivityModel!.data!.totalCount!.toInt()){
      print("object");
    }
    else{
      skip = skip + 10 ;
      getAllBookingActivity(skip: skip,take: 10);



      emit(ScrollSusccessfulRigthActivity());
    }







  }



  void scrollLeftTrips() {



    if(skip == 0){
      print("object");
    }
    else{
      skip = skip - 10 ;
      getAllBookingTrips(skip: skip,take: 10);
      emit(ScrollSusccessfulLeftTrips());
    }


  }

  void scrollRightTrips() {


    if(skip >= getAllTripsBookingModel!.data!.totalCount!.toInt()){
      print("object");
    }
    else{
      skip = skip + 10 ;
      getAllBookingTrips(skip: skip,take: 10);



      emit(ScrollSusccessfulRigthTrips());
    }







  }






}