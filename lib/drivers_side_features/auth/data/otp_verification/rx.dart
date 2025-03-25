import 'dart:developer';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/streams.dart';
import 'api.dart';

final class OtpVerificationApiRx extends RxResponseInt<Map<String, dynamic>> {
  final api = OtpVerificationApi.instance;

  OtpVerificationApiRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> otpCodeVerification({
    required String otpCode,
    required String phoneNumber,
  }) async {
    try {
      Map<String, dynamic> data =
      await api.optCodeCheck(phoneNumber:phoneNumber,otpCode: otpCode );


      await handleSuccessWithReturn(data);

      return true;
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(Map<String, dynamic> data) {
    // // Extract the response data
    // dynamic responseData = data;
    //
    //
    // if (responseData == null || responseData["token"] == null) {
    //
    //   NavigationService.navigateTo(Routes.driverAreaSignUp);
    // } else {
    //   // Token exists, proceed to save it and navigate to the correct screen
    //   String token = responseData['token'];
    //
    //
    //   print("Token>>>>>>>>>>>>>>>>>>: $token");
    //
    //
    //   appData.write(kKeyAccessToken, token);
    //   appData.write(kKeyIsLoggedIn, true);
    //
    //
    //   DioSingleton.instance.update(token);
    //
    //   NavigationService.navigateTo(Routes.navigationScreen);
    // }
    //
    // dataFetcher.sink.add(data);

    return data;
  }




  @override
  handleErrorWithReturn(dynamic error) {

    if (error is DioException) {
      if (error.response!.statusCode == 400) {

        ToastUtil.showShortToast(error.response!.data["error"]);
      } else {
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);

    return false;
  }
}
