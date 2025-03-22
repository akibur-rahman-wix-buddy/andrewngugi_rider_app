import 'dart:convert';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/networks/dio/dio.dart';
import 'package:andrewngugi_rider_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';

import '/networks/endpoints.dart';

final class ForgetOptSentApi {
  static final ForgetOptSentApi _singleton = ForgetOptSentApi._internal();
  ForgetOptSentApi._internal();
  static ForgetOptSentApi get instance => _singleton;

  Future<Map<String, dynamic>> forgetOtpSend({
    required String phoneNumber,

  }) async {
    try {
      Map data = {
        "phone_number": phoneNumber,
      };

      Response response = await postHttp(Endpoints.postForgetSentOtpUrl(), data);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        ToastUtil.showLongToast("Otp Send Successfully");
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      rethrow;
    }
  }
}
