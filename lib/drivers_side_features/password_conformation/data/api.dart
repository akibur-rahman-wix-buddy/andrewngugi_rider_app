import 'dart:io';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/networks/dio/dio.dart';
import 'package:andrewngugi_rider_app/networks/endpoints.dart';
import 'package:andrewngugi_rider_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
final class SetPasswordApi {
  static final SetPasswordApi _singleton = SetPasswordApi._internal();

  SetPasswordApi._internal();

  static SetPasswordApi get instance => _singleton;



  Future<Map<String, dynamic>> setPasswordApi({
   required dynamic currentPassword,
   required dynamic newPassword,
   required dynamic confirmPassword,

  }) async {
    try {


      // Create the FormData
      FormData data = FormData.fromMap({
        "current_password": currentPassword,
        "password": newPassword,
        "password_confirmation": confirmPassword,


      });

      // Make the API call
      Response response = await postHttp(Endpoints.setPasswordUrl(), data);

      if (response.statusCode == 200) {
        final responseData = response.data;
        ToastUtil.showShortToast('Vehicle updated successfully.');
        return responseData;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }

    } catch (error) {
      print("Unexpected error: $error");
      // ToastUtil.showShortToast("An unexpected error occurred.");
      rethrow;
    }
  }
}
