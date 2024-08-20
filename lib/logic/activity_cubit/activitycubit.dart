
import 'dart:convert';
import 'dart:io';

import 'package:aser_dash_board/logic/activity_cubit/activity_state.dart';
import 'package:aser_dash_board/model/accomandtion/review.dart';
import 'package:aser_dash_board/model/activity/activitymodel.dart';
import 'package:aser_dash_board/model/activity/get_one_activity.dart';
import 'package:aser_dash_board/model/activity/getselectCompany/getSelectCompany.dart';
import 'package:aser_dash_board/repositories/api/api%20consumer/apiConsumer.dart';
import 'package:aser_dash_board/repositories/api/enpoint/enpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;




class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit() : super(HomeInatialState());

  static ActivityCubit get(context) => BlocProvider.of(context);
  final storage = new FlutterSecureStorage();

  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController addtionalDate = TextEditingController();
  GetActivityModel? getActivityModel;
  TextEditingController titleActivity = TextEditingController();
  TextEditingController priceActivity = TextEditingController();
  TextEditingController descriptionActivity = TextEditingController();
  TextEditingController activityStartDate = TextEditingController();
  TextEditingController activityEndDate = TextEditingController();
  TextEditingController search = TextEditingController();
  int change = 0 ;
  int skip = 0;
  int take = 10;
  GetAllCompanyModel? getAllCompanyModel;
  String? choosesMonthActivity;
  List <String> month = ["January","February","March","April","May","June","July","August","September","October","November","December"];
  File? image ;
  List hours = ["22-4-2024","4-8-3695","1-4-4562","2-4-2023",];
  /// choose hours
  String? choseHours ;
  String? accomandtionType;
  String? status;
  String? selectCompanyVar  ;
  GetOneActivity? getOneActivityModel;
  GetReviewModel? getReviewModel;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();



  void choseHoursFunction(value) {
    emit(StartDate());
    choseHours = value;
    emit(EndStart());
  }

  void toggle(int check) {

    change = check;
    emit(changeBackGround());
  }

  void chooseMonthActivity(value) {

    choosesMonthActivity = value;
    emit(ChoosesMonthActivityLoaded());
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
      {context,
      required TextEditingController controller,
      required DateTime firstDate,
      required DateTime lastDate}) async {
    emit(PickDateBlocLoading());
    DateTime? pickDate = await showDatePicker(
      //selectableDayPredicate: ,
        context: context,

        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now());

    if (pickDate != null) {
      controller.text = pickDate.toString().split(" ")[0];
    }
    emit(PickDateBlocSSuccessfulState());
  }



  void changeAccomandtionype(value) {
    emit(StartDate());
    accomandtionType = value;
    emit(EndStart());
  }


  void changeStatus(value) {

    status = value;
    emit(EndStart());
  }



  void load()async{
    await getAllActivity(skip: 0, take: 10);
    await getCompany();
  }
  /// get activity

  Future getAllActivity({required int skip, required int take}) async {

    emit(GetAllActivityLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:
    search.text.trim().isEmpty && addtionalDate.text.trim().isEmpty?
    "${EndPoint.apiUrl}Activities/GetAllActivitiesForAdmin?skip=$skip&take=$take" :

      addtionalDate.text.trim().isNotEmpty ?
      "${EndPoint.apiUrl}Activities/GetAllActivitiesForAdmin?AdditionDate=${addtionalDate.text.trim()}&skip=$skip&take=$take" :

    "${EndPoint.apiUrl}Activities/GetAllActivitiesForAdmin?SearchTerm=${search.text.trim()}&skip=$skip&take=$take"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getActivityModel = GetActivityModel.fromJson(responseData);
      emit(GetAllActivitySuccessful());

    } else {
      print(response.body);
      emit(GetAllActivityError(response.body));
    }


  }

  void scrollLeft() {



    if(skip == 0){
      print("object");
    }
    else{
      skip = skip - 10 ;
      getAllActivity(skip: skip,take: 10);
      emit(ScrollSusccessfulLeft());
    }




  }

  void scrollRight() {


    if(skip >= getActivityModel!.totalCount!.toInt()){
      print("object");
    }
    else{
      skip = skip + 10 ;
      getAllActivity(skip: skip,take: 10);



      emit(ScrollSusccessfulRigth());
    }







  }

  getCompany() async {
    var response = await http.get(Uri.parse(EndPoint.getCompany));
    print(response.body);
    var databody = json.decode(response.body);
    getAllCompanyModel = GetAllCompanyModel.fromJson(databody);
  }

  void selectCompany(String ?value){
    selectCompanyVar = value;
    emit(SelectCompanySuccessful());
  }

  /// add Activity

  void addActivity() async {
    emit(CreateActivityLoading());
    var token =await storage.read(key: "token");
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(EndPoint.addActivity),
    );

    request.headers['Authorization'] = 'Bearer $token';


    request.fields.addAll({
      'Name': titleActivity.text.trim(),
      'Price': priceActivity.text.trim(),
      'Description': descriptionActivity.text,
      'StartDate': activityStartDate.text,
      'EndDate': activityEndDate.text,
      'CompanyId' : selectCompanyVar.toString()
    });


    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath('Image', image!.path));
      var response = await request.send();
      print(response.statusCode);
      var databody = json.decode(await response.stream.bytesToString());
      print(databody);
      if (response.statusCode == 200) {
        emit(CreateActivitySuccessful());
      } else {
        print(databody['message']);
        emit(CreateActivityError(databody['message']));
      }
    } else {
      print("Please pick a logo");
      emit(CreateActivityError('Please pick a logo'));
    }
  }

 ///
  void loadOneActivity(String id)async{
    await getOneActivityMethod(id);
    await getReview(id: id, skip: 0,take: 10);
  }

  Future getOneActivityMethod(String id) async {

    emit(GetOneActivityLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:

    "${EndPoint.apiUrl}Activities/GetActiviteDetailsForAdmin?Id=$id"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getOneActivityModel = GetOneActivity.fromJson(responseData);
      emit(GetOneActivitySuccessful());

    } else {
      print(response.body);
      emit(GetOneActivityError(response.body));
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








}
