import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CommonButton extends StatelessWidget {
  final String? imagePath;
  final String label;
  final color;
  final borderColor;
  final textColor;
  final imageColor;
  final VoidCallback onPressed;

  const CommonButton({
    Key? key,
    this.imagePath,
    required this.label,
    this.color,
    required this.onPressed,
    this.borderColor,
    this.textColor,
    this.imageColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 56.h,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: color ?? AppColor.buttonColor,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: borderColor ?? AppColor.buttonColor,
            width: 1.sp,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: Image.asset(
                  imagePath!,
                  height: 20.h,
                  width: 20.w,
                  color: imageColor ?? Colors.white,
                ),
              ),
            Text(
              label,
              style: TextFontStyle.textStyle14PoppinsW400.copyWith(
                color: textColor ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
