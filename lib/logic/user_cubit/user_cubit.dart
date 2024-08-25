
import 'dart:convert';

import 'package:aser_dash_board/logic/user_cubit/user_state.dart';
import 'package:aser_dash_board/model/getpersonalData/getpersonalData.dart';
import 'package:aser_dash_board/model/member/member.dart';
import 'package:aser_dash_board/repositories/api/api%20consumer/apiConsumer.dart';
import 'package:aser_dash_board/repositories/api/enpoint/enpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart'as http;




class UserCubit extends Cubit<UserState> {
  UserCubit() : super(FirstState());

  static UserCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  TextEditingController addFName = TextEditingController();
  TextEditingController addLName = TextEditingController();
  TextEditingController addEmail = TextEditingController();
  TextEditingController addPhone = TextEditingController();
  TextEditingController nationalId = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController search = TextEditingController();
  int skip = 0;
  int take = 10 ;




  final storage = const FlutterSecureStorage();

  GetPersonalDataModel ? getPersonalDataModel;
  GetAllAdminModel? getAllAdminModel;

  void load()async{
    await getPersonalInformation();
    await getAllAdmins(skip: 0, take: 10);
  }

  void scrollLeft() {



    if(skip == 0){
      print("object");
    }
    else{
      skip = skip - 10 ;
      getAllAdmins(skip: skip,take: 10);
      emit(ScrollSusccessfulLeft());
    }




  }

  void scrollRight() {


    if(skip >= getAllAdminModel!.data!.totalCount!.toInt()){
      print("object");
    }
    else{
      skip = skip + 10 ;
      getAllAdmins(skip: skip,take: 10);



      emit(ScrollSusccessfulRigth());
    }







  }


  Future getPersonalInformation() async {

    emit(GetPersonalInformationLoading());

    final token = await storage.read(key: 'token');
    print("tokn is person blog = $token");
    http.Response response = await ApiConsumer().get(uri:

    "${EndPoint.apiUrl}Users/PersonalData"
        , token: token);
    var responseData = await json.decode(response.body);
    if (response.statusCode == 200) {
      getPersonalDataModel = GetPersonalDataModel.fromJson(responseData);

      emit(GetPersonalInformationSuccessful());
    } else {
      print(response.body);
      emit(GetPersonalInformationError(response.body));
    }
  }

  void updateInformation(
      {required String name, required String email, required String phone, required int valG }) async {
    emit(UpdateInformationLoading());
    var token = await storage.read(key: 'token');
    http.Response response = await ApiConsumer().put(
        uri: "${EndPoint.apiUrl}Users/Edit" , rawData: {
      "UserName": name,
      "Email": email,
      "PhoneNumber": phone,
      "Gender": valG.toString()
    }, token: token);
    var jsonBody = json.decode(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      emit(UpdateInformationSuccessful());
    }
    else {
      print(response.body);
      emit(UpdateInformationError( jsonBody['message']));
    }
  }


  Future getAllAdmins({required int skip, required int take}) async {

    emit(GetAllAdminsLoading());

    final token = await storage.read(key: 'token');

    var url ;
    if(search.text.trim().isEmpty){
      url = "${EndPoint.apiUrl}Admins/GetAllAdmins?skip=$skip&take=$take";
    }
    else{
      url = "${EndPoint.apiUrl}Admins/GetAllAdmins?searchTerm=${search.text.trim()}&skip=$skip&take=$take";
    }






    http.Response response = await ApiConsumer().get(uri:
    url

        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getAllAdminModel = GetAllAdminModel.fromJson(responseData);
      emit(GetAllAdminsSuccessful());

    } else {
      print(response.body);
      emit(GetAllAdminsError(response.body));
    }


  }



  void addMember() async {

    String x = "0" ;
    var r = int.parse(x);

    emit(AddMemberLoading());
    var token = await storage.read(key: "token");
    var response = await ApiConsumer().post(uri: "${EndPoint.apiUrl}Admins/register", rawData: {

      'UserName': addFName.text.trim(), 'Email': addEmail.text.trim() ,
      'Password' : password.text.trim(), 'PhoneNumber' : addPhone.text.trim(),
       'NationalId' : nationalId.text.trim(),
      'ConfirmPassword' : confirmPassword.text.trim()
    },token:  token

    );
    var jsonBody = json.decode(response.body);

    print(jsonBody);
    print(response.statusCode);

    if (response.statusCode == 200) {


      emit(AddMemberLoaded());
    } else {
      //print(jsonBody['message']);
      emit(AddMemberError(jsonBody["message"]));
    }
  }





}
