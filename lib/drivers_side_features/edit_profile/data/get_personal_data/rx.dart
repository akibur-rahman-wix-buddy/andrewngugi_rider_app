import 'dart:developer';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/model/personal_data_model.dart';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import 'api.dart';

final class GetPersonalProfileDataRx
    extends RxResponseInt<PersonalProfileDataModel> {
  final api = GetPersonalProfileDataApi.instance;

  GetPersonalProfileDataRx(
      {required super.empty, required super.dataFetcher});

  ValueStream get getAvailableItemsStream => dataFetcher.stream;

  Future<PersonalProfileDataModel?> getPersonalInformation() async {
    try {
      PersonalProfileDataModel data = await api.getPersonalInfo();
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
