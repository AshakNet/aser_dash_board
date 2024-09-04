import 'dart:convert';

import 'package:aser_dash_board/model/order/order.dart';
import 'package:aser_dash_board/model/order/orderDetails.dart';
import 'package:aser_dash_board/repositories/api/api%20consumer/apiConsumer.dart';
import 'package:aser_dash_board/repositories/api/enpoint/enpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'order_state.dart';
import 'package:http/http.dart' as http;


class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(HomeInatialState());

  static OrderCubit get(context) => BlocProvider.of(context);
  final storage = new FlutterSecureStorage();

  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController addtionalDate = TextEditingController();
  TextEditingController search = TextEditingController();
  String? statusConvert;
  GetAllOrderModel ?getAllOrderModel;
  GetOrderDetails? getOrderDetailsModel;

  int change = 0;
  void toggle(int check) {
    change = check;
    emit(changeBackGround());
  }

  /// choose type trip

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

  ///
  ///
  ///
  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
       timeController.text = picked.format(context);
    }
  }
  void load ()async{
    await getAllOrder(skip: 0,take: 10);
  }
  Future getAllOrder({required int skip, required int take}) async {

    emit(GetAllOrderLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:
    search.text.trim().isEmpty && addtionalDate.text.trim().isEmpty && statusConvert == null ?
    "${EndPoint.apiUrl}AdminBooking/GetAllOrdersForAdmin?skip=$skip&take=$take" :

    addtionalDate.text.trim().isNotEmpty ?
    "${EndPoint.apiUrl}AdminBooking/GetAllOrdersForAdmin?OrderDate=${addtionalDate.text.trim()}&skip=$skip&take=$take" :
    statusConvert != null ?
    "${EndPoint.apiUrl}AdminBooking/GetAllOrdersForAdmin?OrderStatus=$statusConvert&skip=$skip&take=$take "  :

    "${EndPoint.apiUrl}AdminBooking/GetAllOrdersForAdmin?SearchValue=${search.text.trim()}&skip=$skip&take=$take"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getAllOrderModel = GetAllOrderModel.fromJson(responseData);
      emit(GetAllOrderSuccessful());

    } else {
      print(response.body);
      emit(GetAllOrderError(response.body));
    }


  }

  /// accept
  void acceptOrder(String id)async{
    emit(AcceptOrderLoading());
    var token  =await storage.read(key: 'token');
    http.Response response = await ApiConsumer().post(
        uri:"${EndPoint.apiUrl}Orders/AcceptOrder?BookingId=$id", rawData: {

    },token: token);
    var jsonBody = json.decode(response.body);
    if(response.statusCode == 200){
      print(response.body);
      emit(AcceptOrderSuccessful());
    }
    else{
      print(jsonBody['message']);
      emit(AcceptOrderError( jsonBody['message']));
    }
  }

  /// delete
  void cancelOrder(String id)async{
    emit(CancelOrderLoading());
    var token  =await storage.read(key: 'token');
    http.Response response = await ApiConsumer().post(
        uri:"${EndPoint.apiUrl}Orders/CancelOrder?BookingId=$id", rawData: {
    },token: token);
    var jsonBody = json.decode(response.body);
    if(response.statusCode == 200){
      print(response.body);
      emit(CancelOrderSuccessful());
    }
    else{
      print(response.body);
      emit(CancelOrderError( jsonBody['message']));
    }
  }


  /// get one order

  Future getOrderDetails(String id) async {

    emit(GetOrderDetailsLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:

    "${EndPoint.apiUrl}AdminBooking/GetOneOrderDetailsForAdmin?BookingId=$id"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getOrderDetailsModel = GetOrderDetails.fromJson(responseData);
      emit(GetOrderDetailsSuccessful());

    } else {
      print(response.body);
      emit(GetOrderDetailsError(response.body));
    }


  }


  /// delever order
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  String convertTimeTo24HourFormat(String time) {
    final DateFormat inputFormat = DateFormat("hh:mm a");
    final DateFormat outputFormat = DateFormat("HH:mm:ss");
    final DateTime parsedTime = inputFormat.parse(time);
    final String formattedTime = outputFormat.format(parsedTime);
    return formattedTime;
  }

  Future<void> addDeliveryTime({required String id}) async {
    String formattedTime = convertTimeTo24HourFormat(timeController.text.trim());


    emit(AddDeliveryLoading());
    var token = await storage.read(key: 'token');
    try {
      http.Response response = await http.put(
        Uri.parse("${EndPoint.apiUrl}Individuals/AddOrderDeliveryTime/$id"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "date": dateController.text.trim(),
          "time": formattedTime,
        }),
      );
      var jsonBody = json.decode(response.body);
      if (response.statusCode == 200) {
        emit(AddDeliverySuccessful());
      } else {
        print(jsonBody['message']);
        print(dateController.text.trim());
        print(timeController.text.trim());
        emit(AddDeliveryError(jsonBody['message']));
      }
    } catch (e) {
      print(e.toString());
      emit(AddDeliveryError(e.toString()));
    }
  }
/// confirm order


  void confirmOrder(String id)async{
    emit(ConfirmOrderLoading());
    var token  =await storage.read(key: 'token');
    http.Response response = await ApiConsumer().put(
        uri:"${EndPoint.apiUrl}Orders/ConfirmOrderDelivery?BookingId=$id", rawData: {

    },token: token);
    var jsonBody = json.decode(response.body);
    if(response.statusCode == 200){
      print(response.body);
      emit(ConfirmOrderSuccessful());
    }
    else{
      print(jsonBody['message']);
      emit(ConfirmOrderError( jsonBody['message']));
    }
  }

}


