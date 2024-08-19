
import 'dart:convert';
import 'dart:io';

import 'package:aser_dash_board/logic/activity_cubit/activity_state.dart';
import 'package:aser_dash_board/model/activity/activitymodel.dart';
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



  void PickDate(context,TextEditingController controller) async {
    emit(PickDateBlocLoading());
    DateTime? pickDate = await showDatePicker(
      //selectableDayPredicate: ,
        context: context,

        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

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
  TextEditingController search = TextEditingController();
  void changeAccomandtionype(value) {
    emit(StartDate());
    accomandtionType = value;
    emit(EndStart());
  }
  String? goverment;
  void changeGovernment(value) {
    emit(StartDate());
    goverment = value;
    emit(EndStart());
  }

  String? status;
  void changeStatus(value) {
    emit(StartDate());
    status = value;
    emit(EndStart());
  }
  int singleRoomNum = 0;

  changeSingleRoomNum({bool isAdded = false}) {
    if (isAdded) {
      singleRoomNum++;
    } else {
      if (singleRoomNum != 0) {
        singleRoomNum--;
      }
    }
    emit(ChangeSingleRoom());
  }


  /// get activity

  Future getAllActivity({required int skip, required int take}) async {

    emit(GetAllActivityLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:
    search.text.trim().isEmpty?
    "${EndPoint.apiUrl}Activities/GetAllActivitiesForAdmin?skip=$skip&take=$take" :

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





}
