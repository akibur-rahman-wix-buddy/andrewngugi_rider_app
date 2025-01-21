import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/presentation/edit_vehicle_screen.dart';
import 'package:andrewngugi_rider_app/gen/assets.gen.dart';
import 'package:andrewngugi_rider_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'edit_personal_profile.dart';

class DriverEditProfile extends StatefulWidget {
  const DriverEditProfile({super.key});

  @override
  State<DriverEditProfile> createState() => _DriverEditProfileState();
}

class _DriverEditProfileState extends State<DriverEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImages.bgImage)),
      ),
      child: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context); // Back navigation
                },
                icon: SvgPicture.asset(Assets.icons.backIcon),
              ),
            ),
            title: const Text(
              'Edit Profile',
              style: TextStyle(color: AppColors.c141414),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              children: [
                // TabBar
                Container(
                  height: 50.h,
                  margin: EdgeInsets.symmetric(horizontal: 80.w),
                  decoration: BoxDecoration(
                    color:AppColor.buttonColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.black, // Selected tab text color
                    unselectedLabelColor: Colors.white, // Unselected tab text color
                    padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5),
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    tabs:  const [
                      Tab(text: 'Personal',),
                      Tab(text: 'Vehicle'),
                    ],
                  ),
                ),
                // TabBarView
                const Expanded(
                  child: TabBarView(
                    children: [
                      DriverEditPersonalProfile(), // Ongoing tab content
                      EditVehicleScreen(), // Completed tab content
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
