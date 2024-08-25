class GetAllIndivadualBookingModel {
  var statusCode;
  String? message;
  Data? data;

  GetAllIndivadualBookingModel({this.statusCode, this.message, this.data});

  GetAllIndivadualBookingModel.fromJson(Map<String, dynamic> json) {
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
  var count;
  List<Details>? details;

  Data({this.count, this.details});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  String? id;
  String? serviceName;
  var price;
  String? bookingStatus;
  String? paymentStatus;

  Details(
      {this.id,
        this.serviceName,
        this.price,
        this.bookingStatus,
        this.paymentStatus});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceName = json['serviceName'];
    price = json['price'];
    bookingStatus = json['bookingStatus'];
    paymentStatus = json['paymentStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['serviceName'] = this.serviceName;
    data['price'] = this.price;
    data['bookingStatus'] = this.bookingStatus;
    data['paymentStatus'] = this.paymentStatus;
    return data;
  }
}
