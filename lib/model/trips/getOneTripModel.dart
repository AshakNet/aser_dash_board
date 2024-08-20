class GetOneTripsModel {
  int? statusCode;
  String? message;
  Data? data;

  GetOneTripsModel({this.statusCode, this.message, this.data});

  GetOneTripsModel.fromJson(Map<String, dynamic> json) {
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
  String? tripType;
  String? photo;
  String? id;
  String? companyName;
  String? ownerName;
  bool? isActive;
  String? meetingPoint;
  String? destination;
  var duration;
  String? title;
  var groupSize;
  var price;
  bool? isPricePerPerson;
  String? description;
  String? tripRoles;
  String? movementDate;
  String? arrivalDate;

  Data(
      {this.tripType,
        this.photo,
        this.id,
        this.companyName,
        this.ownerName,
        this.isActive,
        this.meetingPoint,
        this.destination,
        this.duration,
        this.title,
        this.groupSize,
        this.price,
        this.isPricePerPerson,
        this.description,
        this.tripRoles,
        this.movementDate,
        this.arrivalDate});

  Data.fromJson(Map<String, dynamic> json) {
    tripType = json['tripType'];
    photo = json['photo'];
    id = json['id'];
    companyName = json['companyName'];
    ownerName = json['ownerName'];
    isActive = json['isActive'];
    meetingPoint = json['meetingPoint'];
    destination = json['destination'];
    duration = json['duration'];
    title = json['title'];
    groupSize = json['groupSize'];
    price = json['price'];
    isPricePerPerson = json['isPricePerPerson'];
    description = json['description'];
    tripRoles = json['tripRoles'];
    movementDate = json['movementDate'];
    arrivalDate = json['arrivalDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tripType'] = this.tripType;
    data['photo'] = this.photo;
    data['id'] = this.id;
    data['companyName'] = this.companyName;
    data['ownerName'] = this.ownerName;
    data['isActive'] = this.isActive;
    data['meetingPoint'] = this.meetingPoint;
    data['destination'] = this.destination;
    data['duration'] = this.duration;
    data['title'] = this.title;
    data['groupSize'] = this.groupSize;
    data['price'] = this.price;
    data['isPricePerPerson'] = this.isPricePerPerson;
    data['description'] = this.description;
    data['tripRoles'] = this.tripRoles;
    data['movementDate'] = this.movementDate;
    data['arrivalDate'] = this.arrivalDate;
    return data;
  }
}
