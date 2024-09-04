class GetInsightActivityModel {
  int? statusCode;
  String? message;
  Data? data;

  GetInsightActivityModel({this.statusCode, this.message, this.data});

  GetInsightActivityModel.fromJson(Map<String, dynamic> json) {
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
  Bookingstatus? bookingstatus;
  int? price;
  int? duration;
  Revenue? revenue;

  Data({this.bookingstatus, this.price, this.duration, this.revenue});

  Data.fromJson(Map<String, dynamic> json) {
    bookingstatus = json['bookingstatus'] != null
        ? new Bookingstatus.fromJson(json['bookingstatus'])
        : null;
    price = json['price'];
    duration = json['duration'];
    revenue =
    json['revenue'] != null ? new Revenue.fromJson(json['revenue']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bookingstatus != null) {
      data['bookingstatus'] = this.bookingstatus!.toJson();
    }
    data['price'] = this.price;
    data['duration'] = this.duration;
    if (this.revenue != null) {
      data['revenue'] = this.revenue!.toJson();
    }
    return data;
  }
}

class Bookingstatus {
  int? completed;
  int? pending;
  int? upComming;
  int? cancelled;
  int? total;

  Bookingstatus(
      {this.completed,
        this.pending,
        this.upComming,
        this.cancelled,
        this.total});

  Bookingstatus.fromJson(Map<String, dynamic> json) {
    completed = json['completed'];
    pending = json['pending'];
    upComming = json['upComming'];
    cancelled = json['cancelled'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['completed'] = this.completed;
    data['pending'] = this.pending;
    data['upComming'] = this.upComming;
    data['cancelled'] = this.cancelled;
    data['total'] = this.total;
    return data;
  }
}

class Revenue {
  int? paid;
  int? pending;
  int? total;

  Revenue({this.paid, this.pending, this.total});

  Revenue.fromJson(Map<String, dynamic> json) {
    paid = json['paid'];
    pending = json['pending'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paid'] = this.paid;
    data['pending'] = this.pending;
    data['total'] = this.total;
    return data;
  }
}
