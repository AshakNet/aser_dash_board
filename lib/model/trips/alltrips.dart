class GetAllTripsModel {
  int? totalCount;
  int? skip;
  int? take;
  int? statusCode;
  String? message;
  List<Data>? data;

  GetAllTripsModel(
      {this.totalCount,
        this.skip,
        this.take,
        this.statusCode,
        this.message,
        this.data});

  GetAllTripsModel.fromJson(Map<String, dynamic> json) {
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
  String? companyName;
  String? destination;
  String? tripDate;
  int? totalSeats;
  int? totalBalance;
  String? additionDate;
  bool? isActive;

  Data(
      {this.id,
        this.name,
        this.companyName,
        this.destination,
        this.tripDate,
        this.totalSeats,
        this.totalBalance,
        this.additionDate,
        this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    companyName = json['companyName'];
    destination = json['destination'];
    tripDate = json['tripDate'];
    totalSeats = json['totalSeats'];
    totalBalance = json['totalBalance'];
    additionDate = json['additionDate'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['companyName'] = this.companyName;
    data['destination'] = this.destination;
    data['tripDate'] = this.tripDate;
    data['totalSeats'] = this.totalSeats;
    data['totalBalance'] = this.totalBalance;
    data['additionDate'] = this.additionDate;
    data['isActive'] = this.isActive;
    return data;
  }
}
