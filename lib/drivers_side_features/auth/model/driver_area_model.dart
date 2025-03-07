class DriverAreaModel {
  bool? status;
  String? message;
  num? code;
  List<DriverAreaZone>? data;

  DriverAreaModel({this.status, this.message, this.code, this.data});

  DriverAreaModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    if (json['data'] != null) {
      data = <DriverAreaZone>[];
      json['data'].forEach((v) {
        data!.add(new DriverAreaZone.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DriverAreaZone {
  num? id;
  String? name;

  DriverAreaZone({this.id, this.name});

  DriverAreaZone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
