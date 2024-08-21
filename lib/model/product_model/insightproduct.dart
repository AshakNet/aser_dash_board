class GetProductInsightModel {
  int? statusCode;
  String? message;
  Data? data;

  GetProductInsightModel({this.statusCode, this.message, this.data});

  GetProductInsightModel.fromJson(Map<String, dynamic> json) {
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
  Management? management;
  Revenues? revenues;

  Data({this.management, this.revenues});

  Data.fromJson(Map<String, dynamic> json) {
    management = json['management'] != null
        ? new Management.fromJson(json['management'])
        : null;
    revenues = json['revenues'] != null
        ? new Revenues.fromJson(json['revenues'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.management != null) {
      data['management'] = this.management!.toJson();
    }
    if (this.revenues != null) {
      data['revenues'] = this.revenues!.toJson();
    }
    return data;
  }
}

class Management {
  int? totalPieces;
  int? sold;
  int? available;

  Management({this.totalPieces, this.sold, this.available});

  Management.fromJson(Map<String, dynamic> json) {
    totalPieces = json['totalPieces'];
    sold = json['sold'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPieces'] = this.totalPieces;
    data['sold'] = this.sold;
    data['available'] = this.available;
    return data;
  }
}

class Revenues {
  int? total;
  int? paid;
  int? pending;

  Revenues({this.total, this.paid, this.pending});

  Revenues.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    paid = json['paid'];
    pending = json['pending'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['paid'] = this.paid;
    data['pending'] = this.pending;
    return data;
  }
}
