// import 'dart:developer';
// import 'package:andrewngugi_rider_app/drivers_side_features/auth/widget/test.dart';
// import 'package:andrewngugi_rider_app/drivers_side_features/controller/AppController.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
//
// import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
// import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
// import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
// import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
// import 'package:andrewngugi_rider_app/drivers_side_features/auth/model/driver_car_model.dart';
// import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
// import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
// import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
// import 'package:andrewngugi_rider_app/networks/api_acess.dart';
//
// class DriverCarSignUp extends StatefulWidget {
//   const DriverCarSignUp({super.key, required this.number, required this.areaName});
//
//   final String number;
//   final String areaName;
//
//   @override
//   State<DriverCarSignUp> createState() => _DriverCarSignUpState();
// }
//
// class _DriverCarSignUpState extends State<DriverCarSignUp> {
//
//   AppController controller =Get.put(AppController());
//
//   int? _selectedVehicleId;
//   List<DriverCarData>? driverCarData;
//   bool isLoading = false;
//   String? errorMessage;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchDriveCarData();
//   }
//
//   Future<void> _fetchDriveCarData() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = null;
//     });
//
//     try {
//       final response = await getDriverCarRxObj.getCarInformation();
//       setState(() {
//         driverCarData = response?.data ?? [];
//       });
//     } catch (e) {
//       setState(() {
//         errorMessage = e.toString();
//         driverCarData = [];
//       });
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   void _onButtonPressed(int vehicleId) {
//     setState(() {
//       _selectedVehicleId = vehicleId;
//     });
//
//     log("Selected Vehicle ID: $_selectedVehicleId");
//
//     NavigationService.navigateToWithArgs(Routes.driverSignUpForm, {
//       "area": widget.areaName.toString(),
//       "vehicleId": _selectedVehicleId,
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     log("Phone Number: ${widget.number}");
//     log("Area Name: ${widget.areaName}");
//
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(image: AssetImage(AppImages.bgImage)),
//       ),
//       child: SafeArea(
//         child: Scaffold(
//           appBar: const CustomAppBar(
//             title: "Sign Up",
//             isCenterd: true,
//           ),
//           backgroundColor: Colors.transparent,
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
//               child: Column(
//                 children: [
//                   Center(
//                     child: Image.asset(
//                       AppImages.appLogo,
//                       height: 60.h,
//                       width: 100.w,
//                     ),
//                   ),
//                   UIHelper.verticalSpace(56.h),
//                   Text(
//                     "Select Your Vehicle",
//                     style: TextFontStyle.headLine20PoppinsW600,
//                   ),
//                   UIHelper.verticalSpace(10.h),
//
//                   if (isLoading)
//                     Center(
//                       child: Lottie.asset(
//                         'assets/lottie/loading.json',
//                         height: 150.h,
//                       ),
//                     )
//                   else if (driverCarData == null || driverCarData!.isEmpty)
//                     Center(
//                       child: Column(
//                         children: [
//                           Lottie.asset(
//                             'assets/lottie/no_data.json',
//                             height: 200.h,
//                           ),
//                           Text(
//                             "No Vehicle Data Available",
//                             style: TextFontStyle.textStyle16PoppinsW600,
//                           ),
//                         ],
//                       ),
//                     )
//                   else
//                     ListView.builder(
//                       itemCount: driverCarData!.length,
//                       primary: false,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         final data = driverCarData![index];
//                         final vehicleId = data.id ?? 0;
//                         print("vehicleId>>>>>>>>>>>>>>>>>>>> ${vehicleId}");
//
//                         return Column(
//                           children: [
//                             customRowButton(
//                               image: AppImages.van2,
//                               textStyle: TextFontStyle.textStyle16PoppinsW600.copyWith(
//                                 color: _selectedVehicleId == vehicleId
//                                     ? AppColor.whiteColor
//                                     : AppColor.buttonColor,
//                               ),
//                               name: data.name.toString(),
//                               onCallBack: () {
//                                 _onButtonPressed(vehicleId);
//                                 print("vehicleId>>>>>>>>>>>>>>>>>>>> ${vehicleId}");
//                               },
//                               color: _selectedVehicleId == vehicleId
//                                   ? AppColor.buttonColor
//                                   : Colors.white,
//                               borderColor: _selectedVehicleId == vehicleId
//                                   ? AppColor.whiteColor
//                                   : Colors.black12,
//                               context: context,
//                             ),
//                             UIHelper.verticalSpace(10.h),
//                           ],
//                         );
//                       },
//                     ),
//
//
//                   Container(
//                     height: 56.h,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20.r)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:developer';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/widget/test.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/controller/AppController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/model/driver_car_model.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:andrewngugi_rider_app/networks/api_acess.dart';

class DriverCarSignUp extends StatefulWidget {
  const DriverCarSignUp({super.key, required this.number, required this.areaName});

  final String number;
  final String areaName;

  @override
  State<DriverCarSignUp> createState() => _DriverCarSignUpState();
}

class _DriverCarSignUpState extends State<DriverCarSignUp> {

  AppController controller = Get.put(AppController());

  List<DriverCarData>? driverCarData;
  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchDriveCarData();
  }

  Future<void> _fetchDriveCarData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final response = await getDriverCarRxObj.getCarInformation();
      setState(() {
        driverCarData = response?.data ?? [];
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        driverCarData = [];
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _onButtonPressed(dynamic vehicleId) {
    setState(() {
      controller.vehicleTypeController.value = vehicleId;  // Update the controller with selected vehicle ID
    });

    log("Selected Vehicle ID: ${controller.vehicleTypeController.value.toString()}");

    NavigationService.navigateToWithArgs(Routes.driverSignUpForm, {
      "area": widget.areaName.toString(),
      "vehicleId": controller.vehicleTypeController.value,
    });
  }

  @override
  Widget build(BuildContext context) {
    log("Phone Number: ${widget.number}");
    log("Area Name: ${widget.areaName}");

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImages.bgImage)),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(
            title: "Sign Up",
            isCenterd: true,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      AppImages.appLogo,
                      height: 60.h,
                      width: 100.w,
                    ),
                  ),
                  UIHelper.verticalSpace(56.h),
                  Text(
                    "Select Your Vehicle",
                    style: TextFontStyle.headLine20PoppinsW600,
                  ),
                  UIHelper.verticalSpace(10.h),

                  if (isLoading)
                    Center(
                      child: Lottie.asset(
                        'assets/lottie/loading.json',
                        height: 150.h,
                      ),
                    )
                  else if (driverCarData == null || driverCarData!.isEmpty)
                    Center(
                      child: Column(
                        children: [
                          Lottie.asset(
                            'assets/lottie/no_data.json',
                            height: 200.h,
                          ),
                          Text(
                            "No Vehicle Data Available",
                            style: TextFontStyle.textStyle16PoppinsW600,
                          ),
                        ],
                      ),
                    )
                  else
                    ListView.builder(
                      itemCount: driverCarData!.length,
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final data = driverCarData![index];
                        final vehicleId = data.id ?? 0;
                        print("vehicleId>>>>>>>>>>>>>>>>>>>> ${vehicleId}");

                        return Column(
                          children: [
                            customRowButton(
                              image: AppImages.van2,
                              textStyle: TextFontStyle.textStyle16PoppinsW600.copyWith(
                                color: controller.vehicleTypeController.value == vehicleId
                                    ? AppColor.whiteColor
                                    : AppColor.buttonColor,
                              ),
                              name: data.name.toString(),
                              onCallBack: () {
                                _onButtonPressed(vehicleId);
                                print("vehicleId>>>>>>>>>>>>>>>>>>>> ${vehicleId}");
                              },
                              color: controller.vehicleTypeController.value == vehicleId
                                  ? AppColor.buttonColor
                                  : Colors.white,
                              borderColor: controller.vehicleTypeController.value == vehicleId
                                  ? AppColor.whiteColor
                                  : Colors.black12,
                              context: context,
                            ),
                            UIHelper.verticalSpace(10.h),
                          ],
                        );
                      },
                    ),


                  Container(
                    height: 56.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
