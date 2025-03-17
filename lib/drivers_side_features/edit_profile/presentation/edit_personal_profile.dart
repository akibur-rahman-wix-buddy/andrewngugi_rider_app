import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_dropDown_manu.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/widget/custom_userProfile_text_field.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/widget/driver_sign_updrop_down.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/model/personal_data_model.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/widget/CustomUserProfileTextField.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/widget/driver_image_picker.dart';
import 'package:andrewngugi_rider_app/helpers/toast.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:andrewngugi_rider_app/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class DriverEditPersonalProfile extends StatefulWidget {
  const DriverEditPersonalProfile({super.key});

  @override
  State<DriverEditPersonalProfile> createState() => _DriverEditPersonalProfileState();
}

class _DriverEditPersonalProfileState extends State<DriverEditPersonalProfile> {


  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController gmailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nidController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController driverLicenceController = TextEditingController();
  TextEditingController driverExperienceController = TextEditingController();
  String ? selectedGender;
  XFile? avatar;






  PersonalData? getPersonalData;
  bool isLoading = false;
  String? errorMessage;
  Future<void> _fetchDriveZoneData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      final response = await getPersonalProfileDataRx.getPersonalInformation();
      setState(() {
        getPersonalData = response?.data ;
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

  @override
  void initState() {
    super.initState();
    _fetchDriveZoneData();
  }


  final drivingExperienceController = DropdownButtonController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:isLoading?  Center(
        child: Lottie.asset(
          'assets/lottie/loading.json', // Add your Lottie JSON file
          width: 200,
          height: 200,
        ),
      ): SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                  child: Column(
                    children: [

                       Center(
                        child: DriverImagePicker(driverImage:getPersonalData?.avatar.toString()??"",)
                      ),
                      UIHelper.verticalSpace(16.h),
                      CustomUserProfileTextField(
                        controller: firstNameController,

                        wight:double.infinity ,
                        title: "First Name (Same as NID/License)*",
                        hintText: "${getPersonalData?.firstName.toString()??" Enter your name "} ",
                      ),
                      UIHelper.verticalSpace(16.h),
                      CustomUserProfileTextField(
                        controller: lastNameController,
                        wight:double.infinity ,
                        title: "Last Name (Same as NID/License)*",
                        hintText: "${getPersonalData?.lastName.toString()}",
                      ),

                      UIHelper.verticalSpace(16.h),
                       CustomUserProfileTextField(
                         controller: phoneController,
                        wight:double.infinity,
                        title: "Phone Number",
                        hintText: getPersonalData?.phone.toString()??" Enter your phone number ",
                      ),
                      UIHelper.verticalSpace(16.h),

                       CustomUserProfileTextField(
                         controller:gmailController ,
                        wight:double.infinity,
                        title:"Gmail",
                        hintText:  getPersonalData?.email.toString()??" Enter your email ",
                      ),
                      UIHelper.verticalSpace(16.h),
                       CustomUserProfileTextField(
                         controller: addressController,
                        wight:double.infinity,
                        title: "Address",
                        hintText: getPersonalData?.address.toString()??" Enter your address ",
                      ),
                      UIHelper.verticalSpace(16.h),
                       CustomUserProfileTextField(
                         controller: nidController,
                        wight:double.infinity,
                        title: "NID Number",
                        hintText: getPersonalData?.nidNumber.toString()??" Enter your NID number "
                      ),
                      UIHelper.verticalSpace(16.h),
                      Align(
                          alignment: Alignment.topLeft,
                          child:  Text('Gender', style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: Colors.black.withOpacity(.6)))),
                      UIHelper.verticalSpace(8.h),
                      CustomDropdownFormField(
                        hintText: 'Select your gender',
                        value: selectedGender,
                        onChanged: (newValue) {
                          setState(() {
                            selectedGender = newValue;
                          });
                        },
                        items: ['male', 'female', 'other'],
                      ),UIHelper.verticalSpace(10.h),

                       CustomUserProfileTextField(
                         controller: dateOfBirthController,
                        wight:double.infinity,
                        title: "Date Of Birth",
                        hintText: getPersonalData?.dateOfBirth.toString()??" Enter your birthday ",
                      ),
                      UIHelper.verticalSpace(10.h),
                      CustomUserProfileTextField(
                        controller: driverExperienceController,
                        wight:double.infinity,
                        title: "Driving Experience",
                        hintText: getPersonalData?.driverExperience.toString()??" Enter your driver experience ",
                      ),
                      UIHelper.verticalSpace(10.h),
                      CustomUserprofileTextField(

                        controller:driverLicenceController,
                        wight: double.infinity,
                        title: "Driving License*",
                        hintText: getPersonalData?.driverLicenseNumber.toString()??"Enter your driving license number",
                      ),
                      UIHelper.verticalSpace(16.h),

                      customButton(name: "Save", onCallBack: () async{
                        bool success = await updateProfileApiRx.updateProfileApiInformation(
                            firstName:firstNameController.text,
                            lastName: lastNameController.text,
                            phoneNumber: phoneController.text,
                            email: gmailController.text,
                           avatar:  XFile(avatar?.path??""),
                            gender: selectedGender,
                            address: addressController.text,
                            nidNumber: nidController.text,
                            dateOfBirth: dateOfBirthController.text,
                            driveExperience: driverExperienceController.text,
                            driverLicenseNumber: driverLicenceController.text);
                        if(success){
                          ToastUtil.showLongToast("Personal Profile Update Success");
                        }


                      }, color: AppColor.buttonColor,borderColor: Colors.transparent, context: context)





                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}


