class GetApplicationServicesModel {
  int? statusCode;
  String? message;
  List<Data>? data;

  GetApplicationServicesModel({this.statusCode, this.message, this.data});

  GetApplicationServicesModel.fromJson(Map<String, dynamic> json) {
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
  String? serviceName;

  Data({this.id, this.serviceName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceName = json['serviceName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['serviceName'] = this.serviceName;
    return data;
  }
}
