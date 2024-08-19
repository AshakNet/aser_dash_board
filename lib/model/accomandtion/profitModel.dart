class GetProfitModelAccomandtion {
  int? statusCode;
  String? message;
  Data? data;

  GetProfitModelAccomandtion({this.statusCode, this.message, this.data});

  GetProfitModelAccomandtion.fromJson(Map<String, dynamic> json) {
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
  int? total;
  int? hotel;
  int? camp;
  int? appartment;
  int? company;

  Data({this.total, this.hotel, this.camp, this.appartment, this.company});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    hotel = json['hotel'];
    camp = json['camp'];
    appartment = json['appartment'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['hotel'] = this.hotel;
    data['camp'] = this.camp;
    data['appartment'] = this.appartment;
    data['company'] = this.company;
    return data;
  }
}
