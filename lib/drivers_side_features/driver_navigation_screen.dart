import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_icons/app_icons.dart';
import 'package:andrewngugi_rider_app/helpers/helper_methods.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'drive_wallet/presentation/drive_wallet.dart';
import 'driver_account_setting/presentation/driver_account_setting.dart';
import 'driver_home/presentation/driver_home.dart';


class DriverNavigationScreen extends StatefulWidget {
  final Widget? pageNum;

  const DriverNavigationScreen({
    super.key,
    this.pageNum,
  });

  @override
  State<DriverNavigationScreen> createState() => _DriverNavigationScreenState();
}

class _DriverNavigationScreenState extends State<DriverNavigationScreen> {
  int _currentIndex = 0;
  // ignore: unused_field
  int _colorIndex = 0;

  final bool _isFisrtBuild = true;

  // bool _navigationOn = true;
  final List<StatefulWidget> _screens = [
    const DriverHome(),
    const DriveWalletScreen(),
    const DriverAccountSetting(),
  ];

  @override
  Widget build(BuildContext context) {
    Object? args;
    StatefulWidget? screenPage;
    if (_isFisrtBuild) {
      args = ModalRoute.of(context)!.settings.arguments;
    }
    if (args != null) {
      _colorIndex = 3;
      screenPage = args as StatefulWidget;
      var newColorindex = -1;

      for (var element in _screens) {
        newColorindex++;
        if (element.toString() == screenPage.toString()) {
          _colorIndex = newColorindex;
          _currentIndex = newColorindex;
          break;
        }
      }
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        showMaterialDialog(context);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        // onDrawerChanged: (isOpened) => setState(() {
        //   _navigationOn = !isOpened;
        // }),
        body: Center(
          child: (screenPage != null)
              ? screenPage
              : _screens.elementAt(_currentIndex),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            bottom: 16.h,
            right: 16.w,
            left: 16.w,
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              boxShadow: [
                BoxShadow(
                  color: AppColor.blackColor.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Container(
              height: 80.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(50.r),
                ),
              ),
              child: CustomNavigationBar(
                elevation: 0,
                borderRadius: Radius.circular(50.r),
                iconSize: 90,
                selectedColor: Colors.red,
                strokeColor: Colors.transparent,
                unSelectedColor: Colors.black,
                //backgroundColor: AppColor.whiteColor,
                // Make background transparent
                items: [

                  CustomNavigationBarItem(
                    icon: Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        AppIcons.homeIcon,
                        fit: BoxFit.cover,
                      ),
                    ),
                    selectedIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Container(
                        height: 45,
                        decoration: const BoxDecoration(
                          color: AppColor.cFDF5F0,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.homeIcon,
                                color: AppColor.buttonColor,
                                fit: BoxFit.contain),
                            UIHelper.horizontalSpace(5),
                            Text(
                              'Home',
                              style: TextFontStyle.textStyle12PoppinsW500
                                  .copyWith(color: AppColor.buttonColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        AppIcons.offerIcon,
                        fit: BoxFit.cover,
                      ),
                    ),
                    selectedIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Container(
                        height: 45,
                        decoration: const BoxDecoration(
                          color: AppColor.cFDF5F0,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.wallet3,
                                color: AppColor.buttonColor,
                                fit: BoxFit.contain),
                            UIHelper.horizontalSpace(5),
                            Text(
                              'Wallet',
                              style: TextFontStyle.textStyle12PoppinsW500
                                  .copyWith(color: AppColor.buttonColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        AppIcons.tripIcon,
                        fit: BoxFit.cover,
                      ),
                    ),
                    selectedIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Container(
                        height: 45,
                        decoration: const BoxDecoration(
                          color: AppColor.cFDF5F0,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.tripIcon,
                                color: AppColor.buttonColor,
                                fit: BoxFit.contain),
                            UIHelper.horizontalSpace(5),
                            Text(
                              'Settings',
                              style: TextFontStyle.textStyle12PoppinsW500
                                  .copyWith(color: AppColor.buttonColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                currentIndex: _currentIndex,
                onTap: (index) {
                  if (index == 3) {
                    // NavigationService.navigateTo(Routes.homeScreenUser);
                  } else {
                    setState(() {
                      _currentIndex = index;
                    });
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
