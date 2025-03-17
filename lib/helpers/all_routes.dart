import 'dart:io';

import 'package:andrewngugi_rider_app/drivers_side_features/auth/presentation/drive_sign_up_form_3.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/presentation/drive_sign_up_from_2.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/presentation/driver_area_sign_up.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/presentation/driver_car_sign_up.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/presentation/driver_sign_in_screen.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/presentation/driver_sign_up_form_1.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/presentation/driver_sign_up_screen.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/presentation/driver_sign_up_varification.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/presentation/password_conformation.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/drive_history/presentation/DriveHistory.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/drive_wallet/presentation/Withdraw_screen.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/driver_home/presentation/driver_home.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/driver_navigation_screen.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/presentation/driver_profile.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/presentation/edit_profile.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/password_conformation/presentation/password.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/tripe_details/presentation/tripe_details.dart';
import 'package:flutter/cupertino.dart';




final class Routes {
  static final Routes _routes = Routes._internal();

  Routes._internal();

  static Routes get instance => _routes;

  // ################## Auth User ##################
  static const String signInUserScreen = '/signInUserScreen';
  static const String signUpUserScreen = '/signUpUserScreen';
  static const String otpVerificationUserScreen = '/otpVerificationUserScreen';

  /*navigation screen*/
  static const String navigationScreen = '/navigationScreen';

  /*profile screen*/
  static const String profileScreen = '/profileScreen';
  static const String editProfileScreen = '/editProfileScreen';

  /*trips details*/
  static const String tripDetailsUser = '/tripDetailsUser';

  /*pick location*/
  static const String pickUpLocation = '/pickUpLocation';
  static const String mapScreen = '/mapScreen';



  /*Account and settings*/
  static const String accountSetting = 'accountSettings /';
  static const String userProfile = 'userProfile/';
  static const String userEditProfile = 'userEditProfile/';
  static const String digitalPay = 'digitalPay/';


/*driver auth part*/

  static const String driverSignIn = "driverSignIn/";
 static const String driverAreaSignUp = "areaSignIP/";
 static const String driverCarSignUp = "driverCarSignUp/";
 static const String driverSignUpForm = "driverSignUpForm/";
 static const String driveSignUpFrom2 = "driveSignUpFrom2/";
 static const String driveSignUpForm3 = "driveSignUpForm3/";
 static const String driverSignUpVerification = "driverSignUpVerification/";
 static const String passwordConformation = "passwordConformation/";
  static const String driverPassword = "DriverPassword/";
  static const String driverSignUp = "driverSignUp/";


/*driver Home part*/

  static const String driveNavigationScreen = "driveNavigationScreen/";
  static const String driverHome = "driverHome/";
  static const String tripeDetails = "tripeDetails/";


/*Widrow part*/
  static const String withdrawScreen = "withdrawScreen/";



  /* account and setting */
  static const String driverProfile = "driverProfile/";
  static const String driverHistory = "driverHistory/";

  /* edit profile*/

