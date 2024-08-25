import 'dart:convert';
import 'package:aser_dash_board/model/individual/indivadulBookingModel.dart';
import 'package:aser_dash_board/model/individual/individual.dart';
import 'package:aser_dash_board/repositories/api/api%20consumer/apiConsumer.dart';
import 'package:aser_dash_board/repositories/api/enpoint/enpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'indivadulState.dart';


class IndividualCubit extends Cubit<IndividualState> {
  IndividualCubit() : super(HomeInatialState());

  static IndividualCubit get(context) => BlocProvider.of(context);
  final storage = new FlutterSecureStorage();

  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController addtionalDate = TextEditingController();
  TextEditingController search = TextEditingController();
  String? statusConvert;
  String? transaction;
  String?gender;
  String?payment;
  GetAllIndividulsModel? getAllIndividulsModel;
  GetAllIndivadualBookingModel? getAllIndivadualBookingModel;
  String?convertNumberStatus;
  int skip = 0;
  int take = 10;


  int change = 0;
  void toggle(int check) {
    change = check;
    emit(changeBackGround());
  }
  void changeGender(val) {
    gender = val;
    emit(ChangeGender());
  }  void changeTransaction(val) {
    transaction = val;
    emit(ChangeTransaction());
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

  void load ()async{
    await getAllIndividual(skip: 0,take: 10);
  }

  Future getAllIndividual({required int skip, required int take}) async {

    emit(GetAllIndividualLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:
    search.text.trim().isEmpty && addtionalDate.text.trim().isEmpty && statusConvert == null && gender ==null && transaction ==null && payment ==null  ?
    "${EndPoint.apiUrl}Individuals/GetAllIndividuals?skip=$skip&take=$take" :

    addtionalDate.text.trim().isNotEmpty ?
    "${EndPoint.apiUrl}Individuals/GetAllIndividuals?AdditionDate=${addtionalDate.text.trim()}&skip=$skip&take=$take" :
    statusConvert != null ?
    "${EndPoint.apiUrl}Individuals/GetAllIndividuals?Status=$statusConvert&skip=$skip&take=$take":
    gender !=null ?
    "${EndPoint.apiUrl}Individuals/GetAllIndividuals?Gender=$gender&skip=$skip&take=$take":
     transaction != null ?
     "${EndPoint.apiUrl}Individuals/GetAllIndividuals?Transactions=$transaction&skip=$skip&take=$take":
      payment != null ?
      "${EndPoint.apiUrl}Individuals/GetAllIndividuals?Payments=$payment&skip=$skip&take=$take":
      "${EndPoint.apiUrl}Individuals/GetAllIndividuals?searchTerm=${search.text.trim()}&skip=$skip&take=$take"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getAllIndividulsModel =GetAllIndividulsModel.fromJson(responseData);


      emit(GetAllIndividualSuccessful());

    } else {
      print(response.body);
      emit(GetAllIndividualError(response.body));
    }


  }




  /// get one order

  Future getIndividualDetails({required String id}) async {

    emit(GetIndividualDetailsLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:

    "${EndPoint.apiUrl}Individuals/GetAllIndividualBooking?userId=$id"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getAllIndivadualBookingModel = GetAllIndivadualBookingModel.fromJson(responseData);

      emit(GetIndividualDetailsSuccessful());

    } else {
      print(response.body);
      emit(GetIndividualDetailsError(response.body));
    }


  }
  void scrollLeft() {



    if(skip == 0){
      print("object");
    }
    else{
      skip = skip - 10 ;
      getAllIndividual(skip: skip,take: 10);
      emit(ScrollSusccessfulLeft());
    }




  }

  void scrollRight() {


    if(skip >= getAllIndividulsModel!.data!.totalCount!.toInt()){
      print("object");
    }
    else{
      skip = skip + 10 ;
      getAllIndividual(skip: skip,take: 10);



      emit(ScrollSusccessfulRigth());
    }







  }




}