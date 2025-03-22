import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_icons/app_icons.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/model/personal_data_model.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:andrewngugi_rider_app/networks/api_acess.dart';
import 'package:andrewngugi_rider_app/networks/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class DriverAccountSetting extends StatefulWidget {
  const DriverAccountSetting({super.key});

  @override
  State<DriverAccountSetting> createState() => _DriverAccountSettingState();
}

class _DriverAccountSettingState extends State<DriverAccountSetting> {
  PersonalData? getPersonalData;
  bool isLoading = false;
  String? errorMessage;
  Future<void> _fetchDriveZoneData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      final response = await getPersonalProfileDataRx.getPersonalInformation();
      setState(() {
        getPersonalData = response?.data;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchDriveZoneData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.bgImage))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: isLoading
            ? Center(
                child: Lottie.asset(
                  'assets/lottie/loading.json', // Add your Lottie JSON file
                  width: 200,
                  height: 200,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomAppBar(
                      title: "Account & Settings",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          ///>>>>>>>>>>>>>>>>>>>>>>> profile part>>>>>>>>>>>>>>>>>>>>>>>>>>
                          GestureDetector(
                            onTap: () {
                              NavigationService.navigateTo(
                                  Routes.driverProfile);
                            },
                            child: Container(
                                padding: EdgeInsets.all(13.sp),
                                height: 84.h,
                                decoration: BoxDecoration(
                                  color: AppColor.buttonColor,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 28,
                                          backgroundImage: getPersonalData!
                                                      .avatar ==
                                                  null
                                              ? AssetImage(AppImages.profile)
                                              : NetworkImage(imageUrl +
                                                  getPersonalData!.avatar
                                                      .toString()),
                                        ),
                                        UIHelper.horizontalSpace(16.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${getPersonalData?.firstName.toString() ?? ""} ${getPersonalData?.lastName.toString() ?? ""}",
                                              style: TextFontStyle
                                                  .textStyle14PoppinsW500
                                                  .copyWith(
                                                      color:
                                                          AppColor.whiteColor),
                                            ),
                                            UIHelper.verticalSpace(10.h),
                                            Text(
                                              getPersonalData?.phone.toString() ?? "",
                                              style: TextFontStyle
                                                  .textStyle14PoppinsW400
                                                  .copyWith(
                                                      color: Colors.white60),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const Icon(
                                      Icons.chevron_right,
                                      color: AppColor.whiteColor,
                                      size: 30,
                                    )
                                  ],
                                )),
                          ),
                          UIHelper.verticalSpace(8.h),

                          Container(
                              height: 56.h,
                              padding: EdgeInsets.all(16.sp),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 40,
                                    offset: Offset(0, 8),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: const CustomRowInDriverAccount(
                                title: " Notifications",
                                icon: AppIcons.notification,
                              )),
                          UIHelper.verticalSpace(8.h),
                          GestureDetector(
                            onTap: () {
                              NavigationService.navigateTo(
                                  Routes.driverHistory);
                            },
                            child: Container(
                                height: 56.h,
                                padding: EdgeInsets.all(16.sp),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 40,
                                      offset: Offset(0, 8),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: const CustomRowInDriverAccount(
                                  title: " Drive History",
                                  icon: AppIcons.car,
                                )),
                          ),
                          UIHelper.verticalSpace(8.h),
                          Container(
                              // height: 200.h,
                              padding: EdgeInsets.all(16.sp),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 40,
                                    offset: Offset(0, 8),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Account",
                                    style: TextFontStyle.textStyle14PoppinsW400
                                        .copyWith(color: AppColor.blueGrey),
                                  ),
                                  UIHelper.verticalSpace(10.h),
                                  GestureDetector(
                                    onTap: () {
                                      NavigationService.navigateTo(
                                          Routes.driverEditProfile);
                                    },
                                    child: const CustomRowInDriverAccount(
                                      title: " Edit Profile",
                                      icon: AppIcons.profile2_icon,
                                    ),
                                  ),
                                  UIHelper.verticalSpace(12.h),
                                  const Divider(
                                    height: 1,
                                    color: Colors.black54,
                                  ),
                                  UIHelper.verticalSpace(12.h),
                                  GestureDetector(
                                    onTap: () {
                                      NavigationService.navigateTo(
                                          Routes.userEditProfile);
                                    },
                                    child: const CustomRowInDriverAccount(
                                      title: "Money Withdraw",
                                      icon: AppIcons.moneySend2,
                                    ),
                                  ),
                                  UIHelper.verticalSpace(12.h),
                                  const Divider(
                                    height: 1,
                                    color: Colors.black54,
                                  ),
                                  UIHelper.verticalSpace(12.h),
                                  GestureDetector(
                                    onTap: () {
                                      NavigationService.navigateTo(
                                          Routes.driverPassword);
                                    },
                                    child: const CustomRowInDriverAccount(
                                      title: "Password",
                                      icon: AppIcons.key,
                                    ),
                                  ),
                                ],
                              )),
                          UIHelper.verticalSpace(8.h),
                          Container(
                            height: 56.h,
                            padding: EdgeInsets.all(16.sp),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 40,
                                  offset: Offset(0, 8),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: const CustomRowInDriverAccount(
                              title: "Language",
                              icon: AppIcons.global,
                            ),
                          ),
                          UIHelper.verticalSpace(8.h),
                          Container(
                              height: 209.h,
                              padding: EdgeInsets.all(16.sp),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 40,
                                    offset: Offset(0, 8),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Help & Legal",
                                    style: TextFontStyle.textStyle14PoppinsW400
                                        .copyWith(color: AppColor.blueGrey),
                                  ),
                                  UIHelper.verticalSpace(10.h),
                                  const CustomRowInDriverAccount(
                                    title: "About",
                                    icon: AppIcons.profile2_icon,
                                  ),
                                  UIHelper.verticalSpace(12.h),
                                  const Divider(
                                    height: 1,
                                    color: Colors.black54,
                                  ),
                                  UIHelper.verticalSpace(12.h),
                                  const CustomRowInDriverAccount(
                                    title: "Emergency Support",
                                    icon: AppIcons.support,
                                  ),
                                  UIHelper.verticalSpace(12.h),
                                  const Divider(
                                    height: 1,
                                    color: Colors.black54,
                                  ),
                                  UIHelper.verticalSpace(12.h),
                                  const CustomRowInDriverAccount(
                                    title: "Help",
                                    icon: AppIcons.info,
                                  ),
                                ],
                              )),
                          UIHelper.verticalSpace(8.h),
                          GestureDetector(
                            onTap: () async {
                              bool success = await postLogOutRX.logOut();

                              if (success) {
                                print(
                                    ">>>>>>>>>>>>>>>>>>>>>>>>>>>>Logout success");
                                ToastUtil.showLongToast("Logout success");
                                NavigationService.navigateTo(
                                    Routes.driverSignIn);
                              } else {
                                ToastUtil.showLongToast(" Log out failed");
                                print(
                                    ">>>>>>>>>>>>>>>>>>>>>>>>>>>>Logout failed");
                              }
                            },
                            child: Container(
                                height: 56.h,
                                padding: EdgeInsets.all(16.sp),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 40,
                                      offset: Offset(0, 8),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: const CustomRowInDriverAccount(
                                  title: "Log Out",
                                  icon: AppIcons.logout,
                                )),
                          ),
                          UIHelper.verticalSpace(90.h),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

class CustomRowInDriverAccount extends StatelessWidget {
  const CustomRowInDriverAccount(
      {super.key, required this.icon, required this.title});
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(icon),
            UIHelper.horizontalSpace(10.w),
            Text(
              title,
              style: TextFontStyle.textStyle14PoppinsW400,
            ),
          ],
        ),
        const Icon(
          Icons.keyboard_arrow_right,
          size: 30,
          color: Colors.black,
        )
      ],
    );
  }
}
