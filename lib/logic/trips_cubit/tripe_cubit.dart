
import 'dart:convert';
import 'dart:io';

import 'package:aser_dash_board/logic/trips_cubit/trips_state.dart';
import 'package:aser_dash_board/model/activity/getselectCompany/getSelectCompany.dart';
import 'package:aser_dash_board/model/trips/alltrips.dart';
import 'package:aser_dash_board/model/trips/getOneTripModel.dart';
import 'package:aser_dash_board/model/trips/insightModelTrips/insightModelTrips.dart';
import 'package:aser_dash_board/model/trips/profit_trip.dart';
import 'package:aser_dash_board/repositories/api/api%20consumer/apiConsumer.dart';
import 'package:aser_dash_board/repositories/api/enpoint/enpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;




class TripsCubit extends Cubit<TripsState> {
  TripsCubit() : super(HomeInatialState());

  static TripsCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();



  TextEditingController tripDate = TextEditingController();
  TextEditingController addtionalDate = TextEditingController();
  TextEditingController search = TextEditingController();
  /// add trips
  TextEditingController tripName = TextEditingController();
  TextEditingController numberOfSeats = TextEditingController();
  TextEditingController tripPrice = TextEditingController();
  TextEditingController tripPricePerPerson = TextEditingController();
  TextEditingController tripsDescription = TextEditingController();
  TextEditingController tripsRules = TextEditingController();
  TextEditingController meetingPoint = TextEditingController();
  TextEditingController tripDestention = TextEditingController();
  TextEditingController tripsStartDate = TextEditingController();
  TextEditingController tripsEndDate = TextEditingController();
  String? selectCompanyVar  ;
  GetAllCompanyModel? getAllCompanyModel;
  tripsCompanyModelProfit? getTripsProfitModel;
  String ? fixTrips;
  List <String> month = ["January","February","March","April","May","June","July","August","September","October","November","December"];




  final storage = new FlutterSecureStorage();
  int skip = 0;
   int take = 10;
  GetAllTripsModel? getAllTripsModel;
  GetOneTripsModel? getOneTripsModel;

 String? choosesMonthTrips;

  void chooseMonthTrips(value) {

    choosesMonthTrips = value;
    emit(ChoosesMonthTripsLoaded());
  }



  void load()async{
    await getProfitsTrips();
    await getAllTrips(skip: 0, take: 10);
    await getCompany();


  }

  void loadOne(String id)async{
    await getOneTripsMethod(id);
    await getProfitsInsightTrips(id);

  }

  getCompany() async {
    var response = await http.get(Uri.parse(EndPoint.getCompanyTrips));
    print(response.body);
    var databody = json.decode(response.body);
    getAllCompanyModel = GetAllCompanyModel.fromJson(databody);
  }

  void selectCompany(String ?value){
    selectCompanyVar = value;
    emit(SelectCompanySuccessful());
  }
  Future getProfitsTrips() async {

    emit(GetProfitsTripsLoading());

    final token = await storage.read(key: 'token');
    print("tokn is person blog = $token");
    http.Response response = await ApiConsumer().get(uri:
    fixTrips == null ?
    "${EndPoint.apiUrl}AdminTrips/GetCompanyAndIndividualTripCount" :
    "${EndPoint.apiUrl}AdminTrips/GetCompanyAndIndividualTripCount?MonthOrYear=Month&Month=$fixTrips"
        , token: token);
    var responseData = await json.decode(response.body);
    if (response.statusCode == 200) {

      getTripsProfitModel = tripsCompanyModelProfit.fromJson(responseData);

      emit(GetProfitsTripsSuccessful());
    } else {
      print(response.body);
      emit(GetProfitsTripsError(response.body));
    }
  }


  /// get All Trips
  Future getAllTrips({required int skip, required int take}) async {

    emit(GetAllTripsLoading());

    final token = await storage.read(key: 'token');

    var url ;
    if(search.text.trim().isEmpty && tripDate.text.trim().isEmpty && addtionalDate.text.trim().isEmpty && seats == null ){

      url = "${EndPoint.apiUrl}AdminTrips/GetAll?skip=$skip&take=$take";
    }
    else if (search.text.trim().isNotEmpty){
      url = "${EndPoint.apiUrl}AdminTrips/GetAll?SearchTerm=${search.text.trim()}&skip=$skip&take=$take";
    }
    else if (tripDate.text.trim().isNotEmpty  ){
      url = "${EndPoint.apiUrl}AdminTrips/GetAll?TripDate=${tripDate.text.trim()}&skip=$skip&take=$take";
    }
    else if (addtionalDate.text.trim().isNotEmpty){
      url = "${EndPoint.apiUrl}AdminTrips/GetAll?AdditionDate=${addtionalDate.text.trim()}&skip=$skip&take=$take";
    }


    http.Response response = await ApiConsumer().get(uri:
        url

        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getAllTripsModel = GetAllTripsModel.fromJson(responseData);
      emit(GetAllTripsSuccessful());

    } else {
      print(response.body);
      emit(GetAllTripsError(response.body));
    }


  }
  void scrollLeft() {



    if(skip == 0){
      print("object");
    }
    else{
      skip = skip - 10 ;
      getAllTrips(skip: skip,take: 10);
      emit(ScrollSusccessfulLeft());
    }




  }

