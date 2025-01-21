import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_icons/app_icons.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class DriveWalletScreen extends StatefulWidget {
  const DriveWalletScreen({super.key});

  @override
  State<DriveWalletScreen> createState() => _DriveWalletScreenState();
}

class _DriveWalletScreenState extends State<DriveWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppImages.bgImage,
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: 80.h, // Using ScreenUtil for responsive height
              color: AppColor.buttonColor, // Assuming AppColor is predefined
              child: Column(
                children: [
                  UIHelper.verticalSpace(25.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hi, Marzia!",
                        style: TextFontStyle.textStyle16PoppinsW600
                            .copyWith(color: Colors.white),
                      ),
                      Row(
                        children: [
                          Text(
                            "24 Dec",
                            style: TextFontStyle.textStyle16PoppinsW600
                                .copyWith(color: Colors.white),
                          ),
                          UIHelper.horizontalSpace(5.w),
                          GestureDetector(
                              onTap: () {
                                NavigationService.navigateTo(Routes.withdrawScreen);
                              },
                              child: SvgPicture.asset(AppIcons.moneySend)
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            // UIHelper.verticalSpace(16.h),
            Padding(
              padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 118.w,
                          width: 150.w,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Earning",
                                style: TextFontStyle.textStyle14PoppinsW600,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "December",
                                    style: TextFontStyle.textStyle14PoppinsW500,
                                  ),
                                  const Text(
                                    "\$1345.67",
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
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 118.w,
                          width: 150.w,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Trips",
                                style: TextFontStyle.textStyle14PoppinsW600,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "December",
                                    style: TextFontStyle.textStyle14PoppinsW500,
                                  ),
                                  const Text(
                                    "56",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: AppColor.cFFC107,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(16.h),
                    Container(
                      padding: EdgeInsets.all(16.sp),
                      height: 118.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColor.c3B302A,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Ongoing",
                                style: TextFontStyle.textStyle14PoppinsW600
                                    .copyWith(color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Trip ID",
                                    style: TextFontStyle.textStyle14PoppinsW600
                                        .copyWith(color: Colors.white),
                                  ),
                                  UIHelper.horizontalSpace(10.w),
                                  Text(
                                    "# S458SFV",
                                    style: TextFontStyle.textStyle14PoppinsW600
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "December",
                                style: TextFontStyle.textStyle12PoppinsW500
                                    .copyWith(color: Colors.white),
                              ),
                              const Text(
                                "\$3245",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: AppColor.cD44F05,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    UIHelper.verticalSpace(16.h),
                    Text(
                      "Recent Transection",
                      style: TextFontStyle.textStyle16PoppinsW600,
                    ),
                    // UIHelper.verticalSpace(16.h),
                     SizedBox(
                       height: 350,
                       child:ListView.builder(
                         shrinkWrap: true,
                         itemCount: 10,
                         itemBuilder: (context, index) {
                           return TransectionCard();
                         },
                       ),
                     )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TransectionCard extends StatelessWidget {
  const TransectionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        padding: EdgeInsets.all(5.sp),
        height: 76.h,
        width: 330.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 10)
            ]),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundImage: const AssetImage(AppImages.digitalPay),
            ),
            UIHelper.horizontalSpace(10.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 280,
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pay Pal",
                        style:
                            TextFontStyle.textStyle14PoppinsW500,
                      ),
                      Text(
                        "-\$658.00",
                        style: TextFontStyle
                            .textStyle14PoppinsW500
                            .copyWith(color: Colors.red),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 280,
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Withdraw",
                        style: TextFontStyle
                            .textStyle14PoppinsW500
                            .copyWith(color: Colors.black54),
                      ),
                      Text(
                        "21.02.24",
                        style: TextFontStyle
                            .textStyle14PoppinsW500
                            .copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
