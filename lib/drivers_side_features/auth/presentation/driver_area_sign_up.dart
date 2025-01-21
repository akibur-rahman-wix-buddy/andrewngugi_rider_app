import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DriverAreaSignUp extends StatefulWidget {
  const DriverAreaSignUp({super.key});

  @override
  State<DriverAreaSignUp> createState() => _DriverAreaSignUpState();
}

class _DriverAreaSignUpState extends State<DriverAreaSignUp> {
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
                    "Select You’ll drive in",
                    style: TextFontStyle.headLine20PoppinsW600,
                  ),
                  UIHelper.verticalSpace(10.h),
                  customButton(
                    textStyle: TextFontStyle.textStyle16PoppinsW600.copyWith(color:_selectedButton == "California"
                        ? AppColor.whiteColor
                        : AppColor.buttonColor, ),

                    name: "California",
                    onCallBack: () {
                      _onButtonPressed("California");
                      NavigationService.navigateTo(Routes.driverCarSignUp);
                    },
                    color: _selectedButton == "California"
                        ? AppColor.buttonColor
                        : Colors.white,
                    borderColor: _selectedButton == "California"
                        ? AppColor.whiteColor
                        : Colors.black12,
                    context: context,
                  ),
                  UIHelper.verticalSpace(10.h),
                  customButton(textStyle: TextFontStyle.textStyle16PoppinsW600.copyWith(color:_selectedButton == "New Jersey"
                      ? AppColor.whiteColor
                      : AppColor.buttonColor, ),
                    name: "New Jersey",
                    onCallBack: () {
                      _onButtonPressed("New Jersey");
                      NavigationService.navigateTo(Routes.driverCarSignUp);
                  },
                    color: _selectedButton == "New Jersey"
                        ? AppColor.buttonColor
                        : Colors.white,
                    borderColor: _selectedButton == "New Jersey"
                        ? AppColor.whiteColor
                        :Colors.black12,
                    context: context,
                  ),
                  UIHelper.verticalSpace(10.h),
                  customButton(
                    textStyle: TextFontStyle.textStyle16PoppinsW600.copyWith(color:_selectedButton == "New Mexico"
                        ? AppColor.whiteColor
                        : AppColor.buttonColor, ),
                    name: "New Mexico",
                    onCallBack: () {
                      _onButtonPressed("New Mexico");
                      NavigationService.navigateTo(Routes.driverCarSignUp);

                    } ,
                    color: _selectedButton == "New Mexico"
                        ? AppColor.buttonColor
                        : Colors.white,
                    borderColor: _selectedButton == "New Mexico"
                        ? AppColor.whiteColor
                        : Colors.black12,
                    context: context,
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

