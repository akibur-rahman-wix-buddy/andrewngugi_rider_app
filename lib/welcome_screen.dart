import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


final class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.allPrimaryColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bgImage),
            fit: BoxFit.cover,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        //decoration: const BoxDecoration(color: AppColors.allPrimaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40.h,
            ),
            Image.asset(
              AppImages.appLogo,
              height: 170.h,
              width: 170.w,
            ),
          ],
        ),
      ),
    );
  }
}
