import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_icons/app_icons.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/controller/location_set_start_now.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/driver_home/map/presentation/driver_map.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widget/top_bottom_sheet.dart';

class DriverHome extends StatefulWidget {
  const DriverHome({super.key});

  @override
  State<DriverHome> createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {
  bool isOn = false;

  void toggleSwitch() {
    setState(() {
      isOn = !isOn;
    });
  }

  @override
  void dispose() {
    toggleSwitch();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const DriverMapScreen(),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              height: 83.h, // Using ScreenUtil for responsive height
              color: AppColor.buttonColor, // Assuming AppColor is predefined
              child: Column(
                children: [
                  UIHelper.verticalSpace(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hi, Marzia!",
                        style: TextFontStyle.textStyle16PoppinsW600
                            .copyWith(color: Colors.white),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: toggleSwitch,
                          child: AnimatedContainer(
                            padding: const EdgeInsets.all(5),
                            width: 86.w, // Using responsive sizing
                            height: 32.h, // Using responsive sizing
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: isOn ? Colors.green : Colors.grey,
                            ),
                            child: Stack(
                              children: [
                                // Center Text
                                Align(
                                  alignment: isOn
                                      ? Alignment.centerLeft
                                      : Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      isOn
                                          ? "Online"
                                          : "Offline", // Text changes based on the state of isOn
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.sp, // Responsive font size
                                      ),
                                    ),
                                  ),
                                ),
                                // Circle that moves to the right or left
                                Align(
                                  alignment: isOn
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    width: 25.w, // Adjust size for the circle
                                    height: 25.h, // Adjust size for the circle
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "24 Dec",
                            style: TextFontStyle.textStyle16PoppinsW600
                                .copyWith(color: Colors.white),
                          ),
                          GestureDetector(
                              onTap: () {
                                showTopSheet(context);
                              },
                              child: const Icon(
                                Icons.calendar_month,
                                color: Colors.white,
                              ))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 160.h,
            left: 10.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 180.w,
              width: 165.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Earning of this month",
                    style: TextFontStyle.textStyle14PoppinsW600,
                  ),
                  Column(
                    children: [
                      Text(
                        "\$1345.67",
                        style: TextFontStyle.textStyle14PoppinsW500,
                      ),
                      const Text(
                        "December",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.green,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 160.h,
            right: 10.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 180.w,
              width: 165.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Upcoming Trip",
                        style: TextFontStyle.textStyle14PoppinsW600,
                      ),
                      UIHelper.verticalSpace(10.h),
                      Container(
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: AppColor.buttonColor.withOpacity(.6),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child:
                            const Center(child: Text("13 Nov 2024, 08:45 PM")),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black38)),
                              child: SvgPicture.asset(AppIcons.locationPoint)),
                          VerticalDashedLine(
                            height: 10.h,
                            color: Colors.red,
                          ),
                          Container(
                              height: 20.h,
                              width: 20.w,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black38)),
                              child: SvgPicture.asset(AppIcons.location1)),
                        ],
                      ),
                      UIHelper.horizontalSpace(10.w),
                      SizedBox(
                        height: 60.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Celina, Delaware",
                              style: TextFontStyle.textStyle12PoppinsW400
                                  .copyWith(color: Colors.black),
                            ),
                            Text(
                              "Mesa, Jersey",
                              style: TextFontStyle.textStyle12PoppinsW400
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
