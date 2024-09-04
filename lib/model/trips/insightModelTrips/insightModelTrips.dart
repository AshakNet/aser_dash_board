class GetInsightTripsModel {
  int? statusCode;
  String? message;
  Data? data;

  GetInsightTripsModel({this.statusCode, this.message, this.data});

  GetInsightTripsModel.fromJson(Map<String, dynamic> json) {
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
  Status? status;
  Seats? seats;
  Revenues? revenues;

  Data({this.status, this.seats, this.revenues});

  Data.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    seats = json['seats'] != null ? new Seats.fromJson(json['seats']) : null;
    revenues = json['revenues'] != null
        ? new Revenues.fromJson(json['revenues'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.seats != null) {
      data['seats'] = this.seats!.toJson();
    }
    if (this.revenues != null) {
      data['revenues'] = this.revenues!.toJson();
    }
    return data;
  }
}

class Status {
  int? total;
  int? pending;
  int? cancelled;
  int? confirmed;
  int? declared;

  Status(
      {this.total,
        this.pending,
        this.cancelled,
        this.confirmed,
        this.declared});

  Status.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pending = json['pending'];
    cancelled = json['cancelled'];
    confirmed = json['confirmed'];
    declared = json['declared'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['pending'] = this.pending;
    data['cancelled'] = this.cancelled;
    data['confirmed'] = this.confirmed;
    data['declared'] = this.declared;
    return data;
  }
}

class Seats {
  int? totalSeats;
  int? soldSeats;
  int? availableSeats;

  Seats({this.totalSeats, this.soldSeats, this.availableSeats});

  Seats.fromJson(Map<String, dynamic> json) {
    totalSeats = json['totalSeats'];
    soldSeats = json['soldSeats'];
    availableSeats = json['availableSeats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalSeats'] = this.totalSeats;
    data['soldSeats'] = this.soldSeats;
    data['availableSeats'] = this.availableSeats;
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
