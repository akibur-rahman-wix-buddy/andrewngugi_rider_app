import 'dart:developer';

import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/model/driver_area_model.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/controller/AppController.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:andrewngugi_rider_app/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DriverAreaSignUp extends StatefulWidget {
  const DriverAreaSignUp({super.key,});

  @override
  State<DriverAreaSignUp> createState() => _DriverAreaSignUpState();
}

class _DriverAreaSignUpState extends State<DriverAreaSignUp> {

  AppController controller = Get.put(AppController());

  String? _selectedButton;
  List<DriverAreaZone>? driverAreaZone;
  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchDriveZoneData();
  }

  Future<void> _fetchDriveZoneData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      final response = await getDriverZoneRxObj.getAreaInformation();
      setState(() {
        driverAreaZone = response?.data ?? [];
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        driverAreaZone = [];
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _onButtonPressed(String buttonName) {
    setState(() {
      _selectedButton = buttonName;
      controller.areaController.text = _selectedButton ?? ''; // Set the controller text when a button is pressed
    });
  }

  @override
  Widget build(BuildContext context) {
    log("Phone Number: ${controller.verifyPhoneNumber.text}");

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
                    "Select You’ll drive in",
                    style: TextFontStyle.headLine20PoppinsW600,
                  ),
                  UIHelper.verticalSpace(10.h),

                  if (isLoading)
                    Center(
                      child: Lottie.asset(
                        'assets/lottie/loading.json', // Add your Lottie JSON file
                        width: 200,
                        height: 200,
                      ),
                    )
                  else if (errorMessage != null)
                    Text(
                      "Error: $errorMessage",
                      style: TextStyle(color: Colors.red),
                    )
                  else if (driverAreaZone != null && driverAreaZone!.isNotEmpty)
                      ListView.builder(
                        itemCount: driverAreaZone!.length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          final data = driverAreaZone![index];
                          return Column(
                            children: [
                              customButton(
                                textStyle: TextFontStyle.textStyle16PoppinsW600.copyWith(
                                  color: _selectedButton == data.name.toString()
                                      ? AppColor.whiteColor
                                      : AppColor.buttonColor,
                                ),
                                name: data.name.toString(),
                                onCallBack: () {
                                  _onButtonPressed(data.name.toString());
                                  NavigationService.navigateToWithArgs(Routes.driverCarSignUp, {
                                    "number":controller.verifyPhoneNumber.text,
                                    "areaName": _selectedButton.toString()
                                  });
                                  log(">>>>>>>>>>>>>>>>>>> area ${_selectedButton.toString()}");
                                  log(">>>>>>>>>>>>>>>>>>>  area controller ${controller.areaController.text}");
                                },
                                color: _selectedButton == data.name.toString()
                                    ? AppColor.buttonColor
                                    : Colors.white,
                                borderColor: _selectedButton == data.name.toString()
                                    ? AppColor.whiteColor
                                    : Colors.black12,
                                context: context,
                              ),
                              UIHelper.verticalSpace(10.h),
                            ],
                          );
                        },
                      )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
