class GetOneAccomandtionModel {
  int? statusCode;
  String? message;
  Data? data;

  GetOneAccomandtionModel({this.statusCode, this.message, this.data});

  GetOneAccomandtionModel.fromJson(Map<String, dynamic> json) {
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
  ServiceDetails? serviceDetails;
  CompanyDetails? companyDetails;

  Data({this.serviceDetails, this.companyDetails});

  Data.fromJson(Map<String, dynamic> json) {
    serviceDetails = json['serviceDetails'] != null
        ? new ServiceDetails.fromJson(json['serviceDetails'])
        : null;
    companyDetails = json['companyDetails'] != null
        ? new CompanyDetails.fromJson(json['companyDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.serviceDetails != null) {
      data['serviceDetails'] = this.serviceDetails!.toJson();
    }
    if (this.companyDetails != null) {
      data['companyDetails'] = this.companyDetails!.toJson();
    }
    return data;
  }
}

class ServiceDetails {
  String? serviceId;
  List<String>? images;
  String? serviceName;
  String? about;
  String? accomodationType;
  List<String>? amenityName;
  List<String>? specialName;
  String? language;
  List<Room>? room;

  ServiceDetails(
      {this.serviceId,
        this.images,
        this.serviceName,
        this.about,
        this.accomodationType,
        this.amenityName,
        this.specialName,
        this.language,
        this.room});

  ServiceDetails.fromJson(Map<String, dynamic> json) {
    serviceId = json['serviceId'];
    images = json['images'].cast<String>();
    serviceName = json['serviceName'];
    about = json['about'];
    accomodationType = json['accomodationType'];
    amenityName = json['amenityName'].cast<String>();
    specialName = json['specialName'].cast<String>();
    language = json['language'];
    if (json['room'] != null) {
      room = <Room>[];
      json['room'].forEach((v) {
        room!.add(new Room.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceId'] = this.serviceId;
    data['images'] = this.images;
    data['serviceName'] = this.serviceName;
    data['about'] = this.about;
    data['accomodationType'] = this.accomodationType;
    data['amenityName'] = this.amenityName;
    data['specialName'] = this.specialName;
    data['language'] = this.language;
    if (this.room != null) {
      data['room'] = this.room!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Room {
  String? roomType;
  var count;
  var price;
  bool? includeBreakFast;
  String? roomImage;
  var guestsNo;

  Room(
      {this.roomType,
        this.count,
        this.price,
        this.includeBreakFast,
        this.roomImage,
        this.guestsNo});

  Room.fromJson(Map<String, dynamic> json) {
    roomType = json['roomType'];
    count = json['count'];
    price = json['price'];
    includeBreakFast = json['includeBreakFast'];
    roomImage = json['roomImage'];
    guestsNo = json['guestsNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomType'] = this.roomType;
    data['count'] = this.count;
    data['price'] = this.price;
    data['includeBreakFast'] = this.includeBreakFast;
    data['roomImage'] = this.roomImage;
    data['guestsNo'] = this.guestsNo;
    return data;
  }
}

class CompanyDetails {
  String? companyId;
  String? image;
  String? title;
  String? owner;
  String? gender;
  String? status;
  String? address;
  String? addressLink;
  String? phone;
  String? website;

  CompanyDetails(
      {this.companyId,
        this.image,
        this.title,
        this.owner,
        this.gender,
        this.status,
        this.address,
        this.addressLink,
        this.phone,
        this.website});

  CompanyDetails.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    image = json['image'];
    title = json['title'];
    owner = json['owner'];
    gender = json['gender'];
    status = json['status'];
    address = json['address'];
    addressLink = json['addressLink'];
    phone = json['phone'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['image'] = this.image;
    data['title'] = this.title;
    data['owner'] = this.owner;
    data['gender'] = this.gender;
    data['status'] = this.status;
    data['address'] = this.address;
    data['addressLink'] = this.addressLink;
    data['phone'] = this.phone;
    data['website'] = this.website;
    return data;
  }
}
