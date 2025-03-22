import 'dart:developer';
import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/common_widgets/pass_text_field.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:andrewngugi_rider_app/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetForgetPassword extends StatefulWidget {
  const SetForgetPassword({super.key, required this.number});
  final dynamic number;

  @override
  State<SetForgetPassword> createState() => _SetForgetPasswordState();
}

class _SetForgetPasswordState extends State<SetForgetPassword> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.bgImage))),
      child: SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(
              title: "Forget", isCenterd: true, leadingIconUnVisible: true),
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
                                    controller: password,
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
                                    controller: confirmPassword,
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
                          name: "Change Password",
                          onCallBack: () async {
                            try {
                              bool success = await setForgetPasswordRx
                                  .setForgetPasswordInformation(
                                      password: password.text,
                                      confirmPassword: confirmPassword.text,
                                      phoneNumber: widget.number);

                              if (success) {
                                NavigationService.navigateTo(
                                    Routes.driverSignIn);
                              }
                            } catch (e) {
                              // Handle the error if the API call fails or any error occurs
                              print(
                                  "Error during API call: $e"); // Log the error
                              ToastUtil.showLongToast(
                                  "An error occurred. Please try again.");
                            }
                          },
                          color: AppColor.buttonColor,
                          borderColor: Colors.transparent,
                          context: context),
                    ],
                  ))),
        ),
      ),
    );
  }
}
