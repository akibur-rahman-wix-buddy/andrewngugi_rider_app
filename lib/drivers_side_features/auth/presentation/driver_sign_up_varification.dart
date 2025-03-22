import 'dart:async';

import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_icons/app_icons.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/common_button.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/controller/AppController.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:andrewngugi_rider_app/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


import '../../edit_profile/presentation/widgets/pin_code_fields.dart';

class DriverSignUpVerification extends StatefulWidget {
  const DriverSignUpVerification({super.key, required this.number});
  final String number;

  @override
  State<DriverSignUpVerification> createState() => _DriverSignUpVerificationState();
}

class _DriverSignUpVerificationState extends State<DriverSignUpVerification> {

  AppController controller = Get.put(AppController());

  TextEditingController otpController =TextEditingController();

  bool isLoading =false;
  Timer? _timer;
  int _start = 30; // 30 seconds for the timer
  Color _buttonColor = AppColor.buttonColor; // Initial color for active state

  @override
  void initState() {
    super.initState();
    startTimer();
  }


  Future<void> resendOtp() async {
    String phoneNumber = controller.verifyPhoneNumber.text ;
    print(">>>>>>>>>>>>>>>>> number = $phoneNumber");

    try {
      bool success =
      await numberVerifiedRx.numberVerify(phoneNumber: phoneNumber);
      if (success) {
        ToastUtil.showLongToast(" OTP Resent Success");
      } else {
        ToastUtil.showLongToast("Resend failed please try again.");
      }
    } catch (error) {
      ToastUtil.showLongToast("An error occurred. Please try again later.");
    } finally {
    }
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
                          "${controller.verifyPhoneNumber.text}",
                      style: TextFontStyle.textStyle14PoppinsW400.copyWith(),
                      textAlign: TextAlign.center,
                    ),
                    UIHelper.verticalSpace(20.h),
                    PinCodeTextField(
                      controller: otpController,
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
                              _start = 60; // Reset the timer
                              startTimer(); // Restart the timer
                            });
                          }
                              : null,
                          child: GestureDetector(

                            onTap:(){
                              resendOtp();
                            },
                            child: Text(
                              "Re-Send",
                              style:
                              TextFontStyle.textStyle14PoppinsW400.copyWith(
                                color: _buttonColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(20.h),
                    isLoading
                        ?  Container(
                      height: 60.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2.w,
                              color: AppColor.buttonColor
                          ),
                          borderRadius: BorderRadius.circular(10.r)
                      ),

                      child: Center(
                        child: Lottie.asset(
                          'assets/lottie/loading.json',  // Replace with the path to your Lottie file
                          width: 100,  // Adjust the width of the animation
                          height: 100, // Adjust the height of the animation
                          fit: BoxFit.cover,  // Optional: fit the animation
                        ),
                      ),
                    )
                        :CommonButton(
                      label: 'Continue',
                      onPressed: () async {
                        setState(() => isLoading = true);

                        String otpCode = otpController.text;
                        String phoneNumber =controller.verifyPhoneNumber.text;

                        if (otpCode.isEmpty) {
                          ToastUtil.showLongToast("OTP code cannot be empty.");
                          setState(() => isLoading = false);
                          return;
                        }

                        if (phoneNumber.isEmpty) {
                          ToastUtil.showLongToast("Phone number is required.");
                          setState(() => isLoading = false);
                          return;
                        }

                        try {
                          bool success = await otpVerificationApiRxObj.otpCodeVerification(
                            otpCode: otpCode,
                            phoneNumber: phoneNumber,
                          );

                          if (success) {
                            ToastUtil.showLongToast("otp verification success");
                          }
                        } catch (error) {
                          ToastUtil.showLongToast("Incorrect OTP.");
                        }

                        setState(() => isLoading = false);
                      },
                    ),
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
