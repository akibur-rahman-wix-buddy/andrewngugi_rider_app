import 'dart:developer';
import 'package:andrewngugi_rider_app/constants/app_constants.dart';
import 'package:andrewngugi_rider_app/helpers/di.dart';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/networks/dio/dio.dart';
import 'package:andrewngugi_rider_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/streams.dart';
import 'api.dart';

final class SignInApiRx extends RxResponseInt<Map<String, dynamic>> {
  final api = SignInApi.instance;

  SignInApiRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> signIn({
    required String phone,
    required dynamic password,
  }) async {
    try {
      // Call the sign-in API
      Map<String, dynamic> data =
      await api.signInApi(phone: phone, password: password);

      String token = data['token'];
      log(">>>>>>>>>>>>>>> login token is : $token");
      await handleSuccessWithReturn(data);

      return true;
    } catch (error) {
      // Handle error
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(Map<String, dynamic> data) {
    // Extract the token from the response
    String token = data['token'];

    // Save the token and login status using appData
    appData.write(kKeyAccessToken, token); // Storing the token
    appData.write(kKeyIsLoggedIn, true); // Setting the logged-in status

    // Update DioSingleton with the new token
    DioSingleton.instance.update(token);

    // Add the data to the stream
    dataFetcher.sink.add(data);

    return data;
  }

  @override
  handleErrorWithReturn(dynamic error) {
    // Handle API error using DioException
    if (error is DioException) {
      if (error.response != null) {
        if (error.response!.statusCode == 400) {
          // Show error message from the response
          ToastUtil.showShortToast(error.response!.data["error"]);
        } else {
          // Show general message for other status codes
          ToastUtil.showShortToast(error.response!.data["message"]);
        }
      } else {
        // Handle case when response is null
        ToastUtil.showShortToast("No response data available");
      }
    }

    // Log the error and add it to the stream
    log(error.toString());
    dataFetcher.sink.addError(error);

    return false;
  }

}
