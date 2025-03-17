import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/model/personal_data_model.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/edit_profile/widget/CustomUserProfileTextField.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:andrewngugi_rider_app/networks/api_acess.dart';
import 'package:andrewngugi_rider_app/networks/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriverProfile extends StatefulWidget {
  const DriverProfile({super.key});

  @override
  State<DriverProfile> createState() => _DriverProfileState();
}

class _DriverProfileState extends State<DriverProfile> {

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



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.bgImage))),
      child:  Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(
                title: "Profiles",
                isCenterd: true,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                    child: Column(
                      children: [

                        Center(
                          child: CircleAvatar(
                            radius: 65,
                            backgroundImage: getPersonalData?.avatar != null
                                ? NetworkImage("$imageUrl${getPersonalData!.avatar.toString()}")
                                : const AssetImage(AppImages.profile) as ImageProvider,
                          ),
                        ),
                        UIHelper.verticalSpace(16.h),
                         CustomUserProfileTextField(
                          enable: false,
                          wight:double.infinity ,
                          title: "Full Name (Same as NID/License)*",
                          hintText: "${getPersonalData?.firstName.toString() ?? ""}" +
                             " ${getPersonalData?.lastName.toString() ?? ""}",
                        ),

                        UIHelper.verticalSpace(16.h),
                         CustomUserProfileTextField(
                          enable: false,
                          wight:double.infinity,
                          title: "Phone Number",
                          hintText: getPersonalData?.phone.toString()??"",
                        ),
                        UIHelper.verticalSpace(16.h),

                         CustomUserProfileTextField(
                          enable: false,
                          wight:double.infinity,
                          title: "Email Address",
                          hintText:getPersonalData?.email.toString()??"" ,
                        ),
                         CustomUserProfileTextField(
                          enable: false,
                          wight:double.infinity,
                          title: "Address",
                          hintText: getPersonalData?.address.toString()??"",
                        ),
                        UIHelper.verticalSpace(16.h),
                         CustomUserProfileTextField(
                          enable: false,
                          wight:double.infinity,
                          title: "NID Number",
                          hintText: getPersonalData?.nidNumber.toString()??"",
                        ),
                        UIHelper.verticalSpace(16.h),

                         CustomUserProfileTextField(
                          enable: false,
                          wight:double.infinity,
                          title: "Gender",
                          hintText: getPersonalData?.gender.toString()??"",
                        ),
                         CustomUserProfileTextField(
                          enable: false,
                          wight:double.infinity,
                          title: "Date Of Birth",
                          hintText:getPersonalData?.dateOfBirth.toString()??"" ,
                        ),
                        UIHelper.verticalSpace(20.h)






                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}


