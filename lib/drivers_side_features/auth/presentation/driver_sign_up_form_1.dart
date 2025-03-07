import 'dart:io';

import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../../assets_helper/app_icons/app_icons.dart';
import '../widget/custom_userProfile_text_field.dart';

class DriverSignUpForm extends StatefulWidget {
  const DriverSignUpForm({super.key});

  @override
  State<DriverSignUpForm> createState() => _DriverSignUpFormState();
}

class _DriverSignUpFormState extends State<DriverSignUpForm> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nidController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.bgImage))),
      child: SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(
              title: "Sign Up", isCenterd: true, leadingIconUnVisible: true),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
                  child:Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Step 1 (Completed)
                          const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 21, // Adjust size
                                backgroundImage: AssetImage(AppImages.rightClick),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4),
                            ],
                          ),
                          // Dashed line between Step 1 and Step 2
                          SizedBox(
                            width: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                8, // Number of dashes
                                    (index) => Container(
                                  width: 4, // Width of each dash
                                  height: 1, // Height of each dash
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          // Step 2 (Inactive)
                          const CircleAvatar(
                            radius: 20, // Adjust size
                            backgroundColor: Colors.black,
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // Dashed line between Step 2 and Step 3
                          SizedBox(
                            width: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                8, // Number of dashes
                                    (index) => Container(
                                  width: 4, // Width of each dash
                                  height: 1, // Height of each dash
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          // Step 3 (Inactive)
                          const CircleAvatar(
                            radius: 20, // Adjust size
                            backgroundColor: Colors.black,
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpace(16.h),
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.sp,
                              spreadRadius: 04
                            )
                          ]

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Personal Information",style: TextFontStyle.textStyle16PoppinsW600,), UIHelper.verticalSpace(16.h),



                            ///>>>>>>>>>>>>>>>>>>>> profile image >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                            const UserProfileImagePicker(),
                            UIHelper.verticalSpace(16.h),

                            ///>>>>>>>>>>>>>>>>>>>> Full Name image >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                            CustomUserprofileTextField(
                              controller: fullNameController,

                              wight:double.infinity,
                              title: "Full Name (Same as NID/License)*",
                              hintText: "Enter your full name",
                            ),
                            UIHelper.verticalSpace(16.h),
                            ///>>>>>>>>>>>>>>>>>>>> Email address >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                             CustomUserprofileTextField(
                               controller: emailController,
                              wight:double.infinity,
                              title: "Email Address",
                              hintText: "Enter your email address",
                            ),
                            UIHelper.verticalSpace(16.h),
                            ///>>>>>>>>>>>>>>>>>>>> Address >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                             CustomUserprofileTextField(
                               controller:addressController,
                              wight:double.infinity,
                              title: "Address",
                              hintText: "Enter your address",
                            ),
                            UIHelper.verticalSpace(16.h),

                            ///>>>>>>>>>>>>>>>>>>>> NID number  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

                             CustomUserprofileTextField(
                               controller: nidController,
                              wight:double.infinity,
                              title: "NID Number*",
                              hintText: "Enter your NID number",
                            ),
                            UIHelper.verticalSpace(16.h),
                            ///>>>>>>>>>>>>>>>>>>>> Gender >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                             CustomUserprofileTextField(
                               controller: genderController,
                              wight:double.infinity,
                              title: "Gender",
                              hintText: "Select your gender",
                            ),
                            UIHelper.verticalSpace(16.h),
                            ///>>>>>>>>>>>>>>>>>>>> Date of birth  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                             CustomUserprofileTextField(
                               controller: dateOfBirthController,
                              wight:double.infinity,
                              title: "Date Of Birth",
                              hintText: "M M / D D / Y Y Y Y",
                            ),
                            UIHelper.verticalSpace(16.h),
                            customButton(name: "Continue", onCallBack: (){

                              NavigationService.navigateTo(Routes.driveSignUpFrom2);
                            },borderColor: Colors.transparent,color: AppColor.buttonColor, context: context)

                          ],
                        ),
                      )
                    ],
                  )

              )),
        ),
      ),
    );
  }
}






class UserProfileImagePicker extends StatefulWidget {
  const UserProfileImagePicker({super.key});

  @override
  _UserProfileImagePickerState createState() => _UserProfileImagePickerState();
}

class _UserProfileImagePickerState extends State<UserProfileImagePicker> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery, // Use ImageSource.camera for camera
      maxHeight: 180,
      maxWidth: 180,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundImage: _selectedImage != null
              ? FileImage(_selectedImage!) as ImageProvider
              : const AssetImage(AppImages.profile), // Replace with AppImages.profile
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: GestureDetector(
            onTap: _pickImage,
            child: Container(
              padding: EdgeInsets.all(1.sp),
              height: 30,
              width: 30,
              decoration:  BoxDecoration(
                border: Border.all(
                  color: AppColor.buttonColor,
                  width: 1.w
                ),
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(AppIcons.camera), // Replace with AppIcons.editIcon2
              ),
            ),
          ),
        ),
      ],
    );
  }
}
