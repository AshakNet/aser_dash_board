class GetAllBlogModel {
  int? totalCount;
  int? skip;
  int? take;
  int? statusCode;
  String? message;
  List<Data>? data;

  GetAllBlogModel(
      {this.totalCount,
        this.skip,
        this.take,
        this.statusCode,
        this.message,
        this.data});

  GetAllBlogModel.fromJson(Map<String, dynamic> json) {
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
  String? category;
  String? startDate;
  String? endDate;
  String? additionDate;
  String? addedBy;
  String? status;
  String ? title;

  Data(
      {this.id,
        this.category,
        this.startDate,
        this.endDate,
        this.additionDate,
        this.addedBy,
        this.title,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    title = json['title'];
    additionDate = json['additionDate'];
    addedBy = json['addedBy'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['additionDate'] = this.additionDate;
    data['title'] = this.title;
    data['addedBy'] = this.addedBy;
    data['status'] = this.status;
    return data;
  }
}
