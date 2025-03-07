import 'package:andrewngugi_rider_app/drivers_side_features/auth/model/driver_area_model.dart';
import 'package:andrewngugi_rider_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '../../../../../../networks/dio/dio.dart';

final class GetDriverAreaApi {
  static final GetDriverAreaApi _singleton =
      GetDriverAreaApi._internal();
  GetDriverAreaApi._internal();

  static GetDriverAreaApi get instance => _singleton;

  Future<DriverAreaModel> getDriverAreaZone() async {
    try {
      Response response = await getHttp(Endpoints.driverAreaZone());
      if (response.statusCode == 200) {
        final data = DriverAreaModel.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
