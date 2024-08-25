
import 'dart:convert';
import 'dart:io';


import 'package:aser_dash_board/model/GovernmentsModel.dart';
import 'package:aser_dash_board/model/accomandtion/accomandtionType.dart';
import 'package:aser_dash_board/model/accomandtion/allaccomadtionModel.dart';
import 'package:aser_dash_board/model/accomandtion/getInsightRoom.dart';
import 'package:aser_dash_board/model/accomandtion/profitModel.dart';
import 'package:aser_dash_board/model/accomandtion/review.dart';
import 'package:aser_dash_board/repositories/api/api%20consumer/apiConsumer.dart';
import 'package:aser_dash_board/repositories/api/enpoint/enpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../model/accomandtion/getOneAccomandtion.dart';
import 'accomandtion_state.dart';



class AccomandtionCubit extends Cubit<AccomandtionState> {
  AccomandtionCubit() : super(HomeInatialState());

  static AccomandtionCubit get(context) => BlocProvider.of(context);


  final storage = new FlutterSecureStorage();
TextEditingController addationalDate = TextEditingController();
  TextEditingController search = TextEditingController();

  int skip = 0;
  int take = 10;
  int x = 20 ;
  bool read = true;
  String? choosesMonthAccomandtion;
  File? image ;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List <String> month = ["January","February","March","April","May","June","July","August","September","October","November","December"];
  String ? fixAccomandtion;
  String? chooseYears;
  String? choseMonth ;
  String? status ;
  String? statusConvert;
  String? goverment;
  String? accomandtionType;
  String governateController = 'Alex';
  String? statusNumber ;

  /// models
  GetProfitModelAccomandtion? getProfitModelAccomandtion ;
  GovernmentsModel?  governmentsModel;
  GetAccomandtionTypeModel? accomandtionTypeModel;
  GetAllAccomandtionModel ? allAccomandtionModel;
  GetOneAccomandtionModel ? getOneAccomandtionModel;
  GetReviewModel? getReviewModel;
  GetInsightModel ? getInsightModel;
  String? chooseMonthInsight;
String ? fixInsight;


  void scrollLeft() {



    if(skip == 0){
      print("object");
    }
    else{
      skip = skip - 10 ;
      getAllAccomandtion(skip: skip,take: 10);
      emit(ScrollSusccessfulLeft());
    }




  }


  void scrollRight() {


    if(skip >= allAccomandtionModel!.totalCount!.toInt()){
      print("object");
    }
    else{
      skip = skip + 10 ;
      getAllAccomandtion(skip: skip,take: 10);



      emit(ScrollSusccessfulRigth());
    }







  }


  /// methods

  void load()async{
    await getProfitsAccomodation();
    await getAllAccomandtion(skip: 0, take: 10);


    await getGovernments();
    await getAccomandtionType();


  }

  /// accomandtion type
  getAccomandtionType() async {
    var response = await http.get(Uri.parse(EndPoint.accomandtionType));
    print(response.body);
    var databody = json.decode(response.body);
    accomandtionTypeModel = GetAccomandtionTypeModel.fromJson(databody);


  }


  Future getProfitsAccomodation() async {

    emit(GetProfitsAccomodationLoading());

    final token = await storage.read(key: 'token');
    print("tokn is person blog = $token");
    http.Response response = await ApiConsumer().get(uri:
    fixAccomandtion == null ?
    "${EndPoint.apiUrl}Accomodation/AdminAccomidationStatistics" :
    "${EndPoint.apiUrl}Accomodation/AdminAccomidationStatistics?MonthOrYear=$fixAccomandtion"
        , token: token);
    var responseData = await json.decode(response.body);
    if (response.statusCode == 200) {

      getProfitModelAccomandtion = GetProfitModelAccomandtion.fromJson(responseData);

      emit(GetProfitsAccomodationSuccessful());
    } else {
      print(response.body);
      emit(GetProfitsAccomodationError(response.body));
    }
  }

  /// get all accomandtion

  Future getAllAccomandtion({required int skip, required int take}) async {

    emit(GetAllAccomandtionLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:
    search.text.trim().isEmpty  && statusNumber ==null ?
    "${EndPoint.apiUrl}Accomodation/GetAccomodationForAdmin?Skip=$skip&Take=$take" :
       statusNumber !=null ?
      "${EndPoint.apiUrl}Accomodation/GetAccomodationForAdmin?Status=$statusNumber&Skip=$skip&Take=$take" :
      "${EndPoint.apiUrl}Accomodation/GetAccomodationForAdmin?SearchTerm=${search.text.trim()}&Skip=$skip&Take=$take"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      allAccomandtionModel = GetAllAccomandtionModel.fromJson(responseData);
      emit(GetAllAccomandtionSuccessful());

    } else {
      print(response.body);
      emit(GetAllAccomandtionError(response.body));
    }


  }

