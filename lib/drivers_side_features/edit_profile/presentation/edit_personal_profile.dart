import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/widget/driver_sign_updrop_down.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/widget/CustomUserProfileTextField.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/widget/driver_image_picker.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriverEditPersonalProfile extends StatefulWidget {
  const DriverEditPersonalProfile({super.key});

  @override
  State<DriverEditPersonalProfile> createState() => _DriverEditPersonalProfileState();
}

class _DriverEditPersonalProfileState extends State<DriverEditPersonalProfile> {

  final drivingExperienceController = DropdownButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                  child: Column(
                    children: [

                      const Center(
                        child: DriverImagePicker()
                      ),
                      UIHelper.verticalSpace(16.h),
                      const CustomUserProfileTextField(

                        wight:double.infinity ,
                        title: "Full Name (Same as NID/License)*",
                        hintText: "Cameron Williamson",
                      ),

                      UIHelper.verticalSpace(16.h),
                      const CustomUserProfileTextField(

                        wight:double.infinity,
                        title: "Phone Number",
                        hintText: "(219) 555-0114",
                      ),
                      UIHelper.verticalSpace(16.h),

                      const CustomUserProfileTextField(

                        wight:double.infinity,
                        title: "Email Address",
                        hintText: "darlener@obertson.com",
                      ),
                      const CustomUserProfileTextField(

                        wight:double.infinity,
                        title: "Address",
                        hintText: "2464 Royal Ln. Mesa, New Jersey 45463",
                      ),
                      UIHelper.verticalSpace(16.h),
                      const CustomUserProfileTextField(

                        wight:double.infinity,
                        title: "NID Number",
                        hintText: "267400",
                      ),
                      UIHelper.verticalSpace(16.h),

                      const CustomUserProfileTextField(

                        wight:double.infinity,
                        title: "Gender",
                        hintText: "Male",
                      ),
                      const CustomUserProfileTextField(

                        wight:double.infinity,
                        title: "Date Of Birth",
                        hintText: "24 September, 1990",
                      ),
                      UIHelper.verticalSpace(10.h),

                      DropdownButtonExample(
                        controller:drivingExperienceController,
                        title: 'Driving Experience',
                        list: const ["5 years ", "3 years ", "2 years "],
                      ),
                      UIHelper.verticalSpace(10.h),
                      customButton(name: "Save", onCallBack: (){}, color: AppColor.buttonColor,borderColor: Colors.transparent, context: context)





                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}


