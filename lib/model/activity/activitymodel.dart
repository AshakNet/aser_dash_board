class GetActivityModel {
  GetActivityModel({
    required this.totalCount,
    required this.skip,
    required this.take,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  final int? totalCount;
  final int? skip;
  final int? take;
  final int? statusCode;
  final String? message;
  final Data? data;

  factory GetActivityModel.fromJson(Map<String, dynamic> json){
    return GetActivityModel(
      totalCount: json["totalCount"],
      skip: json["skip"],
      take: json["take"],
      statusCode: json["statusCode"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.companiesCount,
    required this.activities,
  });

  final int? companiesCount;
  final List<Activity> activities;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      companiesCount: json["companiesCount"],
      activities: json["activities"] == null ? [] : List<Activity>.from(json["activities"]!.map((x) => Activity.fromJson(x))),
    );
  }

}

class Activity {
  Activity({
    required this.id,
    required this.name,
    required this.companyName,
    required this.price,
    required this.revenue,
    required this.additionDate,
  });

  final String? id;
  final String? name;
  final String? companyName;
  final int? price;
  final int? revenue;
  final String? additionDate;

  factory Activity.fromJson(Map<String, dynamic> json){
    return Activity(
      id: json["id"],
      name: json["name"],
      companyName: json["companyName"],
      price: json["price"],
      revenue: json["revenue"],
      additionDate: json["additionDate"],
    );
  }

}
