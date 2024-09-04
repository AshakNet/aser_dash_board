class GetInsightCompainesModel {
  int? statusCode;
  String? message;
  Data? data;

  GetInsightCompainesModel({this.statusCode, this.message, this.data});

  GetInsightCompainesModel.fromJson(Map<String, dynamic> json) {
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
  int? paid;
  int? pending;
  int? total;

  Data({this.paid, this.pending, this.total});

  Data.fromJson(Map<String, dynamic> json) {
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
