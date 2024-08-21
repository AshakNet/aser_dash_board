class GetCampnyDetailsModel {
  int? statusCode;
  String? message;
  Data? data;

  GetCampnyDetailsModel({this.statusCode, this.message, this.data});

  GetCampnyDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? companyName;
  String? logo;
  String? ownerId;
  String? ownerName;
  String? status;
  String? restrictedTill;
  String? ownerGender;
  String? service;
  String? governate;
  String? address;
  String? website;
  String? phone;
  String? email;

  Data(
      {this.companyId,
        this.companyName,
        this.logo,
        this.ownerId,
        this.ownerName,
        this.status,
        this.restrictedTill,
        this.ownerGender,
        this.service,
        this.governate,
        this.address,
        this.website,
        this.phone,
        this.email});

  Data.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    companyName = json['companyName'];
    logo = json['logo'];
    ownerId = json['ownerId'];
    ownerName = json['ownerName'];
    status = json['status'];
    restrictedTill = json['restrictedTill'];
    ownerGender = json['ownerGender'];
    service = json['service'];
    governate = json['governate'];
    address = json['address'];
    website = json['website'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['companyName'] = this.companyName;
    data['logo'] = this.logo;
    data['ownerId'] = this.ownerId;
    data['ownerName'] = this.ownerName;
    data['status'] = this.status;
    data['restrictedTill'] = this.restrictedTill;
    data['ownerGender'] = this.ownerGender;
    data['service'] = this.service;
    data['governate'] = this.governate;
    data['address'] = this.address;
    data['website'] = this.website;
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}
