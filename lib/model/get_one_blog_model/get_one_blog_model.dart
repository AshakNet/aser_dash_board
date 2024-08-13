class GetOneBlogModel {
  int? statusCode;
  String? message;
  Data? data;

  GetOneBlogModel({this.statusCode, this.message, this.data});

  GetOneBlogModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? contant;
  String? author;
  String? status;
  String? startDate;
  String? endDate;
  String? imageName;
  String? category;

  Data(
      {this.id,
        this.title,
        this.contant,
        this.author,
        this.status,
        this.startDate,
        this.endDate,
        this.imageName,
        this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    contant = json['contant'];
    author = json['author'];
    status = json['status'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    imageName = json['imageName'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['contant'] = this.contant;
    data['author'] = this.author;
    data['status'] = this.status;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['imageName'] = this.imageName;
    data['category'] = this.category;
    return data;
  }
}
