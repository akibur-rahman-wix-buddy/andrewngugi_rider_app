// ignore_for_file: constant_identifier_names

const String url = "http://dev.andrewngugi.softvencefsd.xyz/api";
const String imageUrl= "http://dev.andrewngugi.softvencefsd.xyz/";

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

final class PaymentGateway {
  PaymentGateway._();
  static String gateway(String orderId) => "";
}

final class Endpoints {
  Endpoints._();
  //backend_url
  static String driverAreaZone() => "/drive-in/zone";
  static String driverCarType() => "/vehicle-type";
  static String postDriverNumberSentOTP() => "/driver/sent/otp";
  static String postForgetSentOtpUrl() => "/sent/otp";
  static String postForgetOtpVerification() => "/verify/otp";
  static String postForgetSetPassword() => "/set/password";
  static String postDriverNumberOTPVerification() => "/driver/verify/otp";
  static String postDriverSetProfile() => "/driver/set/profile";
  static String signInApi() => "/driver/login";
  static String logout() => "/logout";
  static String personalProfileApi() => "/driver/profile";
  static String personalVehicleApi() => "/driver/vehicle/profile";
  static String updateProfileUrl() => "/driver/profile";
  static String updateVehicleUrl() => "/driver/vehicle/profile";
  static String setPasswordUrl() => "/driver/set-new-password";





}
