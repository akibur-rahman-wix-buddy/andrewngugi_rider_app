// import 'dart:io';
import 'dart:io';
import 'dart:math';

import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_dropDown_manu.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/controller/AppController.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../assets_helper/app_icons/app_icons.dart';
import '../widget/custom_userProfile_text_field.dart';
//
// // class DriverSignUpForm extends StatefulWidget {
// //   const DriverSignUpForm({super.key, required this.vehicleId, required this.area});
// //   final int vehicleId;
// //   final String area;
// //
// //
// //   @override
// //   State<DriverSignUpForm> createState() => _DriverSignUpFormState();
// // }
// //
// // class _DriverSignUpFormState extends State<DriverSignUpForm> {
// //  AppController controller =Get.put(AppController());
// //
// //   Future<void> _selectDate(BuildContext context) async {
// //     DateTime? pickedDate = await showDatePicker(
// //       context: context,
// //       initialDate: DateTime.now(),
// //       firstDate: DateTime(1900),
// //       lastDate: DateTime.now(),
// //     );
// //
// //     if (pickedDate != null) {
// //       String formattedDate = DateFormat('MM/dd/yyyy').format(pickedDate);
// //       setState(() {
// //         controller.dateOfBirthController.text = formattedDate; // Set text field value
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: const BoxDecoration(
// //           image: DecorationImage(image: AssetImage(AppImages.bgImage))),
// //       child: SafeArea(
// //         child: Scaffold(
// //           appBar: const CustomAppBar(
// //               title: "Sign Up", isCenterd: true, leadingIconUnVisible: true),
// //           backgroundColor: Colors.transparent,
// //           body: SingleChildScrollView(
// //               child: Padding(
// //                   padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
// //                   child:Column(
// //                     children: [
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           // Step 1 (Completed)
// //                           const Column(
// //                             mainAxisSize: MainAxisSize.min,
// //                             children: [
// //                               CircleAvatar(
// //                                 radius: 21, // Adjust size
// //                                 backgroundImage: AssetImage(AppImages.rightClick),
// //                                 child: Icon(
// //                                   Icons.check,
// //                                   color: Colors.white,
// //                                 ),
// //                               ),
// //                               SizedBox(height: 4),
// //                             ],
// //                           ),
// //                           // Dashed line between Step 1 and Step 2
// //                           SizedBox(
// //                             width: 40,
// //                             child: Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: List.generate(
// //                                 8, // Number of dashes
// //                                     (index) => Container(
// //                                   width: 4, // Width of each dash
// //                                   height: 1, // Height of each dash
// //                                   color: Colors.black,
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                           // Step 2 (Inactive)
// //                           const CircleAvatar(
// //                             radius: 20, // Adjust size
// //                             backgroundColor: Colors.black,
// //                             child: Text(
// //                               '2',
// //                               style: TextStyle(
// //                                 color: Colors.white,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                           ),
// //                           // Dashed line between Step 2 and Step 3
// //                           SizedBox(
// //                             width: 40,
// //                             child: Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: List.generate(
// //                                 8, // Number of dashes
// //                                     (index) => Container(
// //                                   width: 4, // Width of each dash
// //                                   height: 1, // Height of each dash
// //                                   color: Colors.black,
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                           // Step 3 (Inactive)
// //                           const CircleAvatar(
// //                             radius: 20, // Adjust size
// //                             backgroundColor: Colors.black,
// //                             child: Text(
// //                               '3',
// //                               style: TextStyle(
// //                                 color: Colors.white,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       UIHelper.verticalSpace(16.h),
// //                       Container(
// //                         padding: EdgeInsets.all(10.sp),
// //                         width: double.infinity,
// //                         decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(20.r),
// //                           color: Colors.white,
// //                           boxShadow: [
// //                             BoxShadow(
// //                               color: Colors.black12,
// //                               blurRadius: 10.sp,
// //                               spreadRadius: 04
// //                             )
// //                           ]
// //
// //                         ),
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text("Personal Information",style: TextFontStyle.textStyle16PoppinsW600,), UIHelper.verticalSpace(16.h),
// //
// //
// //
// //                             ///>>>>>>>>>>>>>>>>>>>> profile image >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //                             const UserProfileImagePicker(),
// //                             UIHelper.verticalSpace(16.h),
// //
// //                             ///>>>>>>>>>>>>>>>>>>>> Full Name image >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //                             CustomUserprofileTextField(
// //                               controller: controller.fullNameController,
// //
// //                               wight:double.infinity,
// //                               title: "Full Name (Same as NID/License)*",
// //                               hintText: "Enter your full name",
// //                             ),
// //                             UIHelper.verticalSpace(16.h),
// //                             ///>>>>>>>>>>>>>>>>>>>> Email address >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //                              CustomUserprofileTextField(
// //                                controller: controller.emailController,
// //                               wight:double.infinity,
// //                               title: "Email Address",
// //                               hintText: "Enter your email address",
// //                             ),
// //                             UIHelper.verticalSpace(16.h),
// //                             ///>>>>>>>>>>>>>>>>>>>> Address >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //                              CustomUserprofileTextField(
// //                                controller:controller.addressController,
// //                               wight:double.infinity,
// //                               title: "Address",
// //                               hintText: "Enter your address",
// //                             ),
// //                             UIHelper.verticalSpace(16.h),
// //
// //                             ///>>>>>>>>>>>>>>>>>>>> NID number  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //
// //                              CustomUserprofileTextField(
// //                                controller: controller.nidController,
// //                               wight:double.infinity,
// //                               title: "NID Number*",
// //                               hintText: "Enter your NID number",
// //                             ),
// //                             UIHelper.verticalSpace(16.h),
// //                             ///>>>>>>>>>>>>>>>>>>>> Gender >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //                             Text(
// //                               'Gender',
// //                               style: TextFontStyle.textStyle14PoppinsW700.copyWith(fontWeight: FontWeight.w400),
// //                             ),
// //                             UIHelper.verticalSpace(8.h),
// //                             CustomDropdownFormField(
// //                               hintText: 'Select your gender',
// //                               value: controller.selectedGender, // Current selected gender
// //                               onChanged: (newValue) {
// //                                 setState(() {
// //                                   controller.selectedGender = newValue; // Update selected gender
// //                                 });
// //                                 print("Selected gender: ${controller.selectedGender}"); // Print after update
// //                               },
// //                               items: ['male', 'female', 'other'], // Dropdown items
// //                               validator: (value) {
// //                                 if (value == null || value.isEmpty) {
// //                                   return 'Gender is required';
// //                                 }
// //                                 return null;
// //                               },
// //                             ),
// //
// //                             UIHelper.verticalSpace(16.h),
// //                             ///>>>>>>>>>>>>>>>>>>>> Date of birth  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //                         GestureDetector(
// //                           onTap: () {
// //                             _selectDate(context);
// //                           } ,
// //                           child: AbsorbPointer( // Prevents manual text input
// //                             child: CustomUserprofileTextField(
// //                               controller: controller.dateOfBirthController,
// //                               wight: double.infinity,
// //                               title: "Date Of Birth",
// //                               hintText: "MM/DD/YYYY",
// //                             ),
// //                           ),
// //                         ),
// //                             UIHelper.verticalSpace(16.h),
// //                             customButton(name: "Continue", onCallBack: (){
// //                               print(">>>>>>>>>>>>>>>>>>>>>>>>>name${controller.fullNameController.text}");
// //                               print(">>>>>>>>>>>>>>>>>>>>>>>>>email${controller.emailController.text}");
// //                               print(">>>>>>>>>>>>>>>>>>>>>>>>>address${controller.addressController.text}");
// //                               print(">>>>>>>>>>>>>>>>>>>>>>>>>Nid number${controller.nidController.text}");
// //                               print(">>>>>>>>>>>>>>>>>>>>>>>>>gender${controller.selectedGender}");
// //                               print(">>>>>>>>>>>>>>>>>>>>>>>>>date of birth${controller.dateOfBirthController.text}");
// //                               print(">>>>>>>>>>>>>>>>>>>>>>>>>image path${controller.selectedImage!.path}");
// //
// //                               NavigationService.navigateTo(Routes.driveSignUpFrom2);
// //                             },borderColor: Colors.transparent,color: AppColor.buttonColor, context: context)
// //
// //                           ],
// //                         ),
// //                       )
// //                     ],
// //                   )
// //
// //               )),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// //
// //
// //
// //
// class UserProfileImagePicker extends StatefulWidget {
//   const UserProfileImagePicker({super.key});
//
//   @override
//   _UserProfileImagePickerState createState() => _UserProfileImagePickerState();
// }
//
// class _UserProfileImagePickerState extends State<UserProfileImagePicker> {
//   AppController controller =Get.put(AppController());
//
//
//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(
//       source: ImageSource.gallery, // You can switch to ImageSource.camera if needed
//       maxHeight: 180,
//       maxWidth: 180,
//       imageQuality: 80,
//     );
//
//     if (pickedFile != null) {
//       setState(() {
//         controller.selectedImage = pickedFile; // Store the picked image as XFile
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         CircleAvatar(
//           radius: 55,
//           backgroundImage: controller.selectedImage != null
//               ? FileImage(File(controller.selectedImage!.path)) // You need to use FileImage for displaying the image
//               : const AssetImage(AppImages.profile), // Default profile image
//         ),
//         Positioned(
//           bottom: 8,
//           right: 8,
//           child: GestureDetector(
//             onTap: _pickImage,
//             child: Container(
//               padding: EdgeInsets.all(1.sp),
//               height: 30,
//               width: 30,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: AppColor.buttonColor,
//                   width: 1.w,
//                 ),
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: SvgPicture.asset(AppIcons.camera), // Camera icon for image selection
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
//
//
// class DriverSignUpForm extends StatefulWidget {
//   const DriverSignUpForm({super.key, required this.vehicleId, required this.area});
//   final int vehicleId;
//   final String area;
//
//   @override
//   State<DriverSignUpForm> createState() => _DriverSignUpFormState();
// }
//
// class _DriverSignUpFormState extends State<DriverSignUpForm> {
//   AppController controller = Get.put(AppController());
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form Key to manage validation
//
//   Future<void> _selectDate(BuildContext context) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//
//     if (pickedDate != null) {
//       String formattedDate = DateFormat('MM/dd/yyyy').format(pickedDate);
//       setState(() {
//         controller.dateOfBirthController.text = formattedDate; // Set text field value
//       });
//     }
//   }
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
//             child: Padding(
//               padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
//               child: Form(
//                 key: _formKey, // Attach form key to Form
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // Step 1 (Completed)
//                         const Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             CircleAvatar(
//                               radius: 21, // Adjust size
//                               backgroundImage: AssetImage(AppImages.rightClick),
//                               child: Icon(
//                                 Icons.check,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                           ],
//                         ),
//                         // Dashed line between Step 1 and Step 2
//                         SizedBox(
//                           width: 40,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: List.generate(
//                               8, // Number of dashes
//                                   (index) => Container(
//                                 width: 4, // Width of each dash
//                                 height: 1, // Height of each dash
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ),
//                         // Step 2 (Inactive)
//                         const CircleAvatar(
//                           radius: 20, // Adjust size
//                           backgroundColor: Colors.black,
//                           child: Text(
//                             '2',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         // Dashed line between Step 2 and Step 3
//                         SizedBox(
//                           width: 40,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: List.generate(
//                               8, // Number of dashes
//                                   (index) => Container(
//                                 width: 4, // Width of each dash
//                                 height: 1, // Height of each dash
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ),
//                         // Step 3 (Inactive)
//                         const CircleAvatar(
//                           radius: 20, // Adjust size
//                           backgroundColor: Colors.black,
//                           child: Text(
//                             '3',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     UIHelper.verticalSpace(16.h),
//                     Container(
//                       padding: EdgeInsets.all(10.sp),
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.r),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 10.sp,
//                               spreadRadius: 04)
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Personal Information", style: TextFontStyle.textStyle16PoppinsW600),
//                           UIHelper.verticalSpace(16.h),
//
//                           ///>>>>>>>>>>>>>>>>>>>> profile image >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//                           const UserProfileImagePicker(),
//                           UIHelper.verticalSpace(16.h),
//
//                           // Full Name Field with Validation outside
//                           CustomUserprofileTextField(
//                             controller: controller.fullNameController,
//                             wight: double.infinity,
//                             title: "Full Name (Same as NID/License)*",
//                             hintText: "Enter your full name",
//                           ),
//                           // Display Validation Error (if any) for Full Name
//                           _buildErrorMessage(controller.fullNameController),
//
//                           UIHelper.verticalSpace(16.h),
//
//                           // Email Address Field with Validation outside
//                           CustomUserprofileTextField(
//                             controller: controller.emailController,
//                             wight: double.infinity,
//                             title: "Email Address",
//                             hintText: "Enter your email address",
//                           ),
//                           // Display Validation Error (if any) for Email Address
//                           _buildErrorMessage(controller.emailController),
//
//                           UIHelper.verticalSpace(16.h),
//
//                           // Address Field with Validation outside
//                           CustomUserprofileTextField(
//                             controller: controller.addressController,
//                             wight: double.infinity,
//                             title: "Address",
//                             hintText: "Enter your address",
//                           ),
//                           // Display Validation Error (if any) for Address
//                           _buildErrorMessage(controller.addressController),
//
//                           UIHelper.verticalSpace(16.h),
//
//                           // NID Number Field with Validation outside
//                           CustomUserprofileTextField(
//                             controller: controller.nidController,
//                             wight: double.infinity,
//                             title: "NID Number*",
//                             hintText: "Enter your NID number",
//                           ),
//                           // Display Validation Error (if any) for NID Number
//                           _buildErrorMessage(controller.nidController),
//
//                           UIHelper.verticalSpace(16.h),
//
//                           // Gender Field
//                           Text(
//                             'Gender',
//                             style: TextFontStyle.textStyle14PoppinsW700.copyWith(fontWeight: FontWeight.w400),
//                           ),
//                           UIHelper.verticalSpace(8.h),
//                           CustomDropdownFormField(
//                             hintText: 'Select your gender',
//                             value: controller.selectedGender, // Current selected gender
//                             onChanged: (newValue) {
//                               setState(() {
//                                 controller.selectedGender = newValue; // Update selected gender
//                               });
//                             },
//                             items: ['male', 'female', 'other'], // Dropdown items
//                           ),
//                           UIHelper.verticalSpace(16.h),
//
//                           // Date of Birth Field
//                           GestureDetector(
//                             onTap: () {
//                               _selectDate(context);
//                             },
//                             child: AbsorbPointer(
//                               child: CustomUserprofileTextField(
//                                 controller: controller.dateOfBirthController,
//                                 wight: double.infinity,
//                                 title: "Date Of Birth",
//                                 hintText: "MM/DD/YYYY",
//                               ),
//                             ),
//                           ),
//                           UIHelper.verticalSpace(16.h),
//
//                           customButton(
//                             name: "Continue",
//                             onCallBack: () {
//                               if (_formKey.currentState?.validate() ?? false) {
//                                 // Validate all form fields
//                                 if (controller.selectedImage == null) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(content: Text('Profile image is required')),
//                                   );
//                                   return;
//                                 }
//                                 _buildErrorMessage(BuildContext context);
//
//                                 // All fields are valid, proceed
//                                 print(">>>>>>>>>>>>>>>>>>>>>>>>>name${controller.fullNameController.text}");
//                                 print(">>>>>>>>>>>>>>>>>>>>>>>>>email${controller.emailController.text}");
//                                 print(">>>>>>>>>>>>>>>>>>>>>>>>>address${controller.addressController.text}");
//                                 print(">>>>>>>>>>>>>>>>>>>>>>>>>Nid number${controller.nidController.text}");
//                                 print(">>>>>>>>>>>>>>>>>>>>>>>>>gender${controller.selectedGender}");
//                                 print(">>>>>>>>>>>>>>>>>>>>>>>>>date of birth${controller.dateOfBirthController.text}");
//                                 print(">>>>>>>>>>>>>>>>>>>>>>>>>image path${controller.selectedImage!.path}");
//
//                                 NavigationService.navigateTo(Routes.driveSignUpFrom2);
//                               }
//                             },
//                             borderColor: Colors.transparent,
//                             color: AppColor.buttonColor,
//                             context: context,
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
// // Method to display validation error message for each field
//   Widget _buildErrorMessage(TextEditingController controller) {
//     if (controller.text.isEmpty|| controller.text==null) {
//       return Text(
//         'This field is required.',
//         style: TextStyle(color: Colors.red, fontSize: 12.sp),
//       );
//     }
//     return SizedBox.shrink(); // No error message
//   }
//
//
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import '../widget/custom_userProfile_text_field.dart';

