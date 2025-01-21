import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/common_widgets/pass_text_field.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DriverPassword extends StatefulWidget {
  const DriverPassword({super.key});

  @override
  State<DriverPassword> createState() => _DriverPasswordState();
}

class _DriverPasswordState extends State<DriverPassword> {
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
              title: "Password", isCenterd: true,),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
                  child: Column(
                    children: [

                      UIHelper.verticalSpace(56.h),
                      Text("Set Your password",style: TextFontStyle.headLine20PoppinsW600,),
                      UIHelper.verticalSpace(16.h),
                      PassTextField(
                        controller: TextEditingController(),
                        hintText: 'Old Password',
                        isSufixIcon: true,
                        isObsecure: true,
                      ),

                      UIHelper.verticalSpace(10.h),
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
                      customButton(name: "Save", onCallBack: ()
                          {},color: AppColor.buttonColor,borderColor: Colors.transparent, context: context),


                    ],
                  ))),
        ),
      ),
    );
  }
}



