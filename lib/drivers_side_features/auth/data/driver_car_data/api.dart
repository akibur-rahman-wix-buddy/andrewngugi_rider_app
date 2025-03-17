import 'package:andrewngugi_rider_app/drivers_side_features/auth/model/driver_car_model.dart';
import 'package:andrewngugi_rider_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '../../../../../../networks/dio/dio.dart';

final class GetDriverCarApi {
  static final GetDriverCarApi _singleton =
  GetDriverCarApi._internal();
  GetDriverCarApi._internal();

  static GetDriverCarApi get instance => _singleton;

  Future<DriverCarModel> getDriverCarData() async {
    try {
      Response response = await getHttp(Endpoints.driverCarType());
      if (response.statusCode == 200) {
        final data = DriverCarModel.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
