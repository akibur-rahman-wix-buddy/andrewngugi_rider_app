import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUserProfileTextField extends StatelessWidget {
  const CustomUserProfileTextField({super.key, required this.title, required this.hintText, required this.wight, this.enable,  this.controller, });
  final String title;
  final String hintText;
  final double wight;
  final bool? enable;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(title,style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: Colors.black.withOpacity(.6)),),
        UIHelper.verticalSpace(8.h),
        Container(
          height:55.h ,
          width: wight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                  width: 2,
                  color: Colors.black.withOpacity(0.2)
              )

          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  enabled: enable ?? true,
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextFontStyle.textStyle14PoppinsW500.copyWith(
                      color: Colors.black
                  )),
            ),
          ),
        ),
      ],
    );
  }
}