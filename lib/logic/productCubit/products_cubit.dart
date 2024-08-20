
import 'dart:convert';
import 'dart:io';

import 'package:aser_dash_board/logic/productCubit/product_state.dart';
import 'package:aser_dash_board/model/product_model/getAllProducts.dart';
import 'package:aser_dash_board/model/product_model/profi_model.dart';
import 'package:aser_dash_board/repositories/api/api%20consumer/apiConsumer.dart';
import 'package:aser_dash_board/repositories/api/enpoint/enpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;




class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(HomeInatialState());

  static ProductCubit get(context) => BlocProvider.of(context);
  final storage = new FlutterSecureStorage();


  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController addtionalDate = TextEditingController();
  TextEditingController search = TextEditingController();
  GetProfitProductsModel? getProfitProductsModel;
  String? choosesMonthProduct;
  List <String> month = ["January","February","March","April","May","June","July","August","September","October","November","December"];
  String ? fixProduct;
  GetAllProductsModel? getAllProductsModel;
  void chooseMonthProduct(value) {

    choosesMonthProduct = value;
    emit(ChoosesMonthProductLoaded());
  }

  void load()async{
    await getProfitsProduct();
    await getAllProduct(skip: 0, take: 10);
  }


  /// profit products
  Future getProfitsProduct() async {

    emit(GetProfitsProductLoading());

    final token = await storage.read(key: 'token');
    print("tokn is person blog = $token");
    http.Response response = await ApiConsumer().get(uri:
    fixProduct == null ?
    "${EndPoint.apiUrl}Product/GetProductStatistics" :
    "${EndPoint.apiUrl}Product/GetProductStatistics?Month=$fixProduct"
        , token: token);
    var responseData = await json.decode(response.body);
    if (response.statusCode == 200) {

      getProfitProductsModel = GetProfitProductsModel.fromJson(responseData);

      emit(GetProfitsProductSuccessful());
    } else {
      print(response.body);
      emit(GetProfitsProductError(response.body));
    }
  }


  /// get Products
  Future getAllProduct({required int skip, required int take}) async {

    emit(GetAllProductLoading());

    final token = await storage.read(key: 'token');

    var url ;
    if(search.text.trim().isEmpty  && addtionalDate.text.trim().isEmpty && craft == null ){

      url = "${EndPoint.apiUrl}Product/GetProductDashboard?skip=$skip&take=$take";
    }
    else if (search.text.trim().isNotEmpty){
      url = "${EndPoint.apiUrl}Product/GetProductDashboard?SearchTerm=${search.text.trim()}&skip=$skip&take=$take";
    }
    else if (addtionalDate.text.trim().isNotEmpty  ){
      url = "${EndPoint.apiUrl}Product/GetProductDashboard?AdditionDate=${addtionalDate.text.trim()}&skip=$skip&take=$take";
    }
    else if (craft != null){
      url = "${EndPoint.apiUrl}Product/GetProductDashboard?CraftType=$craft&skip=$skip&take=$take";
    }


    http.Response response = await ApiConsumer().get(uri:
    url

        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getAllProductsModel = GetAllProductsModel.fromJson(responseData);
      emit(GetAllProductSuccessful());

    } else {
      print(response.body);
      emit(GetAllProductError(response.body));
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
  void changeAccomandtionype(value) {
    emit(StartDate());
    accomandtionType = value;
    emit(EndStart());
  }
  String? craft;
  void changeCraft(value) {
    emit(StartDate());
    craft = value;
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




}
