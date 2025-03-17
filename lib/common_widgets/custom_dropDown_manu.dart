// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// //
// // import '../assets_helper/app_font/app_font.dart';
// // import '../gen/colors.gen.dart';
// //
// // // ignore: must_be_immutable
// // class CustomTextFormField extends StatefulWidget {
// //   String? hintText;
// //   final controller;
// //   final IconData? suffixIcon;
// //   bool isSufixIcon;
// //   bool isenabled;
// //   Color? textColor;
// //   bool isObsecure;
// //   double? fieldHeight;
// //   double? fieldWidth;
// //
// //   CustomTextFormField({
// //     required this.controller,
// //     required this.hintText,
// //     this.suffixIcon,
// //     this.textColor = AppColors.c919293,
// //     this.isSufixIcon = false,
// //     this.isenabled = true,
// //     this.isObsecure = false,
// //     this.fieldHeight,
// //     this.fieldWidth,
// //     super.key, required String? Function(dynamic value) validator,
// //   });
// //
// //   @override
// //   // ignore: library_private_types_in_public_api
// //   _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
// // }
// //
// // class _CustomTextFormFieldState extends State<CustomTextFormField> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //       width: widget.fieldWidth ?? double.infinity,
// //       child: Padding(
// //         padding: const EdgeInsets.all(1.0),
// //         child: TextFormField(
// //           controller: widget.controller,
// //           obscureText: widget.isObsecure,
// //           decoration: InputDecoration(
// //             filled: true,
// //             fillColor: Colors.transparent,
// //             labelStyle: TextFontStyle.textStyle16PoppinsW400,
// //             suffixIcon: widget.isSufixIcon == true
// //                 ? const Icon(
// //                     Icons.search,
// //                     color: AppColors.cCFCFCF,
// //                   )
// //                 : null,
// //             contentPadding:
// //                 EdgeInsets.symmetric(vertical: 18.h, horizontal: 15.w),
// //             hintText: widget.hintText,
// //             hintStyle: TextFontStyle.textStyle14PoppinsW400
// //                 .copyWith(color: AppColors.c5A5C5F),
// //             border: OutlineInputBorder(
// //               borderRadius: BorderRadius.all(Radius.circular(10.r)),
// //             ),
// //             enabledBorder: OutlineInputBorder(
// //               borderRadius: BorderRadius.all(Radius.circular(10.r)),
// //               borderSide: BorderSide(color: AppColors.cCFCFCF, width: 1.w),
// //             ),
// //             focusedBorder: OutlineInputBorder(
// //               borderRadius: BorderRadius.all(Radius.circular(10.r)),
// //               borderSide: BorderSide(color: AppColors.cCFCFCF, width: 1.w),
// //             ),
// //             disabledBorder: OutlineInputBorder(
// //               borderRadius: BorderRadius.all(Radius.circular(10.r)),
// //               borderSide: BorderSide(color: AppColors.cCFCFCF, width: 1.w),
// //             ),
// //             errorBorder: OutlineInputBorder(
// //               borderRadius: BorderRadius.all(Radius.circular(10.r)),
// //               borderSide: BorderSide(color: Colors.red, width: 1.w),
// //             ),
// //             focusedErrorBorder: OutlineInputBorder(
// //               borderRadius: BorderRadius.all(Radius.circular(6.r)),
// //               borderSide: BorderSide(color: Colors.red, width: 1.w),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../assets_helper/app_font/app_font.dart';
import '../gen/colors.gen.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  String? hintText;
  final controller;
  final IconData? suffixIcon;
  bool isSufixIcon;
  bool isenabled;
  Color? textColor;
  bool isObsecure;
  double? fieldHeight;
  double? fieldWidth;
  final String? Function(String?)? validator; // Added validator function

  CustomTextFormField({
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.textColor = AppColors.c919293,
    this.isSufixIcon = false,
    this.isenabled = true,
    this.isObsecure = false,
    this.fieldHeight,
    this.fieldWidth,
    this.validator, // Validator function is passed in the constructor
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.fieldWidth ?? double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: TextFormField(
          // textInputAction: numner,
          controller: widget.controller,
          obscureText: widget.isObsecure,
          validator: widget.validator, // Added validator to the TextFormField
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            labelStyle: TextFontStyle.textStyle16PoppinsW400,
            suffixIcon: widget.isSufixIcon == true
                ? const Icon(
              Icons.search,
              color: AppColors.cCFCFCF,
            )
                : null,
            contentPadding:
            EdgeInsets.symmetric(vertical: 18.h, horizontal: 15.w),
            hintText: widget.hintText,
            hintStyle: TextFontStyle.textStyle14PoppinsW400
                .copyWith(color: AppColors.c5A5C5F),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(color: AppColors.cCFCFCF, width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(color: AppColors.cCFCFCF, width: 1.w),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(color: AppColors.cCFCFCF, width: 1.w),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(color: Colors.red, width: 1.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
              borderSide: BorderSide(color: Colors.red, width: 1.w),
            ),
          ),
        ),
      ),
    );
  }
}







// ignore: must_be_immutable
class CustomDropdownFormField extends StatefulWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final ValueChanged<String?> onChanged;
  final String? value;
  final List<String> items; // List of items for the dropdown
  final bool isEnabled;
  final double? fieldHeight;
  final double? fieldWidth;

  CustomDropdownFormField({
    required this.onChanged,
    required this.items,
    this.hintText,
    this.value,
    this.validator,
    this.isEnabled = true,
    this.fieldHeight,
    this.fieldWidth,
    super.key,
  });

  @override
  _CustomDropdownFormFieldState createState() =>
      _CustomDropdownFormFieldState();
}

class _CustomDropdownFormFieldState extends State<CustomDropdownFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.fieldWidth ?? double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: DropdownButtonFormField<String>(
          value: widget.value,
          onChanged: widget.isEnabled ? widget.onChanged : null,
          validator: widget.validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            labelStyle: TextFontStyle.textStyle16PoppinsW400,
            contentPadding:
            EdgeInsets.symmetric(vertical: 18.h, horizontal: 15.w),
            hintText: widget.hintText,
            hintStyle: TextFontStyle.textStyle14PoppinsW400
                .copyWith(color: AppColors.c5A5C5F),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(color: AppColors.cCFCFCF, width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(color: AppColors.cCFCFCF, width: 1.w),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(color: AppColors.cCFCFCF, width: 1.w),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(color: Colors.red, width: 1.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
              borderSide: BorderSide(color: Colors.red, width: 1.w),
            ),
          ),
          items: widget.items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}


