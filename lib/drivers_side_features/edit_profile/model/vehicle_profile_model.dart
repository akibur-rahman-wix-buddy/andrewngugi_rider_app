class VehicleProfileDataModel {
  bool? status;
  String? message;
  num? code;
  VehicleProfileData? data;

  VehicleProfileDataModel({this.status, this.message, this.code, this.data});

  VehicleProfileDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? new VehicleProfileData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class VehicleProfileData {
  num? id;
  num? vehicleId;
  String? model;
  String? color;
  String? regNumber;
  num? manufactureYear;
  double? payloadCapacity;
  String? carRegNumber;
  List<Avatars>? avatars;

  VehicleProfileData(
      {this.id,
        this.vehicleId,
        this.model,
        this.color,
        this.regNumber,
        this.manufactureYear,
        this.payloadCapacity,
        this.carRegNumber,
        this.avatars});

  VehicleProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicleId = json['vehicle_id'];
    model = json['model'];
    color = json['color'];
    regNumber = json['reg_number'];
    manufactureYear = json['manufacture_year'];
    payloadCapacity = json['payload_capacity'];
    carRegNumber = json['car_reg_number'];
    if (json['avatars'] != null) {
      avatars = <Avatars>[];
      json['avatars'].forEach((v) {
        avatars!.add(new Avatars.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vehicle_id'] = this.vehicleId;
    data['model'] = this.model;
    data['color'] = this.color;
    data['reg_number'] = this.regNumber;
    data['manufacture_year'] = this.manufactureYear;
    data['payload_capacity'] = this.payloadCapacity;
    data['car_reg_number'] = this.carRegNumber;
    if (this.avatars != null) {
      data['avatars'] = this.avatars!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Avatars {
  num? id;
  String? avatar;

  Avatars({this.id, this.avatar});

  Avatars.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    return data;
  }
}
