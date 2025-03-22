import 'dart:developer';
import 'package:andrewngugi_rider_app/constants/app_constants.dart';
import 'package:andrewngugi_rider_app/helpers/di.dart';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/networks/dio/dio.dart';
import 'package:andrewngugi_rider_app/networks/rx_base.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/streams.dart';
import 'api.dart';

final class UpdateProfileApiRx extends RxResponseInt<Map<String, dynamic>> {
  final api = UpdatePersonalProfile.instance;

 UpdateProfileApiRx({required super.empty, required super.dataFetcher});

  ValueStream<Map<String, dynamic>> get getFileData => dataFetcher.stream;


  Future<bool> updateProfileApiInformation({
     dynamic firstName,
     dynamic lastName,
     dynamic phoneNumber,
     dynamic email,
     XFile? avatar,
     dynamic gender,
     dynamic address,
     dynamic nidNumber,
     dynamic dateOfBirth,
     dynamic driveExperience,
     dynamic driverLicenseNumber,

  }) async {
    try {
      Map data = await api.updateProfileApi(
          phoneNumber: phoneNumber,
          email: email,
          firstName: firstName,
          lastName: lastName,
          gender: gender,
          avatar: avatar,
          address: address,
          dateOfBirth: dateOfBirth,
          driveExperience: driveExperience,
          driverLicenseNumber: driverLicenseNumber,
          nidNumber: nidNumber,

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
    // throw error;
    return false;
  }

}
