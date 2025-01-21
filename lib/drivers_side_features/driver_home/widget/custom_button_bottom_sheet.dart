import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customButtonBottomSheet({
  required String name,
  required VoidCallback? onCallBack, // Allow null for safety
  double? height,
  double? minWidth,
  double? borderRadius,
  Color? color,
  padding,
  TextStyle? textStyle,
  required BuildContext context,
  Color? borderColor,
  elevation,
}) {
  return GestureDetector(
    onTap: onCallBack ?? () {}, // Provide a fallback if null
    child: Container(
      height: height ?? 62.h,
      width: minWidth ?? double.infinity,
      padding: padding ?? const EdgeInsets.all(0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? AppColors.c6940C9,
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        border: Border.all(
          color: borderColor ?? AppColors.c0A5B55,
        ),
      ),
      child: Text(
        name,
        overflow: TextOverflow.ellipsis,
        style: textStyle ??
            TextFontStyle.textStyle16PoppinsW500
                .copyWith(color: AppColors.cFFFFFF),
      ),
    ),
  );
}