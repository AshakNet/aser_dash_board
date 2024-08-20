class GetProfitProductsModel {
  int? statusCode;
  String? message;
  Data? data;

  GetProfitProductsModel({this.statusCode, this.message, this.data});

  GetProfitProductsModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? totalProduct;
  List<CategoryProducts>? categoryProducts;

  Data({this.totalProduct, this.categoryProducts});

  Data.fromJson(Map<String, dynamic> json) {
    totalProduct = json['totalProduct'];
    if (json['categoryProducts'] != null) {
      categoryProducts = <CategoryProducts>[];
      json['categoryProducts'].forEach((v) {
        categoryProducts!.add(new CategoryProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalProduct'] = this.totalProduct;
    if (this.categoryProducts != null) {
      data['categoryProducts'] =
          this.categoryProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryProducts {
  String? category;
  int? count;

  CategoryProducts({this.category, this.count});

  CategoryProducts.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['count'] = this.count;
    return data;
  }
}
