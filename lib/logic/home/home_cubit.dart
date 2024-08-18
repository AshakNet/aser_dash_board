
import 'dart:convert';
import 'dart:io';

import 'package:aser_dash_board/model/blog/blogType/blogType.dart';
import 'package:aser_dash_board/model/blog/getAllBlogModel/getBlogModel.dart';
import 'package:aser_dash_board/model/blog/get_one_blog_model/get_one_blog_model.dart';
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

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController startDateAddBlog = TextEditingController();
  TextEditingController endDateAddBlog = TextEditingController();
  TextEditingController editTitle = TextEditingController();
  TextEditingController editContent = TextEditingController();
  TextEditingController editStartData = TextEditingController();
  TextEditingController editEndData = TextEditingController();

  TextEditingController startDate = TextEditingController();

  int lengthList =0;


  TextEditingController endDate = TextEditingController();
  TextEditingController addtionalDate = TextEditingController();
  final storage = new FlutterSecureStorage();
  ScrollController table = ScrollController();
  String? categoryId;
  String? editCategoryId;

  bool isLoadingMore = false;
  TextEditingController search = TextEditingController();
   int skip = 0;
   int take = 10;
   int x = 20 ;
   bool read = true;
  BlogTypeModel? blogTypeModel;
  String? choosesMonth;
  File? image ;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List hours = ["22-4-2024","4-8-3695","1-4-4562","2-4-2023",];

  List <String> month = ["January","February","March","April","May","June","July","August","September","October","November","December"];

  List <String> year = ["2020","2021","2022","2023","2024"];

  String ? fix;
  String? chooseYears;
  SystemProfitModel? systemProfit;
  GetAllBlogModel? getAllBlogModel;
  GetOneBlogModel? getOneBlogModel;
  String? chosseTypeBlog;
  String? choseMonth ;
  String? status ;
  String? statusConvert;
  String? goverment;
  String? accomandtionType;


void calcChangeLength(){
  lengthList = getAllBlogModel!.totalCount!;
  emit(ChangeSussfulLength());
}
    void changeRead(){
      read = !read;
      emit(ChangeReadLoaded());
    }

  void scrollLeft() {



    if(skip == 0){
      print("object");
    }
    else{
      skip = skip - 10 ;
      getAllBlog(skip: skip,take: 10);
      emit(ScrollSusccessfulLeft());
    }




  }




  void scrollRight() {


       if(skip >= getAllBlogModel!.totalCount!.toInt()){
         print("object");
       }
       else{
         skip = skip + 10 ;
         getAllBlog(skip: skip,take: 10);



         emit(ScrollSusccessfulRigth());
       }







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

  Future deleteImage() async {
   image= null;
   emit(DeleteImage());
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



  void chooseYearFunction(value) {
    emit(StartDateChooseYears());
    chooseYears = value;
    emit(EndStartChooseYears());
  }


  void chooseMonthFunction(value) {
    emit(StartDateChooseMonth());
    choosesMonth = value;
    emit(EndStartChooseMonth());
  }




  /// choose type

  String? chooseBlogTypeEdit;
  void chhoseBlogType(String value) {
    emit(chooseTypeLoading());
    chosseTypeBlog = value;
    emit(chooseTypeLoaded());
  }


  void choseBlogTypeEdit(String value) {

    chooseBlogTypeEdit = value;
    emit(chooseTypeLoadedEdit());
  }



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



  void changeAccomandtionype(value) {
    emit(StartDate());
    accomandtionType = value;
    emit(EndStart());
  }

  void changeGovernment(value) {
    emit(StartDate());
    goverment = value;
    emit(EndStart());
  }
  /// end point s


  void load()async{
    await getSystemProfits();
    await getBlogType();
    await getAllBlog(skip: 0,take: 10);
  }


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

  Future getBlogType() async {

    emit(GetBlogLoading());

    final token = await storage.read(key: 'token');
    print("tokn is person blog = $token");
    http.Response response = await ApiConsumer().get(uri:

    "${EndPoint.apiUrl}BlogCategories/Admin/GetAllBlogs"
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

  Future getAllBlog({required int skip, required int take}) async {

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

  /// add blog

  void addBlog() async {
    emit(CreateBlogLoading());
    var token =await storage.read(key: "token");
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(EndPoint.addBlog),
    );

    request.headers['Authorization'] = 'Bearer $token';


    request.fields.addAll({
      'Title': title.text.trim(),
      'Content': content.text.trim(),
      'StartDate': startDateAddBlog.text.trim(),
      'EndDate': endDateAddBlog.text.trim(),
      'CategoryId': categoryId.toString(),
    });


    if (image != null) {
      request.files.add(await http.MultipartFile.fromPath('Image', image!.path));
      var response = await request.send();
      print(response.statusCode);
      var databody = json.decode(await response.stream.bytesToString());
      print(databody);
      if (response.statusCode == 200) {
        emit(CreateBlogSuccessful());
      } else {
        print(databody['message']);
        emit(CreateBlogError(databody['message']));
      }
    } else {
      print("Please pick a logo");
      emit(CreateBlogError('Please pick a logo'));
    }
  }

  void updateBlog({required  editTitle , required  editContent,

    required String id,
    required File image,
    required  editStartData,required  editEndData }) async {
    emit(EditBlogLoading());
    var token =await storage.read(key: "token");
    var request = http.MultipartRequest(
      "PUT",
      Uri.parse(EndPoint.updateBlog + id),
    );

    request.headers['Authorization'] = 'Bearer $token';

    request.fields.addAll({
      'Title': editTitle.text.trim(),
      'Content': editContent.text.trim(),
      'StartDate': editStartData.text.trim(),
      'EndDate': editEndData.text.trim(),
      'CategoryId': editCategoryId.toString(),
    });

    request.files.add(await http.MultipartFile.fromPath('Image', image.path));
    var response = await request.send();
    print(response.statusCode);
    var databody = json.decode(await response.stream.bytesToString());
    print(databody);
    if (response.statusCode == 200) {
      emit(EditBlogSuccessful());
    } else {
      print(databody['message']);
      emit(EditBlogError(databody['message']));
    }
    }


  void changeStatusBlog(String id)async{
    emit(ChangeStatusLoading());
    var token  =await storage.read(key: 'token');
    http.Response response = await ApiConsumer().put(
        uri:EndPoint.changeStatus + id, rawData: {

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







}
