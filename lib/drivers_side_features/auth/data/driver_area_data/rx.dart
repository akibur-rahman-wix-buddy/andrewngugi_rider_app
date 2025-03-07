import 'dart:developer';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/model/driver_area_model.dart';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import 'api.dart';

final class GetDriverZoneRx
    extends RxResponseInt<DriverAreaModel> {
  final api = GetDriverAreaApi.instance;

  GetDriverZoneRx(
      {required super.empty, required super.dataFetcher});

  ValueStream get getAvailableItemsStream => dataFetcher.stream;

  Future<DriverAreaModel?> getNotificationInformation() async {
    try {
      DriverAreaModel data = await api.getDriverAreaZone();
      log("$data");
      return handleSuccessWithReturn(data);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
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
    // throw error;
    return null;
  }
}
