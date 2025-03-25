import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/common_widgets/pass_text_field.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/controller/AppController.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:andrewngugi_rider_app/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PasswordConformation extends StatefulWidget {
  const PasswordConformation({super.key});

  @override
  State<PasswordConformation> createState() => _PasswordConformationState();
}

class _PasswordConformationState extends State<PasswordConformation> {
  @override
  Widget build(BuildContext context) {
    AppController controller = Get.put(AppController());
    final _formKey = GlobalKey<FormState>();

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
                      Center(
                          child: Image.asset(
                        AppImages.appLogo,
                        height: 60.h,
                        width: 100.w,
                      )),
                      UIHelper.verticalSpace(56.h),
                      Text(
                        "Set Your password",
                        style: TextFontStyle.headLine20PoppinsW600,
                      ),
                      UIHelper.verticalSpace(16.h),
                      Center(
                        child: Column(
                          children: [
                            Image.asset(
                              AppImages.appLogo,
                              height: 60.h,
                              width: 100.w,
                            ),
                            UIHelper.verticalSpace(56.h),
                            Text(
                              "Set Your Password",
                              style: TextFontStyle.headLine20PoppinsW600,
                            ),
                            UIHelper.verticalSpace(16.h),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  PassTextField(
                                    controller: controller.passwordController,
                                    hintText: 'Enter Your Password',
                                    isSufixIcon: true,
                                    isObsecure: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Password cannot be empty';
                                      } else if (value.length < 6) {
                                        return 'Password must be at least 6 characters';
                                      } else if (!RegExp(r'^(?=.*[A-Z])')
                                          .hasMatch(value)) {
                                        return 'Password must contain at least one uppercase letter';
                                      } else if (!RegExp(r'^(?=.*[a-z])')
                                          .hasMatch(value)) {
                                        return 'Password must contain at least one lowercase letter';
                                      } else if (!RegExp(r'^(?=.*\d)')
                                          .hasMatch(value)) {
                                        return 'Password must contain at least one number';
                                      } else if (!RegExp(r'^(?=.*[!@#\$%^&*])')
                                          .hasMatch(value)) {
                                        return 'Password must contain at least one special character';
                                      }
                                      return null;
                                    },
                                  ),
                                  UIHelper.verticalSpace(10.h),
                                  PassTextField(
                                    controller:
                                        controller.confirmPasswordController,
                                    hintText: 'Enter Your confirm Password',
                                    isSufixIcon: true,
                                    isObsecure: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Password cannot be empty';
                                      } else if (value.length < 6) {
                                        return 'Password must be at least 6 characters';
                                      } else if (!RegExp(r'^(?=.*[A-Z])')
                                          .hasMatch(value)) {
                                        return 'Password must contain at least one uppercase letter';
                                      } else if (!RegExp(r'^(?=.*[a-z])')
                                          .hasMatch(value)) {
                                        return 'Password must contain at least one lowercase letter';
                                      } else if (!RegExp(r'^(?=.*\d)')
                                          .hasMatch(value)) {
                                        return 'Password must contain at least one number';
                                      } else if (!RegExp(r'^(?=.*[!@#\$%^&*])')
                                          .hasMatch(value)) {
                                        return 'Password must contain at least one special character';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            UIHelper.verticalSpace(24.h),
                          ],
                        ),
                      ),
                      UIHelper.verticalSpace(80.h),




                      customButton(
                          name: "Sign In",
                          onCallBack: () async {

                            List<XFile> imageList = controller.listOfImage
                                .whereType<XFile>() // Ensure that we're only mapping non-null XFile objects
                                .toList();

                            try {

                              bool success =
                                  await setProfileApiRx.setProfileApiInformation(

                                    firstName: controller.firstNameController.text,

                                    lastName:controller.lastNameController.text,
                                    email: controller.emailController.text,
                                    address: controller.addressController.text,
                                    nidNumber: controller.nidController.text,
                                    gender: controller.selectedGender,
                                    dateOfBirth: controller.dateOfBirthController.text.toString(),
                                    avatar: XFile(controller.avatar!.path),
                                    image: imageList,
                                    vehicleId: controller.vehicleTypeController.value,
                                    model: controller.modelController.text,
                                    color: controller.colorController.value,
                                    regNumber:controller.registrationController.text,
                                    manufactureYear: controller.manufacturerYearController.value,
                                    payloadCapacity: controller.payloadCapacityController.value,
                                    carRegNumber:controller.carRegiNumber,
                                    driverLicenseNumber: controller.drivingLicence.text,
                                    driveExperience: controller.drivingExperienceController.value,
                                    tearsAndCondition: controller.termsAndCondition,
                                    driveAreaZone: controller.areaController.text,
                                    password: controller.passwordController.text,
                                    confirmPassword:
                                    controller.confirmPasswordController.text,
                                    phoneNumber: controller.verifyPhoneNumber.text

                              );

                              if (success) {
                                Get.defaultDialog(
                                  radius: 25,
                                  content: SizedBox(
                                    height: 300.h,
                                    child: Column(
                                      children: [
                                        Image.asset(AppImages.loginSuccess),
                                        UIHelper.verticalSpace(15.h),
                                        Divider(
                                            height: 2.h, color: Colors.black),
                                        UIHelper.verticalSpace(10.h),
                                        GestureDetector(
                                          onTap: () {
                                            NavigationService
                                                .navigateToReplacement(Routes
                                                    .driverSignIn);
                                          },
                                          child: Text(
                                            "Continue",
                                            style: TextFontStyle
                                                .textStyle16PoppinsW500
                                                .copyWith(
                                                    color:
                                                        AppColor.buttonColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            } catch (e) {
                              // Handle the error if the API call fails or any error occurs
                              print(
                                  "Error during API call: $e"); // Log the error
                              ToastUtil.showLongToast(
                                  "An error occurred. Please try again.");
                            }

                            if (controller.passwordController.text !=
                                controller.confirmPasswordController.text) {
                              ToastUtil.showLongToast(
                                  "Password does not match");
                            }
                          },
                          color: AppColor.buttonColor,
                          borderColor: Colors.transparent,
                          context: context
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }
}
