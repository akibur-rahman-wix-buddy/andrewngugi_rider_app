import 'dart:developer';
import 'dart:io';

import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/widget/driver_sign_updrop_down.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/controller/AppController.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import '../../edit_profile/presentation/widgets/pin_code_fields.dart';
import '../widget/custom_userProfile_text_field.dart';
import '../widget/second_sign_up_image_picker.dart';
// //
// // class DriveSignUpFrom2 extends StatefulWidget {
// //   const DriveSignUpFrom2({super.key});
// //
// //   @override
// //   State<DriveSignUpFrom2> createState() => _DriveSignUpFrom2State();
// // }
// //
// // class _DriveSignUpFrom2State extends State<DriveSignUpFrom2> {
// //   AppController controller =Get.put(AppController());
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
// //                   child: Column(
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
// //                                 backgroundImage:
// //                                     AssetImage(AppImages.rightClick),
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
// //                                 (index) => Container(
// //                                   width: 4, // Width of each dash
// //                                   height: 1, // Height of each dash
// //                                   color: Colors.black,
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                           // Step 2 (Inactive)
// //                           const CircleAvatar(
// //                             radius: 21, // Adjust size
// //                             backgroundImage: AssetImage(AppImages.rightClick),
// //                             child: Icon(
// //                               Icons.check,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                           // Dashed line between Step 2 and Step 3
// //                           SizedBox(
// //                             width: 40,
// //                             child: Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: List.generate(
// //                                 8, // Number of dashes
// //                                 (index) => Container(
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
// //                             borderRadius: BorderRadius.circular(20.r),
// //                             color: Colors.white,
// //                             boxShadow: [
// //                               BoxShadow(
// //                                   color: Colors.black.withOpacity(.1),
// //                                   blurRadius: 10.sp,
// //                                   spreadRadius: .4)
// //                             ]),
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               "Vehicle Information",
// //                               style: TextFontStyle.textStyle16PoppinsW600,
// //                             ),
// //                             UIHelper.verticalSpace(16.h),
// //
// //                             ///>>>>>>>>>>>>>>>>>>>> profile image >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //                             const SecondSignUpImagePicker(),
// //                             UIHelper.verticalSpace(16.h),
// //
// //                             ///>>>>>>>>>>>>>>>>>>>> Vehicle Type >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //                             // DropdownButtonExample(
// //                             //   controller: controller.vehicleTypeController,
// //                             //   title: 'Vehicle Type*',
// //                             //   list: const ["Option 1", "Option 2", "Option 3"],
// //                             // ),
// //                             // UIHelper.verticalSpace(16.h),
// //
// //                             ///>>>>>>>>>>>>>>>>>>>> Model type >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //                             CustomUserprofileTextField(
// //                               controller: controller.modelController,
// //                               wight: double.infinity,
// //                               title: "Model*",
// //                               hintText: "Enter your vehicle model",
// //                             ),
// //                             UIHelper.verticalSpace(16.h),
// //
// //                             ///>>>>>>>>>>>>>>>>>>>> color  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //
// //                             DropdownButtonExample(
// //                               controller: controller.colorController,
// //                               title: 'color*',
// //                               list: const ["Option 1", "Option 2", "Option 3"],
// //                             ),
// //                             UIHelper.verticalSpace(16.h),
// //
// //                             ///>>>>>>>>>>>>>>>>>>>> registration number  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //
// //                             CustomUserprofileTextField(
// //                               controller: controller.registrationController,
// //                               wight: double.infinity,
// //                               title: "Registration Number",
// //                               hintText: "Enter your registration number",
// //                             ),
// //                             UIHelper.verticalSpace(16.h),
// //
// //                             ///>>>>>>>>>>>>>>>>>>>> manufacture year >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //                             DropdownButtonExample(
// //                               controller: controller.manufacturerYearController,
// //                               title: 'Manufacturer Year*',
// //                               list: const ["Option 1", "Option 2", "Option 3"],
// //                             ),
// //                             UIHelper.verticalSpace(16.h),
// //
// //                             ///>>>>>>>>>>>>>>>>>>>>  Payload Capacity >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //                             DropdownButtonExample(
// //                               controller: controller.payloadCapacityController,
// //                               title: 'Payload Capacity*',
// //                               list: const ["Option 1", "Option 2", "Option 3"],
// //                             ),
// //                             UIHelper.verticalSpace(16.h),
// //
// //                             ///>>>>>>>>>>>>>>>>>>>>  Pin code Capacity >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //
// //                             Text("Car Registration Number*",style: TextFontStyle.textStyle14PoppinsW500),
// //                             UIHelper.verticalSpace(13.h),
// //
// //                             PinCodeTextField(
// //                               length: 6, // Length of the PIN code
// //                               obscureText: false, // Set to true if the PIN should be hidden
// //                               animationType: AnimationType.fade, // Animation for the PIN fields
// //                               pinTheme: PinTheme(
// //                                 shape: PinCodeFieldShape.box, // The shape of the PIN fields
// //                                 borderRadius: BorderRadius.circular(12.r), // Rounded corners
// //                                 fieldHeight: 50.h, // Height of each field
// //                                 fieldWidth: 40.w, // Width of each field
// //                                 inactiveFillColor: Colors.white.withOpacity(0.1), // Inactive fields
// //                                 borderWidth: 1.sp, // Border width for fields
// //                                 errorBorderColor: Colors.red, // Border color for errors
// //                                 inactiveColor: Colors.black.withOpacity(0.1), // Border color when inactive
// //                                 selectedColor: Colors.blue.withOpacity(0.1), // Border color when selected
// //                                 selectedBorderWidth: 1, // Border width when selected
// //                                 activeFillColor: Colors.white, // Background color when active
// //                                 activeColor: AppColor.buttonColor, // Border color when active
// //                                 selectedFillColor: AppColor.buttonColor.withOpacity(0.3), // Selected field fill
// //                               ),
// //                               animationDuration: const Duration(milliseconds: 300),
// //                               enableActiveFill: true, // Enable background fill for active fields
// //                               controller:controller.carRegiNumber, // Connect the controller to track input
// //                               appContext: context, // Required context for the widget
// //
// //
// //                             ),
// //                             ///>>>>>>>>>>>>>>>>>>>>  Button >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// //                             customButton(
// //                                 name: "Continue",
// //                                 onCallBack: () {
// //                                   print(">>>>>>>>>>>>>>>>>>>>>>>model${controller.modelController.text}");
// //                                   print(">>>>>>>>>>>>>>>>>>>>>>>model${controller.colorController.toString()}");
// //                                   print(">>>>>>>>>>>>>>>>>>>>>>>model${controller.registrationController.text}");
// //                                   print(">>>>>>>>>>>>>>>>>>>>>>>model${controller.manufacturerYearController.toString()}");
// //                                   print(">>>>>>>>>>>>>>>>>>>>>>>model${controller.payloadCapacityController}");
// //                                   print(">>>>>>>>>>>>>>>>>>>>>>>model${controller.carRegiNumber.text}");
// //
// //                                   NavigationService.navigateTo(Routes.driveSignUpForm3);
// //
// //
// //                                 },
// //                                 borderColor: Colors.transparent,
// //                                 color: AppColor.buttonColor,
// //                                 context: context)
// //                           ],
// //                         ),
// //                       )
// //                     ],
// //                   ))),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// //
//
//
class DriveSignUpFrom2 extends StatefulWidget {
  const DriveSignUpFrom2({super.key});

