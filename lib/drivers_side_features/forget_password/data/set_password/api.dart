
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/networks/dio/dio.dart';
import 'package:andrewngugi_rider_app/networks/endpoints.dart';
import 'package:andrewngugi_rider_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

final class SetForgetPasswordApi {
  static final SetForgetPasswordApi _singleton = SetForgetPasswordApi._internal();

  SetForgetPasswordApi._internal();

  static SetForgetPasswordApi get instance => _singleton;



  Future<Map<String, dynamic>> setForgetPasswordApi({
    required dynamic phoneNumber,
    required dynamic password,
    required dynamic confirmPassword,
  }) async {
    try {
      // Check if avatar file exists


      // Create the FormData
      FormData data = FormData.fromMap({

        "phone_number": phoneNumber,
        "password": password,
        "password_confirmation": confirmPassword,
      });

      // Make the API call
      Response response = await postHttp(Endpoints.postForgetSetPassword(), data);

      if (response.statusCode == 200 ) {
        final responseData = response.data;
        ToastUtil.showShortToast('password updated successfully.');
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
