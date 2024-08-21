class GetProductDetailsModel {
  int? statusCode;
  String? message;
  Data? data;

  GetProductDetailsModel({this.statusCode, this.message, this.data});

  GetProductDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? companyId;
  String? company;
  String? logo;
  String? companyStatus;
  String? owner;
  String? addressLink;
  String? phone;
  String? website;
  String? productId;
  String? productName;
  String? category;
  int? price;
  int? avilablePieces;
  List<String>? images;

  Data(
      {this.companyId,
        this.company,
        this.logo,
        this.companyStatus,
        this.owner,
        this.addressLink,
        this.phone,
        this.website,
        this.productId,
        this.productName,
        this.category,
        this.price,
        this.avilablePieces,
        this.images});

  Data.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    company = json['company'];
    logo = json['logo'];
    companyStatus = json['companyStatus'];
    owner = json['owner'];
    addressLink = json['addressLink'];
    phone = json['phone'];
    website = json['website'];
    productId = json['productId'];
    productName = json['productName'];
    category = json['category'];
    price = json['price'];
    avilablePieces = json['avilablePieces'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['company'] = this.company;
    data['logo'] = this.logo;
    data['companyStatus'] = this.companyStatus;
    data['owner'] = this.owner;
    data['addressLink'] = this.addressLink;
    data['phone'] = this.phone;
    data['website'] = this.website;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['category'] = this.category;
    data['price'] = this.price;
    data['avilablePieces'] = this.avilablePieces;
    data['images'] = this.images;
    return data;
  }
}
