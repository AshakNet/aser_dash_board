
import 'dart:convert';
import 'dart:io';

import 'package:aser_dash_board/model/blogType/blogType.dart';
import 'package:aser_dash_board/model/getAllBlogModel/getBlogModel.dart';
import 'package:aser_dash_board/model/get_one_blog_model/get_one_blog_model.dart';
import 'package:aser_dash_board/model/systemProfits/systemProfits.dart';
import 'package:aser_dash_board/repositories/api/api%20consumer/apiConsumer.dart';
import 'package:aser_dash_board/repositories/api/enpoint/enpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInatialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController addtionalDate = TextEditingController();
  final storage = new FlutterSecureStorage();
  ScrollController table = ScrollController();
   int skip = 0;
   int take = 10;

   int x = 20 ;

   bool read = true;
    void changeRead(){
      read = !read;
      emit(ChangeReadLoaded());
    }

  void scrollLeft(double distance) {
    final newOffset = (table.offset - distance).clamp(0.0, table.position.maxScrollExtent);
    table.animateTo(
      newOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );


    getAllBlog(0,10);
    emit(ScrollSusccessfulLeft());
  }

  void scrollRight(double distance) {
    final newOffset = (table.offset + distance).clamp(0.0, table.position.maxScrollExtent);
    table.animateTo(
      newOffset,
      duration: const Duration(milliseconds: 300,),
      curve: Curves.easeOut,
    );

    getAllBlog(10,10);

    emit(ScrollSusccessfulRigth());
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

  List <String> month = ["January","February","March","April","May","June","July","August","September","October","November","December"];

  List <String> year = ["2020","2021","2022","2023","2024"];

  String ? fix;
  String? chooseYears;

  void chooseYearFunction(value) {
    emit(StartDateChooseYears());
    chooseYears = value;
    emit(EndStartChooseYears());
  }

  String? choosesMonth;
  void chooseMonthFunction(value) {
    emit(StartDateChooseMonth());
    choosesMonth = value;
    emit(EndStartChooseMonth());
  }

  void load()async{
    await getSystemProfits();
    await getBlogType();
    await getAllBlog(0,10);
  }

  SystemProfitModel? systemProfit;
  /// get system profits
  Future getSystemProfits() async {

    emit(GetSystemProfitsLoading());

    final token = await storage.read(key: 'token');
    print("tokn is person blog = $token");
    http.Response response = await ApiConsumer().get(uri:
     fix == null ?
     "${EndPoint.apiUrl}Companies/SystemProfits" :
      "${EndPoint.apiUrl}Companies/SystemProfits?MonthOrYear=Month&Month=$fix"
        , token: token);
    var responseData = await json.decode(response.body);
    if (response.statusCode == 200) {
      systemProfit = SystemProfitModel.fromJson(responseData);
      emit(GetSystemProfitsByIdSuccessful());
    } else {
      print(response.body);
      emit(GetSystemProfitsError(response.body));
    }
  }

  /// get blog type
  BlogTypeModel? blogTypeModel;
  Future getBlogType() async {

    emit(GetBlogLoading());

    final token = await storage.read(key: 'token');
    print("tokn is person blog = $token");
    http.Response response = await ApiConsumer().get(uri:

    "${EndPoint.apiUrl}BlogCategories"
        , token: token);
    var responseData = await json.decode(response.body);
    if (response.statusCode == 200) {
      blogTypeModel = BlogTypeModel.fromJson(responseData);

      emit(GetBlogByIdSuccessful());
    } else {
      print(response.body);
      emit(GetBlogError(response.body));
    }
  }

  /// get all category
  GetAllBlogModel? getAllBlogModel;


  ///


  bool isLoadingMore = false;



  ///

  TextEditingController search = TextEditingController();

  Future getAllBlog(int? skip , int? take) async {

    String? id;

    emit(GetAllBlogLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:
        search.text.trim().isEmpty ?
    "${EndPoint.apiUrl}Blogs/GetAllBlogsForAdmin?skip=$skip&take=$take" :
     "${EndPoint.apiUrl}Blogs/GetAllBlogsForAdmin?searchTerm=${search.text.trim()}"


        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getAllBlogModel = GetAllBlogModel.fromJson(responseData);
      emit(GetAllBlogSuccessful());

    } else {
      print(response.body);
      emit(GetAllBlogError(response.body));
    }


  }


  /// get one blog
  GetOneBlogModel? getOneBlogModel;
  Future getOneBlog(String id) async {



    emit(GetOneBlogLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:

    "${EndPoint.apiUrl}Blogs/Admin/GetBlogForAdmin?BlogId=$id"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getOneBlogModel = GetOneBlogModel.fromJson(responseData);
      emit(GetOneBlogSuccessful());

    } else {
      print(response.body);
      emit(GetOneBlogError(response.body));
    }


  }





  /// choose type
  String? chosseTypeBlog;
  void chhoseBlogType(String value) {
    emit(chooseTypeLoading());
    chosseTypeBlog = value;
    emit(chooseTypeLoaded());
  }



  String? choseMonth ;


  String? status ;

  String? statusConvert;

  void changeStatus(value) {

    status = value;
    emit(ChangeStatusLoaded());
  }



  void choseMonthFunction(value) {

    choseMonth = value;
    emit(ChoseMonthLoaded());
  }


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
  String? goverment;
  void changeGovernment(value) {
    emit(StartDate());
    goverment = value;
    emit(EndStart());
  }

  // String? status;
  // void changeStatus(value) {
  //   emit(StartDate());
  //   status = value;
  //   emit(EndStart());
  // }



}
