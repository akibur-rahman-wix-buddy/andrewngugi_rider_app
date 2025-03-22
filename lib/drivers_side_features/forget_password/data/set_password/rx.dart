
import 'dart:developer';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/networks/rx_base.dart';
import 'package:dio/dio.dart';

import 'package:rxdart/streams.dart';
import 'api.dart';

final class SetForgetPasswordRx extends RxResponseInt<Map<String, dynamic>> {
  final api = SetForgetPasswordApi.instance;

  SetForgetPasswordRx({required super.empty, required super.dataFetcher});

  ValueStream<Map<String, dynamic>> get getFileData => dataFetcher.stream;


  Future<bool> setForgetPasswordInformation({

    required dynamic phoneNumber,
    required dynamic password,
    required dynamic confirmPassword,


  }) async {
    try {



      Map data = await api.setForgetPasswordApi(
          phoneNumber: phoneNumber,
          password: password,
          confirmPassword: confirmPassword,

      );
      handleSuccessWithReturn(data);

      return true;
    } catch (error, stackTrace) {
      log("Error in setProfileApi: $error", stackTrace: stackTrace);
      return await handleErrorWithReturn(error);
    }
  }


  @override
  handleSuccessWithReturn(dynamic data) {


    if (!dataFetcher.isClosed) {
      dataFetcher.sink.add(data);
    }

    return data;
  }


  @override
  handleErrorWithReturn(dynamic error) {
    if(error is DioException){
      if(error.response!.statusCode == 422 ){
        ToastUtil.showShortToast(error.response!.data["message"]);
      }else{
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    return false;
  }

}
