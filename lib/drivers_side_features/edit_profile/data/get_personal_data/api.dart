import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/model/personal_data_model.dart';
import 'package:andrewngugi_rider_app/networks/exception_handler/data_source.dart';
import 'package:dio/dio.dart';
import '/networks/endpoints.dart';
import '../../../../../../networks/dio/dio.dart';

final class GetPersonalProfileDataApi {
  static final GetPersonalProfileDataApi _singleton = GetPersonalProfileDataApi._internal();
  GetPersonalProfileDataApi._internal();

  static GetPersonalProfileDataApi get instance => _singleton;

  Future<PersonalProfileDataModel> getPersonalInfo() async {
    try {
      Response response = await getHttp(Endpoints.personalProfileApi());
      if (response.statusCode == 200) {
        final data = PersonalProfileDataModel.fromJson(response.data);
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
