import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/widget/driver_sign_updrop_down.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import '../widget/custom_userProfile_text_field.dart';
import '../widget/second_sign_up_image_picker.dart';

class DriveSignUpFrom2 extends StatefulWidget {
  const DriveSignUpFrom2({super.key});

  @override
  State<DriveSignUpFrom2> createState() => _DriveSignUpFrom2State();
}

class _DriveSignUpFrom2State extends State<DriveSignUpFrom2> {
  final vehicleTypeController = DropdownButtonController();
  final colorController = DropdownButtonController();
  final manufacturerYearController = DropdownButtonController();
  final payloadCapacityController = DropdownButtonController();
  TextEditingController modelController = TextEditingController();
  TextEditingController registrationController = TextEditingController();
  TextEditingController carRegiNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.bgImage))),
      child: SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(
              title: "Sign Up", isCenterd: true, leadingIconUnVisible: true),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Step 1 (Completed)
                          const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 21, // Adjust size
                                backgroundImage:
                                    AssetImage(AppImages.rightClick),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4),
                            ],
                          ),
                          // Dashed line between Step 1 and Step 2
                          SizedBox(
                            width: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                8, // Number of dashes
                                (index) => Container(
                                  width: 4, // Width of each dash
                                  height: 1, // Height of each dash
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          // Step 2 (Inactive)
                          const CircleAvatar(
                            radius: 21, // Adjust size
                            backgroundImage: AssetImage(AppImages.rightClick),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                          // Dashed line between Step 2 and Step 3
                          SizedBox(
                            width: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                8, // Number of dashes
                                (index) => Container(
                                  width: 4, // Width of each dash
                                  height: 1, // Height of each dash
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          // Step 3 (Inactive)
                          const CircleAvatar(
                            radius: 20, // Adjust size
                            backgroundColor: Colors.black,
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(16.h),
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.1),
                                  blurRadius: 10.sp,
                                  spreadRadius: .4)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Vehicle Information",
                              style: TextFontStyle.textStyle16PoppinsW600,
                            ),
                            UIHelper.verticalSpace(16.h),

                            ///>>>>>>>>>>>>>>>>>>>> profile image >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                            const SecondSignUpImagePicker(),
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

                            ///>>>>>>>>>>>>>>>>>>>>  Pin code Capacity >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

                            Text("Car Registration Number*",style: TextFontStyle.textStyle14PoppinsW500),
                            UIHelper.verticalSpace(13.h),

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
                      )
                    ],
                  ))),
        ),
      ),
    );
  }
}