  void scrollRight() {


    if(skip >= getAllTripsModel!.totalCount!.toInt()){
      print("object");
    }
    else{
      skip = skip + 10 ;
      getAllTrips(skip: skip,take: 10);



      emit(ScrollSusccessfulRigth());
    }







  }


  Future getOneTripsMethod(String id) async {

    emit(GetOneTripsLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:

    "${EndPoint.apiUrl}AdminTrips/$id"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getOneTripsModel = GetOneTripsModel.fromJson(responseData);
      emit(GetOneTripsSuccessful());

    } else {
      print(response.body);
      emit(GetOneTripsError(response.body));
    }


  }

  /// change active
  void activeTrips(String id)async{
    emit(ActiveLoading());
    var token  =await storage.read(key: 'token');
    http.Response response = await ApiConsumer().put(
        uri:EndPoint.activeTrips + id, rawData: {

    },token: token);
    var jsonBody = json.decode(response.body);
    if(response.statusCode == 200){
      print(response.body);
      emit(ActiveSuccessful());
    }
    else{
      print(response.body);
      emit(ActiveError( jsonBody['message']));
    }
  }

  void deleteTrips(String id)async{
    emit(DeleteTripsLoading());
    var token  =await storage.read(key: 'token');
    http.Response response = await ApiConsumer().put(
        uri:EndPoint.deleteTrips + id, rawData: {

    },token: token);
    var jsonBody = json.decode(response.body);
    if(response.statusCode == 200){
      print(response.body);
      emit(DeleteTripsSuccessful());
    }
    else{
      print(response.body);
      emit(DeleteTripsError( jsonBody['message']));
    }
  }


  void addTrips() async {
    emit(CreateTripsLoading());
    var token =await storage.read(key: "token");
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(EndPoint.addTrips),
    );

    request.headers['Authorization'] = 'Bearer $token';


    request.fields.addAll({
      'Title': tripName.text.trim(),
      'AvailableSeats': numberOfSeats.text.trim(),
      'Price': tripPrice.text,
      'IsPricePerPerson': "1",
      'Description': tripsDescription.text.trim(),
      'TripRoles' : tripsRules.text.trim() ,
      'MeetingPoint': meetingPoint.text,
      'Destination' : tripDestention.text,
      'StartDateAndMovementTime' :tripsStartDate.text ,
      "EndDateAdnArrivalTime" :tripsEndDate.text ,
      "CompanyId" :selectCompanyVar.toString()
    });


    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath('Photo', image!.path));
      var response = await request.send();
      print(response.statusCode);
      var databody = json.decode(await response.stream.bytesToString());
      print(databody);
      if (response.statusCode == 200) {
        emit(CreateTripsSuccessful());
      } else {
        print(databody['message']);
        emit(CreateTripsError(databody['message']));
      }
    } else {
      print("Please pick a logo");
      emit(CreateTripsError('Please pick a logo'));
    }
  }









  int change = 0 ;

  void toggle(int check) {

    change = check;
    emit(changeBackGround());
  }

  File? image ;
  Future getImage(ImageSource imageSource) async {
    var pickerFile = await ImagePicker().pickImage(source: imageSource);
    if (pickerFile != null) {
      image = File(pickerFile.path);
      emit(SuccessfulImage());
    } else {
      emit(ErrorImage());
    }
  }



  void PickDate(
      {context,
      required TextEditingController controller,
      required DateTime first,
      required DateTime lastTime}) async {
    emit(PickDateBlocLoading());
    DateTime? pickDate = await showDatePicker(
      //selectableDayPredicate: ,
        context: context,

        initialDate: DateTime.now(),
        firstDate: first,
        lastDate: lastTime);

    if (pickDate != null) {
      controller.text = pickDate.toString().split(" ")[0];
    }
    emit(PickDateBlocSSuccessfulState());
  }

  List hours = ["22-4-2024","4-8-3695","1-4-4562","2-4-2023",];
  /// choose hours
  String? choseHours ;
  void choseHoursFunction(value) {
    emit(StartDate());
    choseHours = value;
    emit(EndStart());
  }

  int selectedIndex = 0;
  String? accomandtionType;
  void changeAccomandtionype(value) {
    emit(StartDate());
    accomandtionType = value;
    emit(EndStart());
  }
  String? seats;
  void changeseats(value) {
    emit(StartDate());
    seats = value;
    emit(EndStart());
  }

  String? status;
  void changeStatus(value) {
    emit(StartDate());
    status = value;
    emit(EndStart());
  }
  GetInsightTripsModel? getInsightTripsModel;

  Future getProfitsInsightTrips(String id) async {

    emit(GetInsightLoading());

    final token = await storage.read(key: 'token');
    print("tokn is person blog = $token");
    http.Response response = await ApiConsumer().get(uri:

    "${EndPoint.apiUrl}AdminTrips/GetTripInsights?TripId=$id"

        , token: token);
    var responseData = await json.decode(response.body);
    if (response.statusCode == 200) {

      getInsightTripsModel = GetInsightTripsModel.fromJson(responseData);

      emit(GetInsightSuccessful());
    } else {
      print(response.body);
      emit(GetInsightError(response.body));
    }
  }


}
