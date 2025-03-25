import 'package:andrewngugi_rider_app/assets_helper/app_icons/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../assets_helper/app_font/app_font.dart';
import '../helpers/navigation_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.onCallBack,
    this.leadingIconUnVisible = false,
    this.actions,
    this.isCenterd = false,
  });

  final String? title;
  final VoidCallback? onCallBack;
  final bool leadingIconUnVisible;
  final List<Widget>? actions;
  final bool isCenterd;

  @override
  Widget build(BuildContext context) {
    return AppBar(

      automaticallyImplyLeading: false,
      leading: leadingIconUnVisible
          ? null
          : Padding(
              padding: EdgeInsets.all(8.sp),
              child: InkWell(
                onTap: () {
                  NavigationService.goBack;
                },
                child: SvgPicture.asset(
                  AppIcons.arrowLeft,
                  height: 28.h,
                  width: 28.w,
                ),
              ),
            ),
      backgroundColor: Colors.transparent,
      centerTitle: isCenterd,
      title: Text(
        title ?? '',
        style: TextFontStyle.textStyle16PoppinsW600,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
