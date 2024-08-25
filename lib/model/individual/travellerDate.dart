class GetTravellerDate {
  int? statusCode;
  String? message;
  Data? data;

  GetTravellerDate({this.statusCode, this.message, this.data});

  GetTravellerDate.fromJson(Map<String, dynamic> json) {
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
  String? gender;
  String? userName;
  String? email;
  String? status;

  Data({this.id, this.gender, this.userName, this.email, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gender = json['gender'];
    userName = json['userName'];
    email = json['email'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['gender'] = this.gender;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['status'] = this.status;
    return data;
  }
}
