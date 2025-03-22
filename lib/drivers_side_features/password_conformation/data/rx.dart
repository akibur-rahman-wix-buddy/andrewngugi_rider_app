import 'dart:developer';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/streams.dart';
import 'api.dart';

final class SetPasswordRx extends RxResponseInt<Map<String, dynamic>> {
  final api = SetPasswordApi.instance;

  SetPasswordRx({required super.empty, required super.dataFetcher});

  ValueStream<Map<String, dynamic>> get getFileData => dataFetcher.stream;

  Future<bool> setPasswordInfo({
    required dynamic currentPassword,
    required dynamic newPassword,
    required dynamic confirmPassword,
  }) async {
    try {
      Map data = await api.setPasswordApi(
        currentPassword: currentPassword,
          newPassword: newPassword,
          confirmPassword: confirmPassword
      );
      handleSuccessWithReturn(data);

      return true;
    } catch (error, stackTrace) {
      log("Error in setPasswordApi: $error", stackTrace: stackTrace);
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(dynamic data) {
    return data;
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 422) {
        ToastUtil.showShortToast(error.response!.data["message"]);
      } else {
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    // throw error;
    return false;
  }
}
