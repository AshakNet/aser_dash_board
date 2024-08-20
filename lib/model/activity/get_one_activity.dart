class GetOneActivity {
  int? statusCode;
  String? message;
  Data? data;

  GetOneActivity({this.statusCode, this.message, this.data});

  GetOneActivity.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? name;
  String? description;
  String? image;
  CompanyDetails? companyDetails;

  Data({this.id, this.name, this.description, this.image, this.companyDetails});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    companyDetails = json['companyDetails'] != null
        ? new CompanyDetails.fromJson(json['companyDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    if (this.companyDetails != null) {
      data['companyDetails'] = this.companyDetails!.toJson();
    }
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
  Null? address;
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
