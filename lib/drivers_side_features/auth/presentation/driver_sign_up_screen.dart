import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/custom_textfeild.dart';
import '../../../helpers/all_routes.dart';

class DriverSignUpScreen extends StatefulWidget {
  const DriverSignUpScreen({super.key});

  @override
  State<DriverSignUpScreen> createState() => _DriverSignUpScreenState();
}

class _DriverSignUpScreenState extends State<DriverSignUpScreen> {
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



                      Text("Your phone number",style:TextFontStyle.headLine20PoppinsW600,),
                      UIHelper.verticalSpace(10.h),
                       SizedBox(
                          width: 320.w,
                          child: Text( textAlign: TextAlign.center,"Enter your number to get started. We’ll use this number to send updates about your LORI.",style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: Colors.black.withOpacity(.5)),)),
                      UIHelper.verticalSpace(10.h),
                      CustomTextFormField(
                        controller: phoneController,
                        hintText: 'Enter Your Phone Number',
                      ),
                      UIHelper.verticalSpace(50.h),
                      customButton(name: "Continue", onCallBack: (){

                        NavigationService.navigateTo(Routes.driverAreaSignIn);

                      },color: AppColor.buttonColor,borderColor: Colors.transparent, context: context),
                                      ],
                  ))),
        ),
      ),
    );
  }
}
