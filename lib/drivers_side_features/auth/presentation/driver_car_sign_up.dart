import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/widget/test.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DriverCarSignUp extends StatefulWidget {
  const DriverCarSignUp({super.key});

  @override
  State<DriverCarSignUp> createState() => _DriverCarSignUpState();
}

class _DriverCarSignUpState extends State<DriverCarSignUp> {
  String? _selectedButton;

  void _onButtonPressed(String buttonName) {
    setState(() {
      _selectedButton = buttonName;
    });

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
                  customRowButton(
                    image: AppImages.van2,
                    textStyle: TextFontStyle.textStyle16PoppinsW600.copyWith(color:_selectedButton == "Van"
                        ? AppColor.whiteColor
                        : AppColor.buttonColor, ),

                    name: "Van",
                    onCallBack: ()  {
                      _onButtonPressed("Van");
                      NavigationService.popAndReplace(Routes.driverSignUpForm);
                    },
                    color: _selectedButton == "Van"
                        ? AppColor.buttonColor
                        : Colors.white,
                    borderColor: _selectedButton == "Van"
                        ? AppColor.whiteColor
                        : Colors.black12,
                    context: context,
                  ),
                  UIHelper.verticalSpace(10.h),
                  customRowButton(

                    image: AppImages.truck2,
                    textStyle: TextFontStyle.textStyle16PoppinsW600.copyWith(color:_selectedButton == "Truck"
                      ? AppColor.whiteColor
                      : AppColor.buttonColor, ),
                    name: "Truck",
                    onCallBack: () {
                      NavigationService.popAndReplace(Routes.driverSignUpForm);
                      _onButtonPressed("Truck");
                    },
                    color: _selectedButton == "Truck"
                        ? AppColor.buttonColor
                        : Colors.white,
                    borderColor: _selectedButton == "Truck"
                        ? AppColor.whiteColor
                        : Colors.black12,
                    context: context,
                  ),
                  UIHelper.verticalSpace(10.h),
                  customRowButton(
                    image: AppImages.xl2,
                    textStyle: TextFontStyle.textStyle16PoppinsW600.copyWith(color:_selectedButton == "Xl"
                        ? AppColor.whiteColor
                        : AppColor.buttonColor, ),
                    name: "Xl",
                    onCallBack: () { _onButtonPressed("Xl");
                    NavigationService.popAndReplace(Routes.driverSignUpForm);
                      },
                    color: _selectedButton == "Xl"
                        ? AppColor.buttonColor
                        : Colors.white,
                    borderColor: _selectedButton == "Xl"
                        ? AppColor.whiteColor
                        :Colors.black12,
                    context: context,
                  ),
                  UIHelper.verticalSpace(10.h),
                  customRowButton(
                    image: AppImages.pickup2,
                    textStyle: TextFontStyle.textStyle16PoppinsW600.copyWith(color:_selectedButton == "Pickup"
                        ? AppColor.whiteColor
                        : AppColor.buttonColor, ),
                    name: "Pickup",
                    onCallBack: () { _onButtonPressed("Pickup");
                      NavigationService.popAndReplace(Routes.driverSignUpForm);
                    },
                    color: _selectedButton == "Pickup"
                        ? AppColor.buttonColor
                        : Colors.white,
                    borderColor: _selectedButton == "Pickup"
                        ? AppColor.whiteColor
                        : Colors.black12,
                    context: context,
                  ),




                  Container(
                    height: 56.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.r))
                    ),
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

