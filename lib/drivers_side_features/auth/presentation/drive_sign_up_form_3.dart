import 'dart:developer';

import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/widget/driver_sign_updrop_down.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/controller/AppController.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widget/custom_userProfile_text_field.dart';

class DriveSignUpForm3 extends StatefulWidget {
  const DriveSignUpForm3({super.key});

  @override
  State<DriveSignUpForm3> createState() => _DriveSignUpForm3State();
}

class _DriveSignUpForm3State extends State<DriveSignUpForm3> {


  @override
  Widget build(BuildContext context) {


    AppController controller = Get.put(AppController());
    List<String> timePeriods = [];

    // Add months (1 month to 12 months)
    for (int i = 1; i <= 12; i++) {
      timePeriods.add('$i month${i > 1 ? 's' : ''}');
    }

    // Add years (1 year to 10 years)
    for (int i = 1; i <= 10; i++) {
      timePeriods.add('$i year${i > 1 ? 's' : ''}');
    }

    // Print the list
    print(timePeriods);

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Step 1 (Completed)
                          const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 21, // Adjust size
                                backgroundImage:
                                AssetImage(AppImages.rightClick),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4),
                            ],
                          ),
                          // Dashed line between Step 1 and Step 2
                          SizedBox(
                            width: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                8, // Number of dashes
                                    (index) => Container(
                                  width: 4, // Width of each dash
                                  height: 1, // Height of each dash
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          // Step 2 (Inactive)
                          const CircleAvatar(
                            radius: 21, // Adjust size
                            backgroundImage: AssetImage(AppImages.rightClick),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                          // Dashed line between Step 2 and Step 3
                          SizedBox(
                            width: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                8, // Number of dashes
                                    (index) => Container(
                                  width: 4, // Width of each dash
                                  height: 1, // Height of each dash
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          // Step 3 (Inactive)
                          const CircleAvatar(
                            radius: 21, // Adjust size
                            backgroundImage: AssetImage(AppImages.rightClick),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(16.h),
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.1),
                                  blurRadius: 10.sp,
                                  spreadRadius: .4)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Driver Credentials",
                              style: TextFontStyle.textStyle16PoppinsW600,
                            ),
                            UIHelper.verticalSpace(16.h),




                            ///>>>>>>>>>>>>>>>>>>>> Model type >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                            CustomUserprofileTextField(
                              controller: controller.drivingLicence,
                              wight: double.infinity,
                              title: "Driving License*",
                              hintText: "Enter your driving license number",
                            ),
                            UIHelper.verticalSpace(16.h),
                            ///>>>>>>>>>>>>>>>>>>>> Vehicle Type >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                            DropdownButtonExample(
                              controller: controller.drivingExperienceController,
                              title: 'Driving Experience',
                              // list: const ["Option 1", "Option 2", "Option 3"],
                              list: timePeriods

                            ),
                            UIHelper.verticalSpace(16.h),



                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                  side: const BorderSide(
                                    color: Colors.black54, // Border color when unchecked
                                    width: 2.0,
                                  ),
                                  value: controller.termsAndCondition == 1, // Convert int to bool
                                  onChanged: (bool? value) {
                                    setState(() {
                                      controller.termsAndCondition = value == true ? 1 : 0; // Convert bool to int
                                    });
                                  },
                                ),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: "By signing up you are agree to ",
                                      style: const TextStyle(
                                        color: Colors.grey, // Base text color
                                        fontSize: 16.0, // Font size
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "terms and condition.",
                                          style: const TextStyle(
                                            color: Colors.orange, // Highlighted text color
                                            decoration: TextDecoration.underline, // Underline
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              // Navigate or show terms and conditions
                                              print("Terms and Conditions clicked");
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                      UIHelper.verticalSpace(250.h),
                      ///>>>>>>>>>>>>>>>>>>>>  Button >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      customButton(
                          name: "Continue",
                          onCallBack:  controller.termsAndCondition ==0?(){
                            ToastUtil.showLongToast(" Check the terms and condition");
                          }:  () {
                            log(">>>>>>>>>>>>>>>>>>>>>>> driving exparince ${controller.drivingExperienceController.value}) }");
                            NavigationService.navigateTo(Routes.passwordConformation);
                            },
                          borderColor: Colors.transparent,
                          color: AppColor.buttonColor,
                          context: context),
                      UIHelper.verticalSpace(25.h),
                    ],
                  ))),
        ),
      ),
    );
  }
}


