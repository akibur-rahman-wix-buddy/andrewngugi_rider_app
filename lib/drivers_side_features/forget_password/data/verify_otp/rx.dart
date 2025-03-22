import 'dart:developer';
import 'package:andrewngugi_rider_app/constants/app_constants.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/di.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/networks/dio/dio.dart';
import 'package:andrewngugi_rider_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/streams.dart';
import 'api.dart';

final class ForgetOtpVerificationRx extends RxResponseInt<Map<String, dynamic>> {
  final api = ForgetVerificationApi.instance;

  ForgetOtpVerificationRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> otpCodeVerification({
    required String otpCode,
    required String phoneNumber,
  }) async {
    try {
      Map<String, dynamic> data =
      await api.forgetCodeCheck(phoneNumber:phoneNumber,otpCode: otpCode );


      await handleSuccessWithReturn(data);

      return true;
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(Map<String, dynamic> data) {
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
