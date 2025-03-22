
import 'package:andrewngugi_rider_app/drivers_side_features/auth/data/driver_area_data/rx.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/data/driver_car_data/rx.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/data/driver_number_verify/rx.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/data/driver_set_profile_data/rx.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/data/sign_in/rx.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/model/driver_area_model.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/model/driver_car_model.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/driver_account_setting/data/logout/rx.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/data/get_personal_data/rx.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/data/get_vehicle_data/rx.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/data/post_update_personal_data/rx.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/data/post_update_vehicle_data/rx.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/model/personal_data_model.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/model/vehicle_profile_model.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/forget_password/data/send_otp/rx.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/forget_password/data/set_password/rx.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/forget_password/data/verify_otp/rx.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/password_conformation/data/rx.dart';
import 'package:rxdart/rxdart.dart';

import '../drivers_side_features/auth/data/otp_verification/rx.dart';





GetDriverZoneRx getDriverZoneRxObj = GetDriverZoneRx(
    empty: DriverAreaModel(),
    dataFetcher: BehaviorSubject<DriverAreaModel>());

GetDriverCarRx getDriverCarRxObj = GetDriverCarRx(
    empty: DriverCarModel(),
    dataFetcher: BehaviorSubject<DriverCarModel>());

OtpVerificationApiRx otpVerificationApiRxObj = OtpVerificationApiRx(
  empty: <String, dynamic>{},
  dataFetcher: BehaviorSubject<Map<String, dynamic>>(),
);

NumberVerifiedRx numberVerifiedRx = NumberVerifiedRx(
  empty: <String, dynamic>{},
  dataFetcher: BehaviorSubject<Map<String, dynamic>>(),
);

SetProfileApiRx setProfileApiRx = SetProfileApiRx(
  empty: <String, dynamic>{},
  dataFetcher: BehaviorSubject<Map<String, dynamic>>(),
);

PostLogOutRX postLogOutRX = PostLogOutRX(
  empty: <String, dynamic>{},
  dataFetcher: BehaviorSubject<Map<String, dynamic>>(),
);

SignInApiRx signInRxObj = SignInApiRx(
  empty: <String, dynamic>{},
  dataFetcher: BehaviorSubject<Map<String, dynamic>>(),
);

GetPersonalProfileDataRx getPersonalProfileDataRx = GetPersonalProfileDataRx(
    empty: PersonalProfileDataModel(),
    dataFetcher: BehaviorSubject<PersonalProfileDataModel>());

GetVehicleProfileDataRx getVehicleProfileDataRx = GetVehicleProfileDataRx(
    empty: VehicleProfileDataModel(),
    dataFetcher: BehaviorSubject<VehicleProfileDataModel>());

UpdateProfileApiRx updateProfileApiRx = UpdateProfileApiRx(
  empty: <String, dynamic>{},
  dataFetcher: BehaviorSubject<Map<String, dynamic>>(),
);

UpdateVehicleRx updateVehicleRx = UpdateVehicleRx(
  empty: <String, dynamic>{},
  dataFetcher: BehaviorSubject<Map<String, dynamic>>(),
);

SetPasswordRx  setPasswordRx = SetPasswordRx(
  empty: <String, dynamic>{},
  dataFetcher: BehaviorSubject<Map<String, dynamic>>(),
);

ForgetOptSentRx  forgetOptSentRx = ForgetOptSentRx(
  empty: <String, dynamic>{},
  dataFetcher: BehaviorSubject<Map<String, dynamic>>(),
);

ForgetOtpVerificationRx  forgetOtpVerificationRx = ForgetOtpVerificationRx(
  empty: <String, dynamic>{},
  dataFetcher: BehaviorSubject<Map<String, dynamic>>(),
);

SetForgetPasswordRx  setForgetPasswordRx = SetForgetPasswordRx(
  empty: <String, dynamic>{},
  dataFetcher: BehaviorSubject<Map<String, dynamic>>(),
);