import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/model/vehicle_profile_model.dart';
import 'package:andrewngugi_rider_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '../../../../../../networks/dio/dio.dart';

final class GetVehicleProfileDataApi {
  static final GetVehicleProfileDataApi _singleton = GetVehicleProfileDataApi._internal();
  GetVehicleProfileDataApi._internal();

  static GetVehicleProfileDataApi get instance => _singleton;

  Future<VehicleProfileDataModel> getVehicleInfo() async {
    try {
      Response response = await getHttp(Endpoints.personalVehicleApi());
      if (response.statusCode == 200) {
        final data = VehicleProfileDataModel.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
