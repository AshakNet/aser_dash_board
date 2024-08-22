class GetOrderDetails {
  int? statusCode;
  String? message;
  Data? data;

  GetOrderDetails({this.statusCode, this.message, this.data});

  GetOrderDetails.fromJson(Map<String, dynamic> json) {
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
  String? orderId;
  String? bookingId;
  String? type;
  int? noOfPieces;
  int? price;
  String? deliveryAddress;
  String? payment;
  String? status;
  List<Products>? products;
  String? deliveryDate;
  String? deliveryTime;
  String? ownerName;
  String? gender;
  String? email;
  String? phoneNo;

  Data(
      {this.orderId,
        this.bookingId,
        this.type,
        this.noOfPieces,
        this.price,
        this.deliveryAddress,
        this.payment,
        this.status,
        this.products,
        this.deliveryDate,
        this.deliveryTime,
        this.ownerName,
        this.gender,
        this.email,
        this.phoneNo});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    bookingId = json['bookingId'];
    type = json['type'];
    noOfPieces = json['noOfPieces'];
    price = json['price'];
    deliveryAddress = json['deliveryAddress'];
    payment = json['payment'];
    status = json['status'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    deliveryDate = json['deliveryDate'];
    deliveryTime = json['deliveryTime'];
    ownerName = json['ownerName'];
    gender = json['gender'];
    email = json['email'];
    phoneNo = json['phoneNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['bookingId'] = this.bookingId;
    data['type'] = this.type;
    data['noOfPieces'] = this.noOfPieces;
    data['price'] = this.price;
    data['deliveryAddress'] = this.deliveryAddress;
    data['payment'] = this.payment;
    data['status'] = this.status;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['deliveryDate'] = this.deliveryDate;
    data['deliveryTime'] = this.deliveryTime;
    data['ownerName'] = this.ownerName;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['phoneNo'] = this.phoneNo;
    return data;
  }
}

class Products {
  String? product;
  int? amount;

  Products({this.product, this.amount});

  Products.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['amount'] = this.amount;
    return data;
  }
}
