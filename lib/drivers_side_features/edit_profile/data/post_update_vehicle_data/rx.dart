import 'dart:developer';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/streams.dart';
import 'api.dart';

final class UpdateVehicleRx extends RxResponseInt<Map<String, dynamic>> {
  final api = UpdateVehicleApi.instance;

  UpdateVehicleRx({required super.empty, required super.dataFetcher});

  ValueStream<Map<String, dynamic>> get getFileData => dataFetcher.stream;

  Future<bool> updateVehicleInfo({
     dynamic vehicleId,
     dynamic model,
     dynamic color,
     dynamic regNumber,
     dynamic manufactureYear,
     dynamic payloadCapacity,
     dynamic carRegNumber,
     List<XFile>? image,
  }) async {
    try {
      Map data = await api.updateVehicleApi(
          image: image,
          color: color,
          carRegNumber: carRegNumber,
          manufactureYear: manufactureYear,
          model: model,
          payloadCapacity: payloadCapacity,
          regNumber: regNumber,
          vehicleId: vehicleId);
      handleSuccessWithReturn(data);

      return true;
    } catch (error, stackTrace) {
      log("Error in setProfileApi: $error", stackTrace: stackTrace);
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
