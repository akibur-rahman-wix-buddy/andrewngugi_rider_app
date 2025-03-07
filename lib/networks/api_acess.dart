
import 'package:andrewngugi_rider_app/drivers_side_features/auth/data/driver_area_data/rx.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/model/driver_area_model.dart';
import 'package:rxdart/rxdart.dart';





GetDriverZoneRx getDriverZoneRxObj = GetDriverZoneRx(
    empty: DriverAreaModel(),
    dataFetcher: BehaviorSubject<DriverAreaModel>());



// SignUpApiRx signUpApiRxObj = SignUpApiRx(
//   empty: <String, dynamic>{},
//   dataFetcher: BehaviorSubject<Map<String, dynamic>>(),
// );
