import 'package:andrewngugi_rider_app/drivers_side_features/auth/presentation/password_conformation.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'constants/custome_theme.dart';

import 'drivers_side_features/auth/presentation/drive_sign_up_from_2.dart';
import 'drivers_side_features/auth/presentation/driver_sign_in_screen.dart';
import 'drivers_side_features/auth/presentation/driver_sign_up_screen.dart';
import 'drivers_side_features/driver_account_setting/presentation/driver_account_setting.dart';

import 'drivers_side_features/forget_password/presentation/send_otp.dart';
import 'gen/colors.gen.dart';
import 'helpers/all_routes.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';
import 'helpers/navigation_service.dart';
import 'loading_screen.dart';
import 'networks/dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  //await _requestPermissions();
  await GetStorage.init();
  diSetup();

  // initiInternetChecker();
  DioSingleton.instance.create();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    rotation();
    setInitValue();
    return AnimateIfVisibleWrapper(
      showItemInterval: const Duration(milliseconds: 150),
      child: PopScope(
        canPop: false,
        // ignore: deprecated_member_use
        onPopInvoked: (bool didPop) async {
          showMaterialDialog(context);
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return const UtillScreenMobile();
          },
        ),
      ),
    );
  }
}

class UtillScreenMobile extends StatelessWidget {
  const UtillScreenMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (bool didPop, dynamic d) async {
            showMaterialDialog(context);
          },
          child: GetMaterialApp(

            // showPerformanceOverlay: true,
            theme: ThemeData(
              unselectedWidgetColor: Colors.white,
              primarySwatch: CustomTheme.kToDark,
              useMaterial3: false,
              scaffoldBackgroundColor: AppColors.cFFFFFF,
              appBarTheme:
                  const AppBarTheme(color: AppColors.cFFFFFF, elevation: 0),
            ),
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              return MediaQuery(data: MediaQuery.of(context), child: widget!);
            },
            navigatorKey: NavigationService.navigatorKey,
            onGenerateRoute: RouteGenerator.generateRoute,
            home: Loading()
          ),
        );
      },
    );
  }
}
