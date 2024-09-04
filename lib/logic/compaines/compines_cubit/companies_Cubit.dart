import 'dart:convert';

import 'package:aser_dash_board/logic/compaines/compaines_state/compaines_state.dart';
import 'package:aser_dash_board/model/GovernmentsModel.dart';
import 'package:aser_dash_board/model/company/getAllCompany.dart';
import 'package:aser_dash_board/model/company/getAplicationServicesModel.dart';
import 'package:aser_dash_board/model/company/getCompanydetails.dart';
import 'package:aser_dash_board/model/company/get_company_services.dart';
import 'package:aser_dash_board/model/company/insightCompany.dart';
import 'package:aser_dash_board/repositories/api/api%20consumer/apiConsumer.dart';
import 'package:aser_dash_board/repositories/api/enpoint/enpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;



class CompaniesCubit extends Cubit<CompaniesState> {
  CompaniesCubit() : super(HomeInatialState());

  static CompaniesCubit get(context) => BlocProvider.of(context);

  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController titleNotification = TextEditingController();
  TextEditingController contentNotification = TextEditingController();
  TextEditingController addtionalDate = TextEditingController();
  String? statusConvert;
  String ? companyServices;
  String? government;
  String? profit;
  List <String> typeTrips = ["Company","individual"] ;
  List <String> statusList = [
    "Pending",
    "UpComing",
    "Complete",
    "Cancelled"
  ];
  String? status;
  int change = 0;
  int skip =0;
  int take = 10;
  String? choosesMonth;
  List <String> month = ["January","February","March","April","May","June","July","August","September","October","November","December"];
  GetAllCompanyModel? getAllCompanyModel;
  final storage = new FlutterSecureStorage();
  GetApplicationServicesModel? getApplicationServicesModel;
  String? selectCompanyVar;
  GovernmentsModel? governmentsModel;
  String? convertNumberStatus;
  TextEditingController search = TextEditingController();
  GetCampnyDetailsModel? getCampnyDetailsModel;
  GetCompanyServicesModel ? getCompanyServicesModel;


  void load()async{
    await getCompainesServices();
    await getGovernments();
    await getAllCompany(skip: 0, take: 10);
  }
  void scrollLeft() {



    if(skip == 0){
      print("object");
    }
    else{
      skip = skip - 10 ;
      getAllCompany(skip: skip,take: 10);
      emit(ScrollSusccessfulLeft());
    }




  }

  void scrollRight() {


    if(skip >= getAllCompanyModel!.totalCount!.toInt()){
      print("object");
    }
    else{
      skip = skip + 10 ;
      getAllCompany(skip: skip,take: 10);



      emit(ScrollSusccessfulRigth());
    }







  }

  getGovernments() async {
    var response = await http.get(Uri.parse(EndPoint.getGoverMent));
    print(response.body);
    var databody = json.decode(response.body);
    governmentsModel = GovernmentsModel.fromJson(databody);
    emit(GetGovernMent());
  }

  void changeCountry( value) {
    government = value!;
    emit(ChangeContry());
  }


  getCompainesServices() async {
    var response = await http.get(Uri.parse(EndPoint.getServicesCompany));
    print(response.body);
    var databody = json.decode(response.body);
    getApplicationServicesModel = GetApplicationServicesModel.fromJson(databody);
    emit(GetServices());
  }
  void selectCompany(String ?value){
    selectCompanyVar = value;
    emit(SelectApplicationServicesSuccessful());
  }




  Future getAllCompany({required int skip, required int take}) async {

    emit(GetAllCompanyLoading());

    final token = await storage.read(key: 'token');

    var url ;
    if(search.text.trim().isEmpty  && addtionalDate.text.trim().isEmpty && government == null && selectCompanyVar == null && convertNumberStatus == null ){

      url = "${EndPoint.apiUrl}Companies/GetAllCompanies?skip=$skip&take=$take";
    }
    else if (search.text.trim().isNotEmpty){
      url = "${EndPoint.apiUrl}Companies/GetAllCompanies?searchTerm=${search.text.trim()}&skip=$skip&take=$take";
    }
    else if (addtionalDate.text.trim().isNotEmpty  ){
      url = "${EndPoint.apiUrl}Companies/GetAllCompanies?additionDate=${addtionalDate.text.trim()}&skip=$skip&take=$take";
    }
    else if (government != null){
      url = "${EndPoint.apiUrl}Companies/GetAllCompanies?governateId=$government&skip=$skip&take=$take";
    }
    else if(selectCompanyVar !=null){
      url = "${EndPoint.apiUrl}Companies/GetAllCompanies?serviceTypeId=$selectCompanyVar&skip=$skip&take=$take";
    }
    else{
      url = "${EndPoint.apiUrl}Companies/GetAllCompanies?status=$convertNumberStatus&skip=$skip&take=$take";
    }


    http.Response response = await ApiConsumer().get(uri:
    url

        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getAllCompanyModel = GetAllCompanyModel.fromJson(responseData);
      emit(GetAllCompanySuccessful());

    } else {
      print(response.body);
      emit(GetAllCompanyError(response.body));
    }


  }



  ///
  ///
  void loadOne(String id)async{
    await getCompanyDetails(id);
    await getCompanyDetailsInside(id);
    await getProfitsInsightCompaines(id);
  }

  Future getCompanyDetails(String id) async {

    emit(GetCompanyDetailsLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:

    "${EndPoint.apiUrl}Companies/$id"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getCampnyDetailsModel = GetCampnyDetailsModel.fromJson(responseData);
      emit(GetCompanyDetailsSuccessful());

    } else {
      print(response.body);
      emit(GetCompanyDetailsError(response.body));
    }


  }

