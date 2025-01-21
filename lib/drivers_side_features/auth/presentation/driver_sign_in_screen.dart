import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/common_widgets/pass_text_field.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../common_widgets/custom_textfeild.dart';

class DriverSignInScreen extends StatefulWidget {
  const DriverSignInScreen({super.key});

  @override
  State<DriverSignInScreen> createState() => _DriverSignInScreenState();
}

class _DriverSignInScreenState extends State<DriverSignInScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.bgImage))),
      child: SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(
              title: "Sign In", isCenterd: true, leadingIconUnVisible: true),
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
                      CustomTextFormField(
                        controller: phoneController,
                        hintText: 'Enter Your Phone Number',
                      ),
                      UIHelper.verticalSpace(10.h),
                      PassTextField(
                        controller: TextEditingController(),
                        hintText: 'Enter Your Password',
                        isSufixIcon: true,
                        isObsecure: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Text( "Forgot Password?",style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: AppColor.buttonColor,decoration: TextDecoration.underline ), )
                        ],
                      ),
                      UIHelper.verticalSpace(50.h),
                      customButton(name: "Sign In", onCallBack: (){

                        NavigationService.navigateTo(Routes.driveNavigationScreen);

                      },color: AppColor.buttonColor,borderColor: Colors.transparent, context: context),
                    UIHelper.verticalSpace(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text("Don’t have an account?",style: TextFontStyle.textStyle14PoppinsW500),
                          UIHelper.horizontalSpace(10.w),
                          GestureDetector(
                              onTap: (){
                                NavigationService.navigateTo(Routes.driverSignUp);
                              },
                              child: Text("Sign Up",style: TextFontStyle.textStyle14PoppinsW500.copyWith(color: AppColor.buttonColor,decoration: TextDecoration.underline),))
                        ],
                      ),

                    ],
                  ))),
        ),
      ),
    );
  }
}
