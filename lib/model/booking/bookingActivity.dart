class GetAllBookingActivityModel {
  int? statusCode;
  String? message;
  Data? data;

  GetAllBookingActivityModel({this.statusCode, this.message, this.data});

  GetAllBookingActivityModel.fromJson(Map<String, dynamic> json) {
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
  List<Bookings>? bookings;

  Data({this.totalCount, this.bookings});

  Data.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['bookings'] != null) {
      bookings = <Bookings>[];
      json['bookings'].forEach((v) {
        bookings!.add(new Bookings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.bookings != null) {
      data['bookings'] = this.bookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bookings {
  String? id;
  String? name;
  String? email;
  int? price;
  String? bookingDate;
  String? status;

  Bookings(
      {this.id,
        this.name,
        this.email,
        this.price,
        this.bookingDate,
        this.status});

  Bookings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    price = json['price'];
    bookingDate = json['bookingDate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['price'] = this.price;
    data['bookingDate'] = this.bookingDate;
    data['status'] = this.status;
    return data;
  }
}
