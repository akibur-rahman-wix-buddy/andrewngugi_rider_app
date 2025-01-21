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
import 'package:get/get.dart';

import '../../../common_widgets/custom_textfeild.dart';

class PasswordConformation extends StatefulWidget {
  const PasswordConformation({super.key});

  @override
  State<PasswordConformation> createState() => _PasswordConformationState();
}

class _PasswordConformationState extends State<PasswordConformation> {
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
                      Text("Set Your password",style: TextFontStyle.headLine20PoppinsW600,),
                      UIHelper.verticalSpace(16.h),
                      PassTextField(
                        controller: TextEditingController(),
                        hintText: 'Enter Your Password',
                        isSufixIcon: true,
                        isObsecure: true,
                      ),

                      UIHelper.verticalSpace(10.h),
                      PassTextField(
                        controller: TextEditingController(),
                        hintText: 'Enter Your Conform Password',
                        isSufixIcon: true,
                        isObsecure: true,
                      ),

                      UIHelper.verticalSpace(80.h),
                      customButton(name: "Sign In", onCallBack: (){
                        Get.defaultDialog(
                          radius: 25,
                          content: SizedBox(
                            height: 300.h,
                            child: Column(
                              children: [
                                Image.asset(AppImages.loginSuccess),
                                UIHelper.verticalSpace(15.h),
                                Divider(
                                  height: 2.h,
                                  color: Colors.black,
                                ),
                                UIHelper.verticalSpace(10.h),
                                GestureDetector(
                                    onTap: (){
                                      NavigationService.navigateToReplacement(Routes.driveNavigationScreen);
                                    },
                                    child: Text("Continues",style: TextFontStyle.textStyle16PoppinsW500.copyWith(color: AppColor.buttonColor),))
                              ],
                            ),
                          )
                        );
                      },color: AppColor.buttonColor,borderColor: Colors.transparent, context: context),


                    ],
                  ))),
        ),
      ),
    );
  }
}



