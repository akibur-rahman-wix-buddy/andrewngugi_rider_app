// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../constants/app_constants.dart';
import '../../../../../helpers/di.dart';
import '../../../../../helpers/toast.dart';

import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/rx_base.dart';
import 'api.dart';

final class ForgetOptSentRx extends RxResponseInt<Map<String,dynamic>> {
  final api = ForgetOptSentApi.instance;

  ForgetOptSentRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> forgetNumberSendData(
      {
        required String phoneNumber,

      }
      ) async {
    try {

      Map<String,dynamic> data = await api.forgetOtpSend(
          phoneNumber: phoneNumber
      );
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);

    }
  }

  @override
  handleSuccessWithReturn(Map<String, dynamic> data) {

    dataFetcher.sink.add(data);

    return data;
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if(error is DioException){
      if(error.response!.statusCode == 400 ){
        ToastUtil.showShortToast(error.response!.data["message"]);
      }else{
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    // throw error;
    return false;
  }
}