class DriverSignUpForm extends StatefulWidget {
  const DriverSignUpForm({super.key, required this.vehicleId, required this.area});
  final int vehicleId;
  final String area;

  @override
  State<DriverSignUpForm> createState() => _DriverSignUpFormState();
}

class _DriverSignUpFormState extends State<DriverSignUpForm> {
  late AppController controller;
  final Map<String, String?> _errors = {}; // Stores validation errors

  @override
  void initState() {
    super.initState();
    controller = Get.put(AppController());
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      // Change format to YYYY-MM-DD
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      setState(() {
        controller.dateOfBirthController.text = formattedDate;
        _errors.remove("dob"); // Clear error if selected
      });
    }
  }


  void _validateForm() {
    setState(() {
      _errors.clear();

      // Validate Full Name
      if (controller.firstNameController.text.isEmpty) {
        _errors["firstName"] = "first Name is required.";
      }
      if (controller.lastNameController.text.isEmpty) {
        _errors["lastName"] = "Last Name is required.";
      }

      // Validate Email
      if (controller.emailController.text.isEmpty) {
        _errors["email"] = "Email is required.";
      } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
          .hasMatch(controller.emailController.text)) {
        _errors["email"] = "Enter a valid email.";
      }

      // Validate Address
      if (controller.addressController.text.isEmpty) {
        _errors["address"] = "Address is required.";
      }

      // Validate NID Number
      if (controller.nidController.text.isEmpty) {
        _errors["nid"] = "NID Number is required.";
      }

      // Validate Gender Selection
      if (controller.selectedGender == null) {
        _errors["gender"] = "Please select your gender.";
      }

      // Validate Date of Birth
      if (controller.dateOfBirthController.text.isEmpty) {
        _errors["dob"] = "Date of Birth is required.";
      }

      // Validate Profile Image
      if (controller.avatar == null) {
        _errors["image"] = "Profile image is required.";
      }
    });

    // If no errors, proceed to next screen
    if (_errors.isEmpty) {
      print("Form is valid! Proceeding to next step...");
      NavigationService.navigateTo(Routes.driveSignUpFrom2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Sign Up", isCenterd: true, leadingIconUnVisible: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserProfileImagePicker(),
            if (_errors.containsKey("image")) _buildErrorMessage(_errors["image"]!),

            UIHelper.verticalSpace(16),

            // Full Name Field
            CustomUserprofileTextField(
              wight: double.infinity,
              controller: controller.firstNameController,
              title: "First Name (Same as NID/License)*",
              hintText: "Enter your full name",
            ),
            if (_errors.containsKey("firstName")) _buildErrorMessage(_errors["firstName"]!),

            UIHelper.verticalSpace(16),

            CustomUserprofileTextField(
              wight: double.infinity,
              controller: controller.lastNameController,
              title: "Lasat Name (Same as NID/License)*",
              hintText: "Enter your last name",
            ),
            if (_errors.containsKey("lastName")) _buildErrorMessage(_errors["lastName"]!),

            UIHelper.verticalSpace(16),

            // Email Field
            CustomUserprofileTextField(
              wight: double.infinity,
              controller: controller.emailController,
              title: "Email Address",
              hintText: "Enter your email address",
            ),
            if (_errors.containsKey("email")) _buildErrorMessage(_errors["email"]!),

            UIHelper.verticalSpace(16),

            // Address Field
            CustomUserprofileTextField(
              wight: double.infinity,
              controller: controller.addressController,
              title: "Address",
              hintText: "Enter your address",
            ),
            if (_errors.containsKey("address")) _buildErrorMessage(_errors["address"]!),

            UIHelper.verticalSpace(16),

            // NID Number Field
            CustomUserprofileTextField(
              wight: double.infinity,
              controller: controller.nidController,
              title: "NID Number*",
              hintText: "Enter your NID number",
            ),
            if (_errors.containsKey("nid")) _buildErrorMessage(_errors["nid"]!),

            UIHelper.verticalSpace(16),

            Text('Gender', style: TextStyle(fontWeight: FontWeight.w600)),
            UIHelper.verticalSpace(8.h),
            CustomDropdownFormField(
              hintText: 'Select your gender',
              value: controller.selectedGender,
              onChanged: (newValue) {
                setState(() {
                  controller.selectedGender = newValue;
                });
              },
              items: ['male', 'female', 'other'],
            ),
            if (_errors.containsKey("gender")) _buildErrorMessage(_errors["gender"]!),

            UIHelper.verticalSpace(16),

            // Date of Birth
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: CustomUserprofileTextField(
                  wight: double.infinity,
                  controller: controller.dateOfBirthController,
                  title: "Date Of Birth",
                  hintText: "MM/DD/YYYY",
                ),
              ),
            ),
            if (_errors.containsKey("dob")) _buildErrorMessage(_errors["dob"]!),

            UIHelper.verticalSpace(16),

            // Submit Button
            customButton(
              name: "Continue",
              onCallBack: (){
                _validateForm();
                                print(">>>>>>>>>>>>>>>>>>>>>>>>>email${controller.emailController.text}");
                                print(">>>>>>>>>>>>>>>>>>>>>>>>>address${controller.addressController.text}");
                                print(">>>>>>>>>>>>>>>>>>>>>>>>>Nid number${controller.nidController.text}");
                                print(">>>>>>>>>>>>>>>>>>>>>>>>>gender${controller.selectedGender}");
                                print(">>>>>>>>>>>>>>>>>>>>>>>>>date of birth${controller.dateOfBirthController.text}");
                                print(">>>>>>>>>>>>>>>>>>>>>>>>>image path${controller.avatar!.path}");
//
              },
              borderColor: Colors.transparent,
              color: AppColor.buttonColor,
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorMessage(String message) {
    return Padding(
      padding: EdgeInsets.only(top: 4),
      child: Text(
        message,
        style: TextStyle(color: Colors.red, fontSize: 12),
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
  AppController controller =Get.put(AppController());


  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery, // You can switch to ImageSource.camera if needed
      maxHeight: 180,
      maxWidth: 180,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        controller.avatar = pickedFile; // Store the picked image as XFile
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundImage: controller.avatar != null
              ? FileImage(File(controller.avatar!.path)) // You need to use FileImage for displaying the image
              : const AssetImage(AppImages.profile), // Default profile image
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
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.buttonColor,
                  width: 1.w,
                ),
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(AppIcons.camera), // Camera icon for image selection
              ),
            ),
          ),
        ),
      ],
    );
  }
}