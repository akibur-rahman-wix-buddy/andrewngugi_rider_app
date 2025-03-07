// import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
// import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
// import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
// import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
// import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
// import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
// import 'package:andrewngugi_rider_app/helpers/toast.dart';
// import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
//
// import '../../../helpers/all_routes.dart';
//
// class DriverSignUpScreen extends StatefulWidget {
//   const DriverSignUpScreen({super.key});
//
//   @override
//   State<DriverSignUpScreen> createState() => _DriverSignUpScreenState();
// }
//
// class _DriverSignUpScreenState extends State<DriverSignUpScreen> {
//   final TextEditingController _mobileController = TextEditingController();
//   final TextEditingController countryNumberCode = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//           image: DecorationImage(image: AssetImage(AppImages.bgImage))),
//       child: SafeArea(
//         child: Scaffold(
//           appBar: const CustomAppBar(
//               title: "Sign Up", isCenterd: true, leadingIconUnVisible: true),
//           backgroundColor: Colors.transparent,
//           body: SingleChildScrollView(
//               child: Padding(
//                   padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
//                   child: Column(
//                     children: [
//                       Center(
//                           child: Image.asset(
//                             AppImages.appLogo,
//                             height: 60.h,
//                             width: 100.w,
//                           )),
//                       UIHelper.verticalSpace(56.h),
//
//
//
//                       Text("Your phone number",style:TextFontStyle.headLine20PoppinsW600,),
//                       UIHelper.verticalSpace(10.h),
//                        SizedBox(
//                           width: 320.w,
//                           child: Text( textAlign: TextAlign.center,"Enter your number to get started. We’ll use this number to send updates about your LORI.",style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: Colors.black.withOpacity(.5)),)),
//                       UIHelper.verticalSpace(10.h),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: IntlPhoneField(
//                               controller: _mobileController,
//                               decoration: const InputDecoration(
//                                 border: OutlineInputBorder(),
//                               ),
//                               initialCountryCode: 'BD',
//                               validator: (value) {
//                                 if (value == null ) {
//                                   return 'Phone number is required';
//                                 }
//                                 return null;
//                               },
//                               onChanged: (phone) {
//                                 countryNumberCode.text = phone.countryCode;
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       UIHelper.verticalSpace(50.h),
//                       customButton(name: "Continue", onCallBack: (){
//                         if (_mobileController.text.isEmpty) {
//                           ToastUtil.showLongToast("Please enter your phone number.");
//                           setState(() {
//                             // isLoading = false;
//                           });
//                           return;
//                         }
//
//                         if (_formKey.currentState!.validate()){
//                           String phoneNumber = countryNumberCode.text + _mobileController.text;
//
//
//                           NavigationService.navigateToWithArgs(Routes.driverAreaSignUp,{
//
//                             "number":phoneNumber.toString(),
//                           });
//
//                         }
//
//
//                       },color: AppColor.buttonColor,borderColor: Colors.transparent, context: context),
//                                       ],
//                   ))),
//         ),
//       ),
//     );
//   }
// }


import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../helpers/all_routes.dart';

class DriverSignUpScreen extends StatefulWidget {
  const DriverSignUpScreen({super.key});

  @override
  State<DriverSignUpScreen> createState() => _DriverSignUpScreenState();
}

class _DriverSignUpScreenState extends State<DriverSignUpScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController countryNumberCode = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImages.bgImage)),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(
            title: "Sign Up",
            isCenterd: true,
            leadingIconUnVisible: true,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
              child: Form( // Wrap with Form widget
                key: _formKey,
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        AppImages.appLogo,
                        height: 60.h,
                        width: 100.w,
                      ),
                    ),
                    UIHelper.verticalSpace(56.h),
                    Text(
                      "Your phone number",
                      style: TextFontStyle.headLine20PoppinsW600,
                    ),
                    UIHelper.verticalSpace(10.h),
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Enter your number to get started. We’ll use this number to send updates about your LORI.",
                        style: TextFontStyle.textStyle14PoppinsW400.copyWith(
                          color: Colors.black.withOpacity(.5),
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace(10.h),
                    Row(
                      children: [
                        Expanded(
                          child: IntlPhoneField(
                            controller: _mobileController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            initialCountryCode: 'BD',
                            validator: (value) {
                              if (value == null || value.number.isEmpty) {
                                return 'Phone number is required';
                              }
                              return null;
                            },
                            onChanged: (phone) {
                              countryNumberCode.text = phone.countryCode;
                            },
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(50.h),
                    customButton(
                      name: "Continue",
                      onCallBack: () {
                        if (_mobileController.text.isEmpty) {
                          ToastUtil.showLongToast("Please enter your phone number.");
                          return;
                        }

                        if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                          String phoneNumber = countryNumberCode.text + _mobileController.text;
                          NavigationService.navigateToWithArgs(
                            Routes.driverAreaSignUp,
                            {"number": phoneNumber},
                          );
                        }
                      },
                      color: AppColor.buttonColor,
                      borderColor: Colors.transparent,
                      context: context,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