  void loadOne({required String id})async{
    await getOneAccomandtion(id);
    await getReview(id: id,skip: 0,take: 10);


  }
  /// get accomantion id
  Future getOneAccomandtion(String id) async {



    emit(GetOneAccomandtionLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:

    "${EndPoint.apiUrl}Accomodation/Admin/GetServiceById?id=$id"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getOneAccomandtionModel = GetOneAccomandtionModel.fromJson(responseData);
      emit(GetOneAccomandtionSuccessful());

    } else {
      print(response.body);
      emit(GetOneAccomandtionError(response.body));
    }


  }

  ///
  Future getReview({required String id, required int skip, required int take}) async {



    emit(GetReviewLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:

    "${EndPoint.apiUrl}Reviews/Admin/GeAccomodationReviewsForAdmin?AccomodationId=$id&skip=$skip&take=$take"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getReviewModel = GetReviewModel.fromJson(responseData);
      emit(GetReviewSuccessful());

    } else {
      print(response.body);
      emit(GetReviewError(response.body));
    }


  }

   /// accept
  ///
  void changeStatusAccomandtionAccepted(String id)async{
    emit(ChangeStatusLoading());
    var token  =await storage.read(key: 'token');
    http.Response response = await ApiConsumer().put(
        uri:EndPoint.changeStatusAccomAccepted + id, rawData: {

    },token: token);
    var jsonBody = json.decode(response.body);
    if(response.statusCode == 200){
      print(response.body);
      emit(ChangeStatusSuccessful());
    }
    else{
      print(response.body);
      emit(ChangeStatusError( jsonBody['message']));
    }
  }

/// reject
  void changeStatusAccomandtionRejected(String id)async{
    emit(ChangeStatusRejectedLoading());
    var token  =await storage.read(key: 'token');
    http.Response response = await ApiConsumer().put(
        uri:EndPoint.changeStatusAccomRejected + id, rawData: {

    },token: token);
    var jsonBody = json.decode(response.body);
    if(response.statusCode == 200){
      print(response.body);
      emit(ChangeStatusRejectedSuccessful());
    }
    else{
      print(response.body);
      emit(ChangeStatusRejectedError( jsonBody['message']));
    }
  }

  /// insight
  Future getInsightAccomandtion(String id) async {



    emit(GetInsightAccomandtionLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:
        fixInsight == null ?

     "${EndPoint.apiUrl}Accomodation/GetInsights?serviceId=$id" :
     "${EndPoint.apiUrl}Accomodation/GetInsights?serviceId=$id&Month=$fixInsight"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getInsightModel = GetInsightModel.fromJson(responseData);
      emit(GetInsightAccomandtionSuccessful());

    } else {
      print(response.body);
      emit(GetInsightAccomandtionError(response.body));
    }


  }


















  int change = 0 ;

  void toggle(int check) {

    change = check;
    emit(changeBackGround());
  }

  void changeRead(){
    read = !read;
    emit(ChangeReadLoaded());
  }




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
      {required BuildContext context,
        required TextEditingController controller,
        required DateTime firstDate,
        required DateTime lastDate}) async {
    emit(PickDateBlocLoading());
    DateTime? pickDate = await showDatePicker(
      //selectableDayPredicate: ,
        context: context,

        initialDate: DateTime.now(),
        firstDate: firstDate,
        lastDate: lastDate);

    if (pickDate != null) {
      controller.text = pickDate.toString().split(" ")[0];
    }
    emit(PickDateBlocSSuccessfulState());
  }





  void chooseMonthAccomandtion(value) {

    choosesMonthAccomandtion = value;
    emit(ChoosesMonthAccomandtionLoaded());
  }

  void chooseMonthAccomandtionInsight(value) {

    chooseMonthInsight = value;
    emit(ChoosesMonthAccomandtionInsightLoaded());
  }


  void changeStatus(value) {

    status = value;
    emit(ChangeStatusLoaded());
  }

  String? choseHours ;
  void choseHoursFunction(value) {
    emit(StartDate());
    choseHours = value;
    emit(EndStart());
  }

  void changeAccomandtionype(value) {
    emit(StartDate());
    accomandtionType = value;
    emit(EndStart());
  }



  getGovernments() async {
    var response = await http.get(Uri.parse(EndPoint.getGoverMent));
    print(response.body);
    var databody = json.decode(response.body);
    governmentsModel = GovernmentsModel.fromJson(databody);
  }


  void changeCountry( value) {
    goverment = value!;
    emit(ChangeContry());
  }





}
