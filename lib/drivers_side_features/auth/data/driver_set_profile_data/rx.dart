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

final class SetProfileApiRx extends RxResponseInt<Map<String, dynamic>> {
  final api = SetProfileApi.instance;

  SetProfileApiRx({required super.empty, required super.dataFetcher});

  ValueStream<Map<String, dynamic>> get getFileData => dataFetcher.stream;


Future<bool> setProfileApiInformation({
    required dynamic firstName,
    required dynamic lastName,
    required dynamic email,
    required dynamic phoneNumber,
    required XFile avatar,
    required dynamic gender,

    required dynamic driveAreaZone,
    required dynamic address,
    required dynamic nidNumber,
    required dynamic dateOfBirth,
    required dynamic vehicleId,
    required dynamic model,
    required dynamic color,
    required dynamic regNumber,
    required dynamic manufactureYear,
    required dynamic payloadCapacity,
    required dynamic  carRegNumber,
    required dynamic  driverLicenseNumber,
    required dynamic  driveExperience,
    required List<XFile>  image,
    required dynamic  tearsAndCondition,
    required dynamic password,
    required dynamic confirmPassword,


  }) async {
    try {



      Map data = await api.setProfileApi(
        phoneNumber: phoneNumber,
        email: email,
        firstName: firstName,
        lastName: lastName,
        gender: gender,
        avatar: avatar,

        image: image,
        color: color,
        address: address,
        password: password,
        confirmPassword: confirmPassword,
        carRegNumber: carRegNumber,
        dateOfBirth: dateOfBirth,
        driveAreaZone: driveAreaZone,
        driveExperience: driveExperience,
        driverLicenseNumber: driverLicenseNumber,
        manufactureYear: manufactureYear,
        model: model,
        nidNumber: nidNumber,
        payloadCapacity: payloadCapacity,
        regNumber: regNumber,
        tearsAndCondition: tearsAndCondition,
        vehicleId: vehicleId
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


    if (data != null && data['token'] != null) {
      String token = data['token'];

      print("Token>>>>>>>>>>>>>>>>>>: $token");

      appData.write(kKeyAccessToken, token);
      appData.write(kKeyIsLoggedIn, true);

      DioSingleton.instance.update(token);

    } else {

      print("No token found in response.");
    }


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
    // throw error;
    return false;
  }

}