  @override
  _DriveSignUpFrom2State createState() => _DriveSignUpFrom2State();
}

class _DriveSignUpFrom2State extends State<DriveSignUpFrom2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String?> _errors = {};

  final AppController controller = Get.put(AppController());
  final ImagePicker _picker = ImagePicker(); // Instance of the image picker

  List<XFile?> _selectedImages = [null, null, null]; // Initialize with null values for 3 images

  @override
  void initState() {
    super.initState();
  }

  // Function to pick images
  Future<void> _pickImage(int index) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _selectedImages[index] = pickedFile; // Update the selected image at the specified index
        });
        log("Image picked: ${pickedFile.path}");  // Log the image path here
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  // Function to pass selected images back to the previous screen
  void _goBack() {
    if (_selectedImages.every((image) => image != null)) { // Check if all 3 images are selected
      Navigator.pop(context, _selectedImages);
    } else {
      // Show error if less than 3 images are selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select 3 images')),
      );
    }
  }
//
  void _validateForm() {
    setState(() {
      _errors.clear();

      // Validate Image Selection
      if (_selectedImages.any((image) => image == null)) {
        _errors["image"] = "At least 3 images are required.";
      }

      // Validate Model
      if ((controller.modelController.text ?? "").isEmpty) {
        _errors["model"] = "Model is required.";
      }

      // Validate Color Dropdown
      if ((controller.colorController.value== null )) {
        _errors["color"] = "Please select a color.";
      }

      // Validate Registration Number
      if ((controller.registrationController.text ?? "").isEmpty) {
        _errors["registration"] = "Registration number is required.";
      }

      // Validate Manufacturer Year Dropdown
      if ((controller.manufacturerYearController.value== null)) {
        _errors["manufacturerYear"] = "Select Manufacturer Year.";
      }

      // Validate Payload Capacity Dropdown
      if ((controller.payloadCapacityController.value== null)) {
        _errors["payloadCapacity"] = "Please select Payload Capacity.";
      }

      // Validate Car Registration Number (PIN Code)
      if ((controller.carRegiNumber ?? "").isEmpty ||
          controller.carRegiNumber!.length < 6) {
        _errors["carRegiNumber"] = "Enter a valid 6-digit Car Reg Number.";
      }
    });

    // If no errors, proceed to next screen
    if (_errors.isEmpty) {
      print("✅ All fields are valid! Proceeding to next step...");
      NavigationService.navigateTo(Routes.driveSignUpForm3);
    }
  }

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
                  child: Column(
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
                                backgroundImage:
                                AssetImage(AppImages.rightClick),
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
                            radius: 21, // Adjust size
                            backgroundImage: AssetImage(AppImages.rightClick),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
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
                                    color: Colors.black.withOpacity(.1),
                                    blurRadius: 10.sp,
                                    spreadRadius: .4,
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Vehicle Information",
                                      style: TextFontStyle.textStyle16PoppinsW600),
                                  UIHelper.verticalSpace(16.h),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        // Image selection UI
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: List.generate(3, (index) {
                                            return GestureDetector(
                                              onTap: () => _pickImage(index), // Call _pickImage on tap
                                              child: Container(
                                                width: 90.w, // Set the width of the container
                                                height: 70.h, // Set the height of the container
                                                child: DottedBorder(
                                                  color: Colors.orange, // Color of the dotted border
                                                  strokeWidth: 2, // Thickness of the dots
                                                  dashPattern: [6, 3], // Size of the dash and gap
                                                  borderType: BorderType.RRect, // Rounded corners for the border
                                                  radius: Radius.circular(8), // Corner radius of the dotted border
                                                  child: Center( // Ensure the content inside is centered
                                                    child: _selectedImages[index] != null
                                                        ? ClipRRect(
                                                      borderRadius: BorderRadius.circular(8),
                                                      child: Image.file(
                                                        File(_selectedImages[index]!.path),
                                                        fit: BoxFit.cover, // Makes sure the image fills the space without distortion
                                                        width: double.infinity, // Take up all the width of the container
                                                        height: double.infinity, // Take up all the height of the container
                                                      ),
                                                    )
                                                        : Icon(Icons.camera_alt, color: Colors.grey), // Placeholder icon if no image
                                                  ),
                                                ),
                                              )
                                              ,
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (_errors.containsKey("image"))
                                    _buildErrorMessage(_errors["image"]!),
                                  UIHelper.verticalSpace(16.h),

                                  // **Model Field**
                                  CustomUserprofileTextField(
                                    controller: controller.modelController,
                                    wight: double.infinity,
                                    title: "Model*",
                                    hintText: "Enter your vehicle model",
                                  ),
                                  if (_errors.containsKey("model"))
                                    _buildErrorMessage(_errors["model"]!),
                                  UIHelper.verticalSpace(16.h),

                                  // **Color Dropdown**
                                  DropdownButtonExample(
                                    controller: controller.colorController,
                                    title: 'Color*',
                                    list: const ["Red", "Blue", "Black", "White"],
                                  ),
                                  if (_errors.containsKey("color"))
                                    _buildErrorMessage(_errors["color"]!),
                                  UIHelper.verticalSpace(16.h),

                                  // **Registration Number**
                                  CustomUserprofileTextField(
                                    controller: controller.registrationController,
                                    wight: double.infinity,
                                    title: "Registration Number*",
                                    hintText: "Enter your registration number",
                                  ),
                                  if (_errors.containsKey("registration"))
                                    _buildErrorMessage(_errors["registration"]!),
                                  UIHelper.verticalSpace(16.h),

                                  // **Manufacturer Year Dropdown**
                                  DropdownButtonExample(
                                    controller: controller.manufacturerYearController,
                                    title: 'Manufacturer Year*',
                                    list: const [2024, 2023, 2022, 2021],
                                  ),
                                  if (_errors.containsKey("manufacturerYear"))
                                    _buildErrorMessage(_errors["manufacturerYear"]!),
                                  UIHelper.verticalSpace(16.h),

                                  // **Payload Capacity Dropdown**
                                  DropdownButtonExample(
                                    controller: controller.payloadCapacityController,
                                    title: 'Payload Capacity*',
                                    list: const [1, 1.5, 2, 2.5,3, 3.5, 4,4.5,5, 5.5, 6, 6.5],
                                  ),
                                  if (_errors.containsKey("payloadCapacity"))
                                    _buildErrorMessage(_errors["payloadCapacity"]!),
                                  UIHelper.verticalSpace(16.h),

                                  // **Car Registration Number (PIN Code)**
                                  Text("Car Registration Number*",
                                      style: TextFontStyle.textStyle14PoppinsW500),
                                  UIHelper.verticalSpace(13.h),

                                  PinCodeTextField(

                                    onChanged: (value) {
                                      controller.carRegiNumber = value;
                                    },
                                    length: 6,
                                    obscureText: false,
                                    animationType: AnimationType.fade,
                                    appContext: context,
                                  ),
                                  if (_errors.containsKey("carRegiNumber"))
                                    _buildErrorMessage(_errors["carRegiNumber"]!),

                                  UIHelper.verticalSpace(16.h),

                                  // **Continue Button**
                                  customButton(
                                    name: "Continue",
                                    onCallBack: () {
                                      setState(() {
                                        controller.listOfImage= _selectedImages;
                                      });
                                      log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>controller image path ${_selectedImages.first?.path ?? " no images"}");
                                      log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>controller this  ${controller.listOfImage.first?.path ?? " no images"}");
                                      _validateForm();
                                    },
                                    borderColor: Colors.transparent,
                                    color: AppColor.buttonColor,
                                    context: context,
                                  ),
                                ],
                              ),
                            ),

                    ],
                  ))),
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




