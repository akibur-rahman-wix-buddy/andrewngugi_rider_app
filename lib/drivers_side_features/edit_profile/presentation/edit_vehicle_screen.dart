import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/widget/custom_userProfile_text_field.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/widget/driver_sign_updrop_down.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/widget/edit_vehicle_imge_picker.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class EditVehicleScreen extends StatefulWidget {
  const EditVehicleScreen({super.key});

  @override
  State<EditVehicleScreen> createState() => _EditVehicleScreenState();
}

class _EditVehicleScreenState extends State<EditVehicleScreen> {
  final vehicleTypeController = DropdownButtonController();
  final colorController = DropdownButtonController();
  final manufacturerYearController = DropdownButtonController();
  final payloadCapacityController = DropdownButtonController();
  TextEditingController modelController = TextEditingController();
  TextEditingController registrationController = TextEditingController();
  TextEditingController carRegiNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
                child: Column(
                  children: [
                   Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UIHelper.verticalSpace(16.h),

                          ///>>>>>>>>>>>>>>>>>>>> profile image >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                          const EditVehicleImagePicker(),
                          UIHelper.verticalSpace(16.h),

                          ///>>>>>>>>>>>>>>>>>>>> Vehicle Type >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                          DropdownButtonExample(
                            controller: vehicleTypeController,
                            title: 'Vehicle Type*',
                            list: const ["Option 1", "Option 2", "Option 3"],
                          ),
                          UIHelper.verticalSpace(16.h),

                          ///>>>>>>>>>>>>>>>>>>>> Model type >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                          CustomUserprofileTextField(
                            controller: modelController,
                            wight: double.infinity,
                            title: "Model*",
                            hintText: "Enter your vehicle model",
                          ),
                          UIHelper.verticalSpace(16.h),

                          ///>>>>>>>>>>>>>>>>>>>> color  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

                          DropdownButtonExample(
                            controller: colorController,
                            title: 'color*',
                            list: const ["Option 1", "Option 2", "Option 3"],
                          ),
                          UIHelper.verticalSpace(16.h),

                          ///>>>>>>>>>>>>>>>>>>>> registration number  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

                          CustomUserprofileTextField(
                            controller: registrationController,
                            wight: double.infinity,
                            title: "Registration Number",
                            hintText: "Enter your registration number",
                          ),
                          UIHelper.verticalSpace(16.h),

                          ///>>>>>>>>>>>>>>>>>>>> manufacture year >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                          DropdownButtonExample(
                            controller: manufacturerYearController,
                            title: 'Manufacturer Year*',
                            list: const ["Option 1", "Option 2", "Option 3"],
                          ),
                          UIHelper.verticalSpace(16.h),

                          ///>>>>>>>>>>>>>>>>>>>>  Payload Capacity >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                          DropdownButtonExample(
                            controller: payloadCapacityController,
                            title: 'Payload Capacity*',
                            list: const ["Option 1", "Option 2", "Option 3"],
                          ),
                          UIHelper.verticalSpace(16.h),
                          ///>>>>>>>>>>>>>>>>>>>>  Payload Capacity >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                          PinCodeTextField(
                            length: 6, // Length of the PIN code
                            obscureText: false, // Set to true if the PIN should be hidden
                            animationType: AnimationType.fade, // Animation for the PIN fields
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box, // The shape of the PIN fields
                              borderRadius: BorderRadius.circular(12.r), // Rounded corners
                              fieldHeight: 50.h, // Height of each field
                              fieldWidth: 40.w, // Width of each field
                              inactiveFillColor: Colors.white.withOpacity(0.1), // Inactive fields
                              borderWidth: 1.sp, // Border width for fields
                              errorBorderColor: Colors.red, // Border color for errors
                              inactiveColor: Colors.black.withOpacity(0.1), // Border color when inactive
                              selectedColor: Colors.blue.withOpacity(0.1), // Border color when selected
                              selectedBorderWidth: 1, // Border width when selected
                              activeFillColor: Colors.white, // Background color when active
                              activeColor: AppColor.buttonColor, // Border color when active
                              selectedFillColor: AppColor.buttonColor.withOpacity(0.3), // Selected field fill
                            ),
                            animationDuration: const Duration(milliseconds: 300),
                            enableActiveFill: true, // Enable background fill for active fields
                            controller:carRegiNumber, // Connect the controller to track input
                            appContext: context, // Required context for the widget


                          ),
                          ///>>>>>>>>>>>>>>>>>>>>  Button >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                          customButton(
                              name: "Continue",
                              onCallBack: () {

                                NavigationService.navigateTo(Routes.driveSignUpForm3);


                              },
                              borderColor: Colors.transparent,
                              color: AppColor.buttonColor,
                              context: context)
                        ],
                      ),
                  ],
                ))),
      ),
    );
  }
}


