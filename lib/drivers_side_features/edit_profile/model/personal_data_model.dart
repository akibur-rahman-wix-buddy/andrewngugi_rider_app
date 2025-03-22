class PersonalProfileDataModel {
  bool? status;
  String? message;
  num? code;
  PersonalData? data;

  PersonalProfileDataModel({this.status, this.message, this.code, this.data});

  PersonalProfileDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ?  PersonalData.fromJson(json['data']) : null;
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

class PersonalData {
  num? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? address;
  String? nidNumber;
  String? gender;
  String? avatar;
  Null dateOfBirth;
  String? driverLicenseNumber;
  String? driverExperience;

  PersonalData(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.address,
      this.nidNumber,
      this.gender,
      this.avatar,
      this.dateOfBirth,
      this.driverLicenseNumber,
      this.driverExperience});

  PersonalData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    nidNumber = json['nid_number'];
    gender = json['gender'];
    avatar = json['avatar'];
    dateOfBirth = json['date_of_birth'];
    driverLicenseNumber = json['driver_license_number'];
    driverExperience = json['driver_experience'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['nid_number'] = this.nidNumber;
    data['gender'] = this.gender;
    data['avatar'] = this.avatar;
    data['date_of_birth'] = this.dateOfBirth;
    data['driver_license_number'] = this.driverLicenseNumber;
    data['driver_experience'] = this.driverExperience;
    return data;
  }
}
