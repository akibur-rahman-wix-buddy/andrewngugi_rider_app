import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../helpers/navigation_service.dart';

class LoriAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoriAppBar({
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
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      // AppBar's background is already transparent
      leading: leadingIconUnVisible
          ? null
          : Padding(
              padding: EdgeInsets.all(10.sp),
              child: InkWell(
                onTap: () {
                  if (onCallBack != null) {
                    onCallBack!();
                  } else {
                    NavigationService.goBack(); // Corrected method call
                  }
                },
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color:
                        Colors.transparent, // Changed from white to transparent
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: SvgPicture.asset(
                    Assets.icons.arrowPrevious,
                    height: 28.h,
                    width: 28.w,
                    color: AppColors.c000000,
                  ),
                ),
              ),
            ),
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
