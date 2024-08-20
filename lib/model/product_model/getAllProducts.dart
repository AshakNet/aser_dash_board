class GetAllProductsModel {
  var totalCount;
  int? skip;
  int? take;
  int? statusCode;
  String? message;
  List<Data>? data;

  GetAllProductsModel(
      {this.totalCount,
        this.skip,
        this.take,
        this.statusCode,
        this.message,
        this.data});

  GetAllProductsModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    skip = json['skip'];
    take = json['take'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['skip'] = this.skip;
    data['take'] = this.take;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? productName;
  String? companyName;
  String? craftType;
  var price;
  var availablePieces;
  String? additionDate;

  Data(
      {this.id,
        this.productName,
        this.companyName,
        this.craftType,
        this.price,
        this.availablePieces,
        this.additionDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    companyName = json['companyName'];
    craftType = json['craftType'];
    price = json['price'];
    availablePieces = json['availablePieces'];
    additionDate = json['additionDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productName'] = this.productName;
    data['companyName'] = this.companyName;
    data['craftType'] = this.craftType;
    data['price'] = this.price;
    data['availablePieces'] = this.availablePieces;
    data['additionDate'] = this.additionDate;
    return data;
  }
}
