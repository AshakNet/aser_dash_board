class GetAllAdminModel {
  int? statusCode;
  String? message;
  Data? data;

  GetAllAdminModel({this.statusCode, this.message, this.data});

  GetAllAdminModel.fromJson(Map<String, dynamic> json) {
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
  int? totalCount;
  List<AdminsData>? adminsData;

  Data({this.totalCount, this.adminsData});

  Data.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['adminsData'] != null) {
      adminsData = <AdminsData>[];
      json['adminsData'].forEach((v) {
        adminsData!.add(new AdminsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.adminsData != null) {
      data['adminsData'] = this.adminsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdminsData {
  String? name;
  String? email;
  String? phone;
  String? status;
  String? additionalDate;
  String? id;

  AdminsData(
      {this.name,
        this.email,
        this.phone,
        this.status,
        this.additionalDate,
        this.id});

  AdminsData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    additionalDate = json['additionalDate'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['additionalDate'] = this.additionalDate;
    data['id'] = this.id;
    return data;
  }
}
