class GetBookingDetailsActivityModel {
  int? statusCode;
  String? message;
  Data? data;

  GetBookingDetailsActivityModel({this.statusCode, this.message, this.data});

  GetBookingDetailsActivityModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? type;
  String? companyName;
  String? logo;
  String? title;
  int? noOfPersons;
  int? price;
  String? status;
  String? ownerName;
  String? gender;
  String? email;
  String? phoneNo;
  String? nationalId;
  String? nationalityType;

  Data(
      {this.id,
        this.type,
        this.companyName,
        this.logo,
        this.title,
        this.noOfPersons,
        this.price,
        this.status,
        this.ownerName,
        this.gender,
        this.email,
        this.phoneNo,
        this.nationalId,
        this.nationalityType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    companyName = json['companyName'];
    logo = json['logo'];
    title = json['title'];
    noOfPersons = json['noOfPersons'];
    price = json['price'];
    status = json['status'];
    ownerName = json['ownerName'];
    gender = json['gender'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    nationalId = json['nationalId'];
    nationalityType = json['nationalityType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['companyName'] = this.companyName;
    data['logo'] = this.logo;
    data['title'] = this.title;
    data['noOfPersons'] = this.noOfPersons;
    data['price'] = this.price;
    data['status'] = this.status;
    data['ownerName'] = this.ownerName;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['phoneNo'] = this.phoneNo;
    data['nationalId'] = this.nationalId;
    data['nationalityType'] = this.nationalityType;
    return data;
  }
}
