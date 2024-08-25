class GetCompanyInduvidul {
  int? statusCode;
  String? message;
  Data? data;

  GetCompanyInduvidul({this.statusCode, this.message, this.data});

  GetCompanyInduvidul.fromJson(Map<String, dynamic> json) {
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
  int? individualCount;
  int? companyCount;
  int? total;

  Data({this.individualCount, this.companyCount, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    individualCount = json['individualCount'];
    companyCount = json['companyCount'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['individualCount'] = this.individualCount;
    data['companyCount'] = this.companyCount;
    data['total'] = this.total;
    return data;
  }
}
