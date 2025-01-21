import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../assets_helper/app_font/app_font.dart';
import '../gen/colors.gen.dart';

// A StatefulWidget for a password input field with toggleable visibility.
class PassTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController controller;
  final bool isSufixIcon;
  final bool isenabled;
  final Color? textColor;
  final bool isObsecure;
  final double? fieldHeight;
  final double? fieldWidth;

  const PassTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.textColor = AppColors.c919293,
    this.isSufixIcon = true,
    this.isenabled = true,
    this.isObsecure = true,
    this.fieldHeight,
    this.fieldWidth,
  });

  @override
  _PassTextFieldState createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  late bool _isObsecure;

  @override
  void initState() {
    super.initState();
    _isObsecure = widget.isObsecure;
  }

  void _toggleObsecureText() {
    setState(() {
      _isObsecure = !_isObsecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.fieldWidth ?? double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: TextFormField(
          controller: widget.controller,
          obscureText: _isObsecure,
          enabled: widget.isenabled,
          style: TextStyle(color: widget.textColor),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            labelStyle: TextFontStyle.textStyle16PoppinsW400,
            suffixIcon: widget.isSufixIcon
                ? GestureDetector(
              onTap: _toggleObsecureText,
              child: Icon(
                _isObsecure
                    ? Icons.visibility_off
                    : Icons.visibility, // Dynamically change icon
                color: AppColors.cCFCFCF,
              ),
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
