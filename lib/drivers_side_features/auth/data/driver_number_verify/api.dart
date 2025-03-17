import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../../../../helpers/toast.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../../../networks/exception_handler/data_source.dart';
import '/networks/endpoints.dart';

final class NumberVerifiedApi {
  static final NumberVerifiedApi _singleton = NumberVerifiedApi._internal();
  NumberVerifiedApi._internal();
  static NumberVerifiedApi get instance => _singleton;

  Future<Map<String, dynamic>> numberVerify({
    required String phoneNumber,

  }) async {
    try {
      Map data = {
        "phone_number": phoneNumber,
      };

      Response response = await postHttp(Endpoints.postDriverNumberSentOTP(), data);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        ToastUtil.showLongToast("Sign Up Successfully");
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
