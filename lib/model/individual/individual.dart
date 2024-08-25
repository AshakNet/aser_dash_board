class GetAllIndividulsModel {
  int? statusCode;
  String? message;
  Data? data;

  GetAllIndividulsModel({this.statusCode, this.message, this.data});

  GetAllIndividulsModel.fromJson(Map<String, dynamic> json) {
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
  List<IndividualsData>? individualsData;

  Data({this.totalCount, this.individualsData});

  Data.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['individualsData'] != null) {
      individualsData = <IndividualsData>[];
      json['individualsData'].forEach((v) {
        individualsData!.add(new IndividualsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.individualsData != null) {
      data['individualsData'] =
          this.individualsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IndividualsData {
  String? name;
  String? email;
  String? gender;
  int? transaction;
  String? status;
  int? totalPayment;
  String? additionalDate;
  String? id;

  IndividualsData(
      {this.name,
        this.email,
        this.gender,
        this.transaction,
        this.status,
        this.totalPayment,
        this.additionalDate,
        this.id});

  IndividualsData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    transaction = json['transaction'];
    status = json['status'];
    totalPayment = json['totalPayment'];
    additionalDate = json['additionalDate'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['transaction'] = this.transaction;
    data['status'] = this.status;
    data['totalPayment'] = this.totalPayment;
    data['additionalDate'] = this.additionalDate;
    data['id'] = this.id;
    return data;
  }
}