  static const String driverEditProfile = "driverEditProfile/";








}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();

  RouteGenerator._internal();

  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {








      case Routes.driverSignUp:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
            widget: const DriverSignUpScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const DriverSignUpScreen());




      case Routes.driverSignIn:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
            widget: const DriverSignInScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const DriverSignInScreen());






      case Routes.driverAreaSignUp:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
            widget: const DriverAreaSignUp(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const DriverAreaSignUp());







      // case Routes.driverAreaSignUp:
      //   final args = settings.arguments as Map;
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //       widget: ScreenTitle(
      //           widget: DriverAreaSignUp(
      //             phoneNumber: args["number"],
      //           )),
      //       settings: settings)
      //       : CupertinoPageRoute(
      //       builder: (context) => DriverAreaSignUp(
      //           phoneNumber: args["number"],
      //       ),
      //   );



      // case Routes.driverCarSignUp:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //       widget: const DriverCarSignUp(), settings: settings)
      //       : CupertinoPageRoute(builder: (context) => const DriverCarSignUp());



      case Routes.driverCarSignUp:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
            widget: ScreenTitle(
                widget: DriverCarSignUp(
                  areaName:args["areaName"] ,
                  number: args["number"],
                )),
            settings: settings)
            : CupertinoPageRoute(
          builder: (context) => DriverCarSignUp(
            number: args["number"],
            areaName: args["areaName"],
          ),
        );







      case Routes.driveSignUpFrom2:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
            widget:  DriveSignUpFrom2(), settings: settings)
            : CupertinoPageRoute(builder: (context) =>  DriveSignUpFrom2());




      //
      // case Routes.driveSignUpFrom2:
      //   final args = settings.arguments as Map;
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //       widget: ScreenTitle(
      //           widget: DriveSignUpFrom2(
      //
      //             email: args ["email"],
      //             address: args["address"],
      //             dateOfBirth: args["dob"],
      //             fullName: args["fullName"],
      //           gender: args["gender"],
      //             nidNumber: args["nidNumber"]
      //             ,)),
      //       settings: settings)
      //       : CupertinoPageRoute(
      //     builder: (context) => DriveSignUpFrom2(
      //         email: args ["email"],
      //         address: args["address"],
      //         dateOfBirth: args["dob"],
      //         fullName: args["fullName"],
      //         gender: args["gender"],
      //         nidNumber: args["nidNumber"]
      //     ),
      //   );
      //





      case Routes.driveSignUpForm3:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
            widget: const DriveSignUpForm3(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const DriveSignUpForm3());





      case Routes.driverSignUpVerification:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
            widget: ScreenTitle(
                widget: DriverSignUpVerification(
                  number: args["number"],
                )),
            settings: settings)
            : CupertinoPageRoute(
          builder: (context) => DriverSignUpVerification(
            number: args["number"],
          ),
        );






    // case Routes.driverSignUpVerification:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //       widget: const DriverSignUpVerification(), settings: settings)
      //       : CupertinoPageRoute(builder: (context) => const DriverSignUpVerification());

      case Routes.passwordConformation:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
            widget: const PasswordConformation(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const PasswordConformation());

      case Routes.driveNavigationScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
            widget: const DriverNavigationScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const DriverNavigationScreen());

      case Routes.driverHome:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
            widget: const DriverHome(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const DriverHome());

      case Routes.tripeDetails:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
            widget: const TripeDetails(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const TripeDetails());

      case Routes.withdrawScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
            widget: const WithdrawScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const WithdrawScreen());

      case Routes.driverProfile:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
            widget: const DriverProfile(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const DriverProfile());

      case Routes.driverHistory:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
            widget: const DriveHistory(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const DriveHistory());

      case Routes.driverEditProfile:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
            widget: const DriverEditProfile(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const DriverEditProfile());

      case Routes.driverPassword:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
            widget: const DriverPassword(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const DriverPassword());


      case Routes.driverSignUpForm:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
            widget: ScreenTitle(
                widget: DriverSignUpForm(
                  vehicleId: args["vehicleId"],
                  area: args ["area"],
                )),
            settings: settings)
            : CupertinoPageRoute(
            builder: (context) => DriverSignUpForm(
              vehicleId: args["vehicleId"],
              area: args ["area"],
            ),
        );

      // case Routes.driverSignUpForm:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //       widget: const DriverSignUpForm(), settings: settings)
      //       : CupertinoPageRoute(builder: (context) => const DriverSignUpForm());




      default:
        return null;
    }
  }
}

//  weenAnimationBuilder(
//   child: Widget,
//   tween: Tween<double>(begin: 0, end: 1),
//   duration: Duration(milliseconds: 1000),
//   curve: Curves.bounceIn,
//   builder: (BuildContext context, double _val, Widget child) {
//     return Opacity(
//       opacity: _val,
//       child: Padding(
//         padding: EdgeInsets.only(top: _val * 50),
//         child: child
//       ),
//     );
//   },
// );

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
              child: child,
            );
          },
        );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}
