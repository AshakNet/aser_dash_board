class GetReviewModel {
  GetReviewModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  final int? statusCode;
  final String? message;
  final Data? data;

  factory GetReviewModel.fromJson(Map<String, dynamic> json){
    return GetReviewModel(
      statusCode: json["statusCode"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.totalRate,
    required this.reviewrsCount,
    required this.recomendPercent,
    required this.usersReviews,
  });

  final int? totalRate;
  final int? reviewrsCount;
  final int? recomendPercent;
  final List<UsersReview> usersReviews;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      totalRate: json["totalRate"],
      reviewrsCount: json["reviewrsCount"],
      recomendPercent: json["recomendPercent"],
      usersReviews: json["usersReviews"] == null ? [] : List<UsersReview>.from(json["usersReviews"]!.map((x) => UsersReview.fromJson(x))),
    );
  }

}

class UsersReview {
  UsersReview({
    required this.id,
    required this.userName,
    required this.gender,
    required this.comment,
    required this.rate,
    required this.date,
    required this.time,
  });

  final String? id;
  final String? userName;
  final String? gender;
  final String? comment;
  final int? rate;
  final String? date;
  final String? time;

  factory UsersReview.fromJson(Map<String, dynamic> json){
    return UsersReview(
      id: json["id"],
      userName: json["userName"],
      gender: json["gender"],
      comment: json["comment"],
      rate: json["rate"],
      date: json["date"],
      time: json["time"],
    );
  }

}
