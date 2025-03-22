import 'dart:developer';

import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/constants/app_constants.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/model/driver_car_model.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/widget/custom_userProfile_text_field.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/widget/driver_sign_updrop_down.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/controller/AppController.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/widget/edit_vehicle_imge_picker.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:andrewngugi_rider_app/networks/api_acess.dart';
import 'package:andrewngugi_rider_app/networks/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';


import '../model/vehicle_profile_model.dart';
import 'widgets/pin_code_fields.dart';

class EditVehicleScreen extends StatefulWidget {
  const EditVehicleScreen({super.key});

  @override
  State<EditVehicleScreen> createState() => _EditVehicleScreenState();
}

class _EditVehicleScreenState extends State<EditVehicleScreen> {

  AppController controller = Get.put(AppController());


  VehicleProfileData? getVehicleData;
  bool isLoading = false;
  String? errorMessage;
  int ? selectedId;



  Future<void> _fetchVehicleData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      final response = await getVehicleProfileDataRx.getVehicleInformation();
      setState(() {
        getVehicleData = response?.data;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  List<DriverCarData>? driverCarData;

  Future<void> _fetchDriveCarData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final response = await getDriverCarRxObj.getCarInformation();
      setState(() {
        driverCarData = response?.data ?? [];
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        driverCarData = [];
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchVehicleData();
    _fetchDriveCarData();
  }

  @override
  Widget build(BuildContext context) {


    final vehicleTypeController = DropdownButtonController();
    TextEditingController vehicleModelController = TextEditingController(text: getVehicleData?.model ??"");
    TextEditingController vehicleColorController = TextEditingController(text: getVehicleData?.color.toString() ??"");
    TextEditingController vehicleManufacturerYearController = TextEditingController(text: getVehicleData?.manufactureYear.toString() ??"");
    TextEditingController vehiclePayloadCapacityController = TextEditingController(text: getVehicleData?.payloadCapacity.toString() ??"");
    TextEditingController vehicleRegistrationController = TextEditingController(text: getVehicleData?.regNumber.toString() ??"");
    TextEditingController vehicleCarRegiNumber = TextEditingController(text: getVehicleData?.carRegNumber.toString() ??"");


    String carReg = getVehicleData?.carRegNumber?.toString() ?? '';
    carReg = carReg.padRight(6, ' ');

    log("Full Image URLs = ${getVehicleData?.avatars?.map((e) => "$imageUrl${e.avatar}").toList() ?? []}");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: isLoading
            ? Center(
                child: Lottie.asset(
                  'assets/lottie/loading.json', // Add your Lottie JSON file
                  width: 200,
                  height: 200,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UIHelper.verticalSpace(16.h),

                            ///>>>>>>>>>>>>>>>>>>>> profile image >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                            EditVehicleImagePicker(
                                imageList: getVehicleData?.avatars
                                        ?.map((e) => "$imageUrl${e.avatar}")
                                        .toList() ??
                                    []),
                            UIHelper.verticalSpace(16.h),

                            ///>>>>>>>>>>>>>>>>>>>> Vehicle Type >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                            isLoading
                                ? Center(
                                    child: Lottie.asset(
                                      'assets/lottie/loading.json', // Add your Lottie JSON file
                                      width: 200,
                                      height: 200,
                                    ),
                                  )
                                : DropdownButtonExample(
                              controller: vehicleTypeController,
                              title: 'Vehicle Type*',
                              hint: Text("${getVehicleData?.vehicleId.toString()}"),
                              list: driverCarData?.map((e) => e.name).toList() ?? [],
                              onChanged: (selectedName) {
                                // Find the corresponding ID
                                final selectedVehicle = driverCarData?.firstWhere(
                                      (element) => element.name == selectedName,
                                  // orElse: () => null,
                                );




                                if (selectedVehicle != null) {
                                   selectedId = selectedVehicle.id;
                                  print("Selected ID: $selectedId");
                                }
                              },
                            ),

                            UIHelper.verticalSpace(16.h),

                            ///>>>>>>>>>>>>>>>>>>>> Model type >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                            CustomUserprofileTextField(
                              controller: vehicleModelController,
                              wight: double.infinity,
                              title: "Model*",
                              hintText: getVehicleData?.model.toString() ??
                                  "Enter  model ",
                            ),
                            UIHelper.verticalSpace(16.h),

                            ///>>>>>>>>>>>>>>>>>>>> color  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

                            CustomUserprofileTextField(
                              controller: vehicleColorController,
                              wight: double.infinity,
                              title: "Color*",
                              hintText: getVehicleData?.color.toString() ??
                                  "Enter  color ",
                            ),

                            UIHelper.verticalSpace(16.h),

                            ///>>>>>>>>>>>>>>>>>>>> registration number  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

                            CustomUserprofileTextField(
                              controller: vehicleRegistrationController,
                              wight: double.infinity,
                              title: "Registration Number",
                              hintText: getVehicleData?.regNumber.toString() ??
                                  "Registration number ",
                            ),
                            UIHelper.verticalSpace(16.h),

                            ///>>>>>>>>>>>>>>>>>>>> manufacture year >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

                            CustomUserprofileTextField(
                              controller: vehicleManufacturerYearController,
                              wight: double.infinity,
                              title: "Manufacturer Year*",
                              hintText:
                                  getVehicleData?.manufactureYear.toString() ??
                                      "Manufacturer Year",
                            ),
                            UIHelper.verticalSpace(16.h),

                            CustomUserprofileTextField(
                              controller: vehiclePayloadCapacityController,
                              wight: double.infinity,
                              title: "Payload Capacity*",
                              hintText: getVehicleData?.model.toString() ??
                                  " Payload Capacity",
                            ),
                            UIHelper.verticalSpace(16.h),

                            ///>>>>>>>>>>>>>>>>>>>>  Payload Capacity >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                            Text(
                              "Car Registration Number*",
                              style: TextFontStyle.textStyle14PoppinsW500
                                  .copyWith(color: Colors.black),
                            ),

                            PinCodeTextFieldVehicle(


                              hintCharacter:
                                  carReg, // This will fill the fields with the registration number
                              length: 6, // Set to 6 for 6 fields
                              obscureText: false,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(12.r),
                                fieldHeight: 50.h,
                                fieldWidth: 40.w,
                                inactiveFillColor:
                                    Colors.white.withOpacity(0.1),
                                borderWidth: 1.sp,
                                errorBorderColor: Colors.red,
                                inactiveColor: Colors.black.withOpacity(0.1),
                                selectedColor: Colors.blue.withOpacity(0.1),
                                selectedBorderWidth: 1,
                                activeFillColor: Colors.white,
                                activeColor: AppColor.buttonColor,
                                selectedFillColor:
                                    AppColor.buttonColor.withOpacity(0.3),
                              ),
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              enableActiveFill: true,
                              controller:
                                  vehicleCarRegiNumber, // Ensure that the controller has the registration number
                              appContext: context,
                              keyboardType: TextInputType
                                  .text, // To ensure correct input type
                            ),

                            ///>>>>>>>>>>>>>>>>>>>>  Button >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                            customButton(
                                name: "Continue",
                                onCallBack: () async{


                                  List<XFile> imageList = controller.updateListOfImage
                                      .whereType<XFile>() // Ensure that we're only mapping non-null XFile objects
                                      .toList();
                                 bool success = await updateVehicleRx.updateVehicleInfo(
                                     vehicleId:selectedId ,
                                     model: vehicleModelController.text,
                                     color:vehicleColorController.text,
                                     regNumber: vehicleRegistrationController.text,
                                     manufactureYear: vehicleManufacturerYearController.text,
                                     payloadCapacity: vehiclePayloadCapacityController.text,
                                     carRegNumber: vehicleCarRegiNumber.text,
                                     image: imageList);
                                 if(success){
                                   ToastUtil.showLongToast("Vehicle profile is updated");
                                 }
                                },
                                borderColor: Colors.transparent,
                                color: AppColor.buttonColor,
                                context: context)
                          ],
                        ),
                      ],
                    ))),
      ),
    );
  }
}
