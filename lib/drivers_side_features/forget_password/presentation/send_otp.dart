import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/controller/AppController.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:andrewngugi_rider_app/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';

import '../../../helpers/all_routes.dart';

class SendForgetOtp extends StatefulWidget {
  const SendForgetOtp({super.key});

  @override
  State<SendForgetOtp> createState() => _SendForgetOtpState();
}

class _SendForgetOtpState extends State<SendForgetOtp> {



  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController countryNumberCode = TextEditingController();


  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  Future<void> handleNumberVerify() async {
    setState(() => isLoading = true);

    String phoneNumber = countryNumberCode.text + _mobileController.text;
    print(">>>>>>>>>>>>>>>>> number = $phoneNumber");

    try {
      bool success =
      await forgetOptSentRx.forgetNumberSendData (phoneNumber: phoneNumber);
      if (success) {
        NavigationService.navigateToWithArgs(
            Routes.forgetVerification,
            {"number": phoneNumber});
      } else {
        ToastUtil.showLongToast("Signup failed. Please try again.");
      }
    } catch (error) {
      ToastUtil.showLongToast("An error occurred. Please try again later.");
    } finally {
      setState(() => isLoading = false); // Hide Lottie animation
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImages.bgImage)),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(
            title: "Forget",
            isCenterd: true,
            leadingIconUnVisible: true,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
              child: Form(
                // Wrap with Form widget
                key: _formKey,
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
                      "Forget Your Password",
                      style: TextFontStyle.headLine20PoppinsW600,
                    ),
                    UIHelper.verticalSpace(10.h),
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Enter your number to get started. We’ll use this number to send updates about your LORI.",
                        style: TextFontStyle.textStyle14PoppinsW400.copyWith(
                          color: Colors.black.withOpacity(.5),
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace(10.h),
                    Row(
                      children: [
                        Expanded(
                          child: IntlPhoneField(
                            controller: _mobileController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            initialCountryCode: 'BD',
                            validator: (value) {
                              if (value == null || value.number.isEmpty) {
                                return 'Phone number is required';
                              }
                              return null;
                            },
                            onChanged: (phone) {
                              countryNumberCode.text = phone.countryCode;
                            },
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(50.h),

                    isLoading ?
                    Container(
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
                          'assets/lottie/loading.json',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ):
                    customButton(
                      name: "Continue",
                      onCallBack: () {

                        handleNumberVerify();

                      },
                      color: AppColor.buttonColor,
                      borderColor: Colors.transparent,
                      context: context,
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
