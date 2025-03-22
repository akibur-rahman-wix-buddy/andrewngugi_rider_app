class DriverCarModel {
  bool? status;
  String? message;
  int? code;
  List<DriverCarData>? data;

  DriverCarModel({this.status, this.message, this.code, this.data});

  DriverCarModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    if (json['data'] != null) {
      data = <DriverCarData>[];
      json['data'].forEach((v) {
        data!.add(new DriverCarData.fromJson(v));
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

class DriverCarData {
  int? id;
  String? name;
  String? avatar;

  DriverCarData({this.id, this.name, this.avatar});

  DriverCarData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    return data;
  }
}
