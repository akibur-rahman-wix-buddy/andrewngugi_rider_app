import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/widget/CustomUserProfileTextField.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriverProfile extends StatefulWidget {
  const DriverProfile({super.key});

  @override
  State<DriverProfile> createState() => _DriverProfileState();
}

class _DriverProfileState extends State<DriverProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.bgImage))),
      child:  Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(
                title: "Profiles",
                isCenterd: true,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                    child: Column(
                      children: [

                        const Center(
                          child: CircleAvatar(
                            radius: 65,
                            backgroundImage: AssetImage(AppImages.profile),
                          ),
                        ),
                        UIHelper.verticalSpace(16.h),
                        const CustomUserProfileTextField(
                          enable: false,
                          wight:double.infinity ,
                          title: "Full Name (Same as NID/License)*",
                          hintText: "Cameron Williamson",
                        ),

                        UIHelper.verticalSpace(16.h),
                        const CustomUserProfileTextField(
                          enable: false,
                          wight:double.infinity,
                          title: "Phone Number",
                          hintText: "(219) 555-0114",
                        ),
                        UIHelper.verticalSpace(16.h),

                        const CustomUserProfileTextField(
                          enable: false,
                          wight:double.infinity,
                          title: "Email Address",
                          hintText: "darlener@obertson.com",
                        ),
                        const CustomUserProfileTextField(
                          enable: false,
                          wight:double.infinity,
                          title: "Address",
                          hintText: "2464 Royal Ln. Mesa, New Jersey 45463",
                        ),
                        UIHelper.verticalSpace(16.h),
                        const CustomUserProfileTextField(
                          enable: false,
                          wight:double.infinity,
                          title: "NID Number",
                          hintText: "267400",
                        ),
                        UIHelper.verticalSpace(16.h),

                        const CustomUserProfileTextField(
                          enable: false,
                          wight:double.infinity,
                          title: "Gender",
                          hintText: "Male",
                        ),
                        const CustomUserProfileTextField(
                          enable: false,
                          wight:double.infinity,
                          title: "Date Of Birth",
                          hintText: "24 September, 1990",
                        ),
                        UIHelper.verticalSpace(20.h)






                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}


