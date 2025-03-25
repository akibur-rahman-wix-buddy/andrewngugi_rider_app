import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/common_widgets/pass_text_field.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:andrewngugi_rider_app/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';



class DriverSignInScreen extends StatefulWidget {
  const DriverSignInScreen({super.key});

  @override
  State<DriverSignInScreen> createState() => _DriverSignInScreenState();
}

class _DriverSignInScreenState extends State<DriverSignInScreen> {
  bool isLoading = false;
  TextEditingController phoneController = TextEditingController();
  final TextEditingController countryNumberCode = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.bgImage))),
      child: SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(
              title: "Sign In", isCenterd: true, leadingIconUnVisible: true),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
                  child: Column(
                    children: [
                      Center(
                          child: Image.asset(
                        AppImages.appLogo,
                        height: 60.h,
                        width: 100.w,
                      )),
                      UIHelper.verticalSpace(56.h),
              Row(
                children: [
                  Expanded(
                    child: IntlPhoneField(
                      controller: phoneController,
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
                        phoneNumber.text  =  countryNumberCode.text + phoneController.text;
                      },
                    ),
                  ),
                ],
              ),
                      UIHelper.verticalSpace(10.h),
                      PassTextField(

                        controller: passwordController,
                        hintText: 'Enter Your Password',
                        isSufixIcon: true,
                        isObsecure: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Text( "Forgot Password?",style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: AppColor.buttonColor,decoration: TextDecoration.underline ), )
                        ],
                      ),
                      UIHelper.verticalSpace(50.h),
                      isLoading?Container(
                        height: 60.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.w,
                                color: AppColor.buttonColor
                            ),
                            borderRadius: BorderRadius.circular(10.r)
                        ),

                        child: Center(
                          child: Lottie.asset(
                            'assets/lottie/loading.json',  // Replace with the path to your Lottie file
                            width: 100,  // Adjust the width of the animation
                            height: 100, // Adjust the height of the animation
                            fit: BoxFit.cover,  // Optional: fit the animation
                          ),
                        ),
                      ): customButton(name: "Sign In", onCallBack: () async{
                        setState(() {
                          isLoading=true;
                        });
                        bool success = await signInRxObj.signIn(phone:phoneNumber.text , password: passwordController.text);
                        if(success){
                          // ToastUtil.showLongToast(" Sign in success");
                          NavigationService.navigateTo(Routes.driveNavigationScreen);
                          setState(() {
                            isLoading=false;
                          });
                        }else{
                          setState(() {
                            isLoading=false;
                          });



                        }


                      },color: AppColor.buttonColor,borderColor: Colors.transparent, context: context),
                    UIHelper.verticalSpace(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text("Don’t have an account?",style: TextFontStyle.textStyle14PoppinsW500),
                          UIHelper.horizontalSpace(10.w),
                          GestureDetector(
                              onTap: (){
                                NavigationService.navigateTo(Routes.driverSignUp);
                              },
                              child: Text("Sign Up",style: TextFontStyle.textStyle14PoppinsW500.copyWith(color: AppColor.buttonColor,decoration: TextDecoration.underline),))
                        ],
                      ),

                    ],
                  ))),
        ),
      ),
    );
  }
}
