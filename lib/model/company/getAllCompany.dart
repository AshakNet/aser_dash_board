class GetAllCompanyModel {
  int? totalCount;
  int? skip;
  int? take;
  int? statusCode;
  String? message;
  List<Data>? data;

  GetAllCompanyModel(
      {this.totalCount,
        this.skip,
        this.take,
        this.statusCode,
        this.message,
        this.data});

  GetAllCompanyModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? serviceType;
  String? governate;
  int? servicesNo;
  String? serviceId;
  int? profits;
  String? additionalDate;
  String? status;

  Data(
      {this.id,
        this.name,
        this.serviceType,
        this.governate,
        this.servicesNo,
        this.serviceId,
        this.profits,
        this.additionalDate,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    serviceType = json['serviceType'];
    governate = json['governate'];
    servicesNo = json['servicesNo'];
    serviceId = json['serviceId'];
    profits = json['profits'];
    additionalDate = json['additionalDate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['serviceType'] = this.serviceType;
    data['governate'] = this.governate;
    data['servicesNo'] = this.servicesNo;
    data['serviceId'] = this.serviceId;
    data['profits'] = this.profits;
    data['additionalDate'] = this.additionalDate;
    data['status'] = this.status;
    return data;
  }
}
