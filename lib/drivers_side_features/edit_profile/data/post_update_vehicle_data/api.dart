import 'dart:io';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/networks/dio/dio.dart';
import 'package:andrewngugi_rider_app/networks/endpoints.dart';
import 'package:andrewngugi_rider_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
final class UpdateVehicleApi {
  static final UpdateVehicleApi _singleton = UpdateVehicleApi._internal();

  UpdateVehicleApi._internal();

  static UpdateVehicleApi get instance => _singleton;



  Future<Map<String, dynamic>> updateVehicleApi({
     dynamic vehicleId,
     dynamic model,
     dynamic color,
     dynamic regNumber,
     dynamic manufactureYear,
     dynamic payloadCapacity,
     dynamic carRegNumber,
     List<XFile>? image,

  }) async {
    try {

      List<MultipartFile> imageFiles = [];

      for (var img in image!) {
        if (await File(img.path).exists()) {
          MultipartFile file = await MultipartFile.fromFile(img.path);
          imageFiles.add(file);
        } else {
          print("Skipping non-existent image: ${img.path}");
        }
      }

      // Create the FormData
      FormData data = FormData.fromMap({
        "vehicle_id": vehicleId,
        "model": model,
        "color": color,
        "reg_number": regNumber,
        "manufacture_year": manufactureYear,
        "payload_capacity": payloadCapacity,
        "car_reg_number": carRegNumber,
        "images[]": imageFiles,

      });

      // Make the API call
      Response response = await postHttp(Endpoints.updateVehicleUrl(), data);

      if (response.statusCode == 200) {
        final responseData = response.data;
        ToastUtil.showShortToast('Vehicle updated successfully.');
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
