import 'dart:io';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/networks/dio/dio.dart';
import 'package:andrewngugi_rider_app/networks/endpoints.dart';
import 'package:andrewngugi_rider_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
final class SetProfileApi {
  static final SetProfileApi _singleton = SetProfileApi._internal();

  SetProfileApi._internal();

  static SetProfileApi get instance => _singleton;



  Future<Map<String, dynamic>> setProfileApi({
    required dynamic firstName,
    required dynamic lastName,
    required dynamic email,
    required dynamic phoneNumber,
    required XFile avatar,
    required dynamic gender,
    required dynamic driveAreaZone,
    required dynamic address,
    required dynamic nidNumber,
    required dynamic dateOfBirth,
    required dynamic vehicleId,
    required dynamic model,
    required dynamic color,
    required dynamic regNumber,
    required dynamic manufactureYear,
    required dynamic payloadCapacity,
    required dynamic carRegNumber,
    required dynamic driverLicenseNumber,
    required dynamic driveExperience,
    required List<XFile> image, // List of images
    required dynamic tearsAndCondition,
    required dynamic password,
    required dynamic confirmPassword,
  }) async {
    try {
      // Check if avatar file exists
      if (!await File(avatar.path).exists()) {
        throw Exception("Avatar image file does not exist.");
      }

      // Convert avatar into MultipartFile
      MultipartFile avatarFile = await MultipartFile.fromFile(avatar.path);

      // Convert image list into MultipartFile list
      List<MultipartFile> imageFiles = [];

      for (var img in image) {
        if (await File(img.path).exists()) {
          MultipartFile file = await MultipartFile.fromFile(img.path);
          imageFiles.add(file);
        } else {
          print("Skipping non-existent image: ${img.path}");
        }
      }

      // Create the FormData
      FormData data = FormData.fromMap({
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phoneNumber,
        "gender": gender,
        "avatar": avatarFile,
        "drive_in_zone": driveAreaZone,
        "address": address,
        "nid_number": nidNumber,
        "date_of_birth": dateOfBirth,
        "vehicle_id": vehicleId,
        "model": model,
        "color": color,
        "reg_number": regNumber,
        "manufacture_year": manufactureYear,
        "payload_capacity": payloadCapacity,
        "car_reg_number": carRegNumber,
        "driver_license_number": driverLicenseNumber,
        "driver_experience": driveExperience,
        "images[]": imageFiles,
        "terms_and_condition": tearsAndCondition,
        "password": password,
        "password_confirmation": confirmPassword,
      });

      // Make the API call
      Response response = await postHttp(Endpoints.postDriverSetProfile(), data);

      if (response.statusCode == 200 || response.statusCode == 201) {
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
