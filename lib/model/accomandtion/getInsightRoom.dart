class GetInsightModel {
  int? statusCode;
  String? message;
  Data? data;

  GetInsightModel({this.statusCode, this.message, this.data});

  GetInsightModel.fromJson(Map<String, dynamic> json) {
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
  BookingStatus? bookingStatus;
  RoomAvailability? roomAvailability;
  List<RoomTypeAvailability>? roomTypeAvailability;

  Data({this.bookingStatus, this.roomAvailability, this.roomTypeAvailability});

  Data.fromJson(Map<String, dynamic> json) {
    bookingStatus = json['bookingStatus'] != null
        ? new BookingStatus.fromJson(json['bookingStatus'])
        : null;
    roomAvailability = json['roomAvailability'] != null
        ? new RoomAvailability.fromJson(json['roomAvailability'])
        : null;
    if (json['roomTypeAvailability'] != null) {
      roomTypeAvailability = <RoomTypeAvailability>[];
      json['roomTypeAvailability'].forEach((v) {
        roomTypeAvailability!.add(new RoomTypeAvailability.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bookingStatus != null) {
      data['bookingStatus'] = this.bookingStatus!.toJson();
    }
    if (this.roomAvailability != null) {
      data['roomAvailability'] = this.roomAvailability!.toJson();
    }
    if (this.roomTypeAvailability != null) {
      data['roomTypeAvailability'] =
          this.roomTypeAvailability!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookingStatus {
  int? completed;
  int? pending;
  int? upComming;
  int? cancelled;
  int? total;

  BookingStatus(
      {this.completed,
        this.pending,
        this.upComming,
        this.cancelled,
        this.total});

  BookingStatus.fromJson(Map<String, dynamic> json) {
    completed = json['completed'];
    pending = json['pending'];
    upComming = json['upComming'];
    cancelled = json['cancelled'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['completed'] = this.completed;
    data['pending'] = this.pending;
    data['upComming'] = this.upComming;
    data['cancelled'] = this.cancelled;
    data['total'] = this.total;
    return data;
  }
}

class RoomAvailability {
  int? totalRooms;
  int? availableRooms;
  int? occupiedRooms;

  RoomAvailability({this.totalRooms, this.availableRooms, this.occupiedRooms});

  RoomAvailability.fromJson(Map<String, dynamic> json) {
    totalRooms = json['totalRooms'];
    availableRooms = json['availableRooms'];
    occupiedRooms = json['occupiedRooms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalRooms'] = this.totalRooms;
    data['availableRooms'] = this.availableRooms;
    data['occupiedRooms'] = this.occupiedRooms;
    return data;
  }
}

class RoomTypeAvailability {
  String? roomType;
  int? totalRooms;
  int? occupiedRooms;
  int? availableRooms;
  bool? isAvailable;

  RoomTypeAvailability(
      {this.roomType,
        this.totalRooms,
        this.occupiedRooms,
        this.availableRooms,
        this.isAvailable});

  RoomTypeAvailability.fromJson(Map<String, dynamic> json) {
    roomType = json['roomType'];
    totalRooms = json['totalRooms'];
    occupiedRooms = json['occupiedRooms'];
    availableRooms = json['availableRooms'];
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomType'] = this.roomType;
    data['totalRooms'] = this.totalRooms;
    data['occupiedRooms'] = this.occupiedRooms;
    data['availableRooms'] = this.availableRooms;
    data['isAvailable'] = this.isAvailable;
    return data;
  }
}
