import 'dart:async';

import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_icons/app_icons.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/common_button.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class DriverSignUpVerification extends StatefulWidget {
  const DriverSignUpVerification({super.key});

  @override
  State<DriverSignUpVerification> createState() => _DriverSignUpVerificationState();
}

class _DriverSignUpVerificationState extends State<DriverSignUpVerification> {
  Timer? _timer;
  int _start = 30; // 30 seconds for the timer
  Color _buttonColor = AppColor.buttonColor; // Initial color for active state

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _buttonColor = Colors.grey; // Set button color to grey when timer starts
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        setState(() {
          _buttonColor =
              AppColor.buttonColor; // Set to orange when timer finishes
          timer.cancel();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.bgImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                UIHelper.kDefaulutPadding(),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              NavigationService.goBack();
                            },
                            child: SvgPicture.asset(AppIcons.backIcon)),
                        UIHelper.horizontalSpace(110.w),
                        Text(
                          'Verification',
                          style: TextFontStyle.textStylePoppins.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(40.h),
                    Image.asset(
                      AppImages.otpImage,
                      height: 160.h,
                      width: 160.w,
                    ),
                    UIHelper.verticalSpace(40.h),
                    Text(
                      "OTP Verification",
                      style: TextFontStyle.textStylePoppins.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    UIHelper.verticalSpace(10.h),
                    Text(
                      "Enter verification code that\n was sent to" +
                          " +88 01615257555",
                      style: TextFontStyle.textStyle14PoppinsW400.copyWith(),
                      textAlign: TextAlign.center,
                    ),
                    UIHelper.verticalSpace(20.h),
                    PinCodeTextField(
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(12.r),
                          fieldHeight: 52.h,
                          fieldWidth: 70.w,
                          inactiveFillColor:
                          AppColor.whiteColor.withOpacity(0.1),
                          borderWidth: 1.sp,
                          errorBorderColor: AppColor.whiteColor,
                          inactiveColor: AppColor.blackColor.withOpacity(0.1),
                          selectedColor: AppColor.buttonColor.withOpacity(0.1),
                          selectedBorderWidth: 1,
                          activeFillColor: AppColor.whiteColor,
                          activeColor: AppColor.cEAE4E1,
                          selectedFillColor: AppColor.cEAE4E1),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      //controller: otpController,
                      onCompleted: (v) {},
                      onChanged: (value) {},
                      appContext: context,
                    ),
                    UIHelper.verticalSpace(20.h),
                    Text(
                      "00:" + "${_start} Sec",
                      style: TextFontStyle.textStyle14PoppinsW400.copyWith(
                        color: AppColor.blueGrey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't receive the code?",
                          style: TextFontStyle.textStyle14PoppinsW400.copyWith(
                            color: AppColor.blueGrey,
                          ),
                        ),
                        TextButton(
                          onPressed: _start == 0
                              ? () {
                            setState(() {
                              _start = 30; // Reset the timer
                              startTimer(); // Restart the timer
                            });
                          }
                              : null,
                          child: Text(
                            "Re-Send",
                            style:
                            TextFontStyle.textStyle14PoppinsW400.copyWith(
                              color: _buttonColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(20.h),
                    CommonButton(
                        label: 'Continue',
                        onPressed: () {
                          NavigationService.navigateTo(Routes.passwordConformation);
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
