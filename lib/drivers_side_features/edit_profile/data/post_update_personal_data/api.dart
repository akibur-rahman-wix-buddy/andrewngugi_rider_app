import 'dart:io';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/networks/dio/dio.dart';
import 'package:andrewngugi_rider_app/networks/endpoints.dart';
import 'package:andrewngugi_rider_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
final class UpdatePersonalProfile {
  static final UpdatePersonalProfile _singleton = UpdatePersonalProfile._internal();

  UpdatePersonalProfile._internal();

  static UpdatePersonalProfile get instance => _singleton;



  Future<Map<String, dynamic>> updateProfileApi({
     dynamic firstName,
     dynamic lastName,
     dynamic phoneNumber,
     dynamic email,
     XFile? avatar,
     dynamic gender,
     dynamic address,
     dynamic nidNumber,
     dynamic dateOfBirth,
     dynamic driveExperience,
     dynamic driverLicenseNumber,

  }) async {
    try {

      // Convert avatar into MultipartFile
      MultipartFile avatarFile = await MultipartFile.fromFile(avatar?.path??"");

      // Create the FormData
      FormData data = FormData.fromMap({
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "nid_number": email,
        "phone_number": phoneNumber,
        "gender": gender,
        "avatar": avatarFile,
        "address": address,
        "date_of_birth": dateOfBirth,
        "driver_license_number": driverLicenseNumber,
        "driver_experience": driveExperience,

      });

      // Make the API call
      Response response = await postHttp(Endpoints.updateProfileUrl(), data);

      if (response.statusCode == 200 ) {
        final responseData = response.data;
        ToastUtil.showShortToast('Profile updated successfully.');
        return responseData;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }

    } catch (error) {
      print("Unexpected error: $error");
      ToastUtil.showShortToast("An unexpected error occurred.");
      rethrow;
    }
  }
}