  ///

  Future getCompanyDetailsInside(String id) async {

    emit(GetCompanyDetailsInsideLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:

    "${EndPoint.apiUrl}Companies/GetCompanyServices/$id"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getCompanyServicesModel = GetCompanyServicesModel.fromJson(responseData);
      emit(GetCompanyDetailsInsideSuccessful());

    } else {
      print(response.body);
      emit(GetCompanyDetailsInsideError(response.body));
    }


  }

  ///
  void changeStatusCompainesRestrict(String id)async{
    emit(ChangeStatusRejectedLoading());
    var token  =await storage.read(key: 'token');
    http.Response response = await ApiConsumer().put(
        uri:"${EndPoint.apiUrl}Companies/RestrictCompany/$id", rawData: {

          "RestrictedTill" : restricted.text.trim()

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

  ///
  void changeStatusCompainesUnRestrict(String id)async{
    emit(ChangeStatusUnRestrictLoading());
    var token  =await storage.read(key: 'token');
    http.Response response = await ApiConsumer().put(
        uri:"${EndPoint.apiUrl}Companies/UnRestrictCompany/$id", rawData: {

    },token: token);
    var jsonBody = json.decode(response.body);
    if(response.statusCode == 200){
      print(response.body);
      emit(ChangeStatusUnRestrictSuccessful());
    }
    else{
      print(response.body);
      emit(ChangeStatusUnRestrictError( jsonBody['message']));
    }
  }

  ///


  void changeStatusCompainesActive(String id)async{
    emit(ChangeStatusActiveLoading());
    var token  =await storage.read(key: 'token');
    http.Response response = await ApiConsumer().put(
        uri:"${EndPoint.apiUrl}Companies/ActivateCompany/$id", rawData: {

    },token: token);
    var jsonBody = json.decode(response.body);
    if(response.statusCode == 200){
      print(response.body);
      emit(ChangeStatusActiveSuccessful());
    }
    else{
      print(response.body);
      emit(ChangeStatusActiveError( jsonBody['message']));
    }
  }

  ///
  void changeStatusCompainesDelete(String id)async{
    emit(ChangeStatusDeleteLoading());
    var token  =await storage.read(key: 'token');
    http.Response response = await ApiConsumer().put(
        uri:"${EndPoint.apiUrl}Companies/DeleteCompany/$id", rawData: {

    },token: token);
    var jsonBody = json.decode(response.body);
    if(response.statusCode == 200){
      print(response.body);
      emit(ChangeStatusDeleteSuccessful());
    }
    else{
      print(response.body);
      emit(ChangeStatusDeleteError( jsonBody['message']));
    }
  }









  void changeCompanyServices(value){
    companyServices = value;

    emit(ChoseCompanyServices());
  }



  void changeProfits(value) {

    profit = value;
    emit(ChooseProfits());
  }


  void toggle(int check) {
    change = check;
    emit(changeBackGround());
  }


  void changeStatus(value){
    status = value;

    emit(ChangeStatusLoaded());
  }

  void chooseMonthFunction(value) {

    choosesMonth = value;
    emit(EndStartChooseMonth());
  }

  TextEditingController restricted = TextEditingController();


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


  void PickDateChangeRestricted(

      {context, required TextEditingController controller,required DateTime firstDate,required DateTime lastDate}) async {
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
    emit(PickDateChangeStatusSSuccessfulState());
  }
  String? fixInsight;
  GetInsightCompainesModel? getInsightCompainesModel;

  Future getProfitsInsightCompaines(String id) async {

    emit(GetInsightCompainesLoading());

    final token = await storage.read(key: 'token');
    print("tokn is person blog = $token");
    http.Response response = await ApiConsumer().get(uri:
    fixInsight == null ?
    "${EndPoint.apiUrl}Companies/GetCompanyRevenues?CompanyId=$id":
    "${EndPoint.apiUrl}Companies/GetCompanyRevenues?CompanyId=$id&MonthOrYear=Month&Month=$fixInsight"
        , token: token);
    var responseData = await json.decode(response.body);
    if (response.statusCode == 200) {

      getInsightCompainesModel = GetInsightCompainesModel.fromJson(responseData);

      emit(GetInsightCompainesSuccessful());
    } else {
      print(response.body);
      emit(GetInsightCompainesError(response.body));
    }
  }


  void zeroProfit(String id)async{
    emit(ChangeProfitLoading());
    var token  =await storage.read(key: 'token');
    http.Response response = await ApiConsumer().put(
        uri:"${EndPoint.apiUrl}Profits?PartnerId=$id", rawData: {

    },token: token);
    var jsonBody = json.decode(response.body);
    if(response.statusCode == 200){
      print(response.body);
      emit(ChangeProfitSuccessful());
    }
    else{
      print(response.body);
      emit(ChangeProfitError( jsonBody['message']));
    }
  }


  /// send notification

  void sendNotification({required String ownerId})async{
    emit(SendNotificationLoading());
    var token  =await storage.read(key: 'token');
    http.Response response = await ApiConsumer().post(
        uri:"${EndPoint.apiUrl}Notification/send", rawData: {
          "Title" : titleNotification.text.trim(),
          "Body" : contentNotification.text.trim(),
          "UserId" :  ownerId

    },token: token);
    var jsonBody = json.decode(response.body);
    if(response.statusCode == 200){
      print(response.body);
      emit(SendNotificationSuccessful());
    }
    else{
      print(response.body);
      emit(SendNotificationError( jsonBody['message']));
    }
  }



}