
import 'dart:convert';
import 'dart:io';

import 'package:aser_dash_board/logic/productCubit/product_state.dart';
import 'package:aser_dash_board/model/accomandtion/review.dart';
import 'package:aser_dash_board/model/activity/getselectCompany/getSelectCompany.dart';
import 'package:aser_dash_board/model/product_model/getAllCategoryModel.dart';
import 'package:aser_dash_board/model/product_model/getAllProducts.dart';
import 'package:aser_dash_board/model/product_model/getproductDetails.dart';
import 'package:aser_dash_board/model/product_model/insightproduct.dart';
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
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productStore = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  GetAllCompanyModel? getAllCompanyModel;
  String? selectCompanyVar  ;
  String? categoryType;
  GetAllCategoryProduct? getAllCategoryProduct;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int skip = 0;
  int take = 10;
  int change = 0 ;
  GetProductDetailsModel? getProductDetailsModel;
  List<XFile>? imageFileList = [];
  GetReviewModel? getReviewModel;
  GetProductInsightModel ? getProductInsightModel;




  getCompany() async {
    var response = await http.get(Uri.parse(EndPoint.getCompanyProduct));
    print(response.body);
    var databody = json.decode(response.body);
    getAllCompanyModel = GetAllCompanyModel.fromJson(databody);
  }
  void selectCompany(String ?value){
    selectCompanyVar = value;
    emit(SelectCompanySuccessful());
  }

   getCategoryOfProduct() async {
    emit(GetCategoryProductLoading());
    final token = await storage.read(key: 'token');
    print("tokn is person product = $token");
    http.Response response =
    await ApiConsumer().get(uri: EndPoint.getCategory, token: token);
    var responseData = await json.decode(response.body);
    if (response.statusCode == 200) {
      getAllCategoryProduct = GetAllCategoryProduct.fromJson(responseData);

      emit(GetCategoryProductSuccessful());
    } else {
      print(response.body);
      emit(GetCategoryProductError( response.body));
    }
  }
  void selectCategory(String ?value){
    categoryType = value;
    emit(SelectCategorySuccessful());
  }



  void chooseMonthProduct(value) {

    choosesMonthProduct = value;
    emit(ChoosesMonthProductLoaded());
  }

  void load()async{
    await getProfitsProduct();
    await getAllProduct(skip: 0, take: 10);

    await getCompany();
    await getCategoryOfProduct();
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




  Future<List<String>> uploadImage() async {
    var request = http.MultipartRequest('POST', Uri.parse(EndPoint.uploadImage));

    // Adding all images to the request
    for (var image in imageFileList!) {
      request.files.add(await http.MultipartFile.fromPath('Images', image.path));
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();

      // Print the raw response for debugging
      print('Response body: $responseBody');

      try {
        var decodedResponse = json.decode(responseBody);

        // Print the type and content of the decoded response
        print('Decoded response type: ${decodedResponse.runtimeType}');
        print('Decoded response: $decodedResponse');

        if (decodedResponse is List) {
          // Convert dynamic list items to String
          List<String> imageUrls = List<String>.from(decodedResponse);
          return imageUrls;
        } else {
          throw Exception('Expected a list but got: $decodedResponse');
        }
      } catch (e) {
        throw Exception('Failed to parse response: $e');
      }
    } else {
      throw Exception('Failed to upload images. Status code: ${response.statusCode}');
    }
  }





  addServiceImages(List<XFile> selectedImages) async {

    imageFileList!.addAll(selectedImages);
    print(imageFileList);
    emit(AddServiceImagesChanged());
  }

void loadOne(String id)async{
    await getProductDetails(id);
    await getReview(id: id, skip: 0, take: 10);
    await getProductInsight(id);
}
  addServiceImagesDesign(BuildContext context) async {
    final ImagePicker imagePicker = ImagePicker();
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
       addServiceImages(selectedImages);
    }

    print(imageFileList);
    emit(AddServiceImagesChanged());
  }

  // addServiceImages(List<XFile> selectedImages) async {
  //
  //   imageFileList!.addAll(selectedImages);
  //   print(imageFileList);
  //   emit(AddServiceImagesChanged());
  // }

  // addServiceImagesFromCamera(
  //     BuildContext context,
  //     ) async {
  //   final ImagePicker imagePicker = ImagePicker();
  //   final List<XFile> selectedImages = await picker.pickMultiImage();
  //   if (selectedImages != null) {
  //     imageFileList?.addAll(selectedImages);
  //     addServiceImages(selectedImages);
  //   }
  //   print(imageFileList);
  //   emit(AddServiceImagesChanged());
  // }
  //
  //
  //
  // final ImagePicker picker = ImagePicker();
  //
  //
  //
  // Future<void> pickImages() async {
  //   final List<XFile> selectedImages = await picker.pickMultiImage();
  //
  //   if (selectedImages.isNotEmpty) {
  //
  //     imageFileList?.addAll(selectedImages as Iterable<XFile>);
  //
  //       emit(ImageSuccess());
  //
  //   }
  //
  // }

  Future<void> addProduct() async {
    var token =await storage.read(key: "token");
    emit(AddProductLoading());

    const String url = '${EndPoint.apiUrl}Product/AddProduct'; // Replace with your actual API endpoint



    // Prepare product data including images
    final Map<String, dynamic> productData = {
      "productName": productName.text.trim(),
      "quentity": singleRoomNum.toString(),
      "price": productPrice.text.trim(),
      "categoryId": categoryType.toString(),
      "description": productDescription.text.trim(),
      "store": productStore.text.trim(),
      "partenerId": selectCompanyVar.toString(),
      "images": await uploadImage() // Attach the base64 encoded images
    };


      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'

        },
        body: json.encode(productData),
      );
       var responseData = await json.decode(response.body);

      if (response.statusCode == 200) {
        emit(AddProductSuccess());
        print(imageFileList?[0]);

      } else {
        print(response.body);

        emit(AddProductFailure(responseData['message']));
      }

  }

  void scrollLeft() {



    if(skip == 0){
      print("object");
    }
    else{
      skip = skip - 10 ;
      getAllProduct(skip: skip,take: 10);
      emit(ScrollSusccessfulLeft());
    }




  }

  void scrollRight() {


    if(skip >= getAllProductsModel!.totalCount!.toInt()){
      print("object");
    }
    else{
      skip = skip + 10 ;
      getAllProduct(skip: skip,take: 10);



      emit(ScrollSusccessfulRigth());
    }







  }

  Future getProductDetails(String id) async {

    emit(GetProductDetailsLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:

    "${EndPoint.apiUrl}Product/GetProductDetailsForAdmin?ProductId=$id"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getProductDetailsModel = GetProductDetailsModel.fromJson(responseData);
      emit(GetProductDetailsSuccessful());

    } else {
      print(response.body);
      emit(GetProductDetailsError(response.body));
    }


  }


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

  Future getProductInsight(String id) async {

    emit(GetProductInsightLoading());

    final token = await storage.read(key: 'token');

    http.Response response = await ApiConsumer().get(uri:

    "${EndPoint.apiUrl}Product/GetProductInsightsForAdmin?id=$id"
        , token: token);
    var responseData = await json.decode(response.body);

    if (response.statusCode == 200) {
      getProductInsightModel = GetProductInsightModel.fromJson(responseData);
      emit(GetProductInsightSuccessful());

    } else {
      print(response.body);
      emit(GetProductInsightError(response.body));
    }


  }





  void toggle(int check) {

    change = check;
    emit(changeBackGround());
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
