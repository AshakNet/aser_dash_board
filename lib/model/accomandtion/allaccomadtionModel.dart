class GetAllAccomandtionModel {
  int? totalCount;
  int? skip;
  int? take;
  int? statusCode;
  String? message;
  List<Data>? data;

  GetAllAccomandtionModel(
      {this.totalCount,
        this.skip,
        this.take,
        this.statusCode,
        this.message,
        this.data});

  GetAllAccomandtionModel.fromJson(Map<String, dynamic> json) {
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
  String? serviceName;
  String? accomodationType;
  String? company;
  int? price;
  int? revenue;
  int? guests;
  String? additionDate;
  String? status;

  Data(
      {this.id,
        this.serviceName,
        this.accomodationType,
        this.company,
        this.price,
        this.revenue,
        this.guests,
        this.additionDate,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceName = json['serviceName'];
    accomodationType = json['accomodationType'];
    company = json['company'];
    price = json['price'];
    revenue = json['revenue'];
    guests = json['guests'];
    additionDate = json['additionDate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['serviceName'] = this.serviceName;
    data['accomodationType'] = this.accomodationType;
    data['company'] = this.company;
    data['price'] = this.price;
    data['revenue'] = this.revenue;
    data['guests'] = this.guests;
    data['additionDate'] = this.additionDate;
    data['status'] = this.status;
    return data;
  }
}
