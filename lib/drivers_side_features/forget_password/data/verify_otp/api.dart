import 'dart:convert';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/networks/dio/dio.dart';
import 'package:andrewngugi_rider_app/networks/endpoints.dart';
import 'package:andrewngugi_rider_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';



final class ForgetVerificationApi {

  static final  ForgetVerificationApi _singleton = ForgetVerificationApi._internal();

  ForgetVerificationApi._internal();

  static  ForgetVerificationApi get instance => _singleton;

  Future<Map<String, dynamic>> forgetCodeCheck({required String phoneNumber, required String otpCode}) async {
    try {

      Map<String, dynamic> data = {
        "phone_number": phoneNumber,
        "code": otpCode,
      };

      Response response = (await postHttp(Endpoints.postForgetOtpVerification(), data));

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        ToastUtil.showShortToast('otp verify success');
        return data;

      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      print("Error during signup: $error");
      rethrow;
    }
  }
}
