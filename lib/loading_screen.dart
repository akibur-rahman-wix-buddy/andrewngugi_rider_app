import 'package:andrewngugi_rider_app/drivers_side_features/driver_navigation_screen.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';

import 'constants/app_constants.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';
import 'helpers/post_login.dart';
import 'networks/dio/dio.dart';
import 'welcome_screen.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;
  bool isFirstTime = false;

  @override
  void initState() {
    loadInitialData();

    super.initState();
  }

  loadInitialData() async {
    //AutoAppUpdateUtil.instance.checkAppUpdate();
    await setInitValue();

    if (appData.read(kKeyIsLoggedIn)) {
      String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);
      performPostLoginActions();
    } else {
      //  NotificationService().cancelAllNotifications();
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const WelcomeScreen();
    } else {
      // return const OnboardingScreen();
      return appData.read(kKeyIsLoggedIn)
          ?const DriverNavigationScreen()
          : appData.read(kKeyfirstTime)
          ? const OnboardingScreen()
          : const DriverNavigationScreen();
    }
    /* return TimeAppointmentScreen();

              ? HomeScreen()
              : HomeScreen();
    }
    */
  }
}
