import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/controller/map_controller.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class DriverCancelBottomSheet extends StatefulWidget {
  const DriverCancelBottomSheet({super.key});

  @override
  State<DriverCancelBottomSheet> createState() => _DriverCancelBottomSheetState();
}

class _DriverCancelBottomSheetState extends State<DriverCancelBottomSheet> {
  MapController mapController = Get.put(MapController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cancelation Reason",style: TextFontStyle.textStyle16PoppinsW600,),
                const DriverRadioButtonWidget(),
                customButton(name: "Submit", onCallBack:(){
                  mapController.getDirections(context);
                  NavigationService.popAndReplace(Routes.driveNavigationScreen);
                },color: AppColor.buttonColor,borderColor: Colors.transparent , context: context)

              ],
            ),

          ),
        ),
      ),
    );
  }
}





class DriverRadioButtonWidget extends StatefulWidget {
  const DriverRadioButtonWidget({super.key});

  @override
  _DriverRadioButtonWidgetState createState() => _DriverRadioButtonWidgetState();
}

class _DriverRadioButtonWidgetState extends State<DriverRadioButtonWidget> {
  // Track selected radio button
  String? selectedCategory;

  // List of options
  final List<Map<String, String>> categories = [
    {"title": "I need to go to a different destination.", "value": "destination"},
    {"title": "I have a personal emergency.", "value": "emergency"},
    {"title": "I booked the wrong type of ride or location.", "value": "wrong_booking"},
    {"title": "I need to go to a different destination.", "value": "change_distance"},
    {"title": "Health concerns or safety protocols.", "value": "health"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          ...categories.map((category) => Column(
            children: [
              buildRadioButton(category['title']!, category['value']!),
              buildDivider(),
            ],
          )),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  // Custom widget to build a radio button row
  Widget buildRadioButton(String title, String value) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: selectedCategory,
          onChanged: (String? newValue) {
            setState(() {
              selectedCategory = newValue;
            });
          },
          activeColor: Colors.yellow, // Selected color
          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return AppColor.buttonColor; // Selected color
            }
            return AppColor.buttonColor; // Unselected color
          }),
        ),
        const SizedBox(width: 10), // Replace UIHelper
        Text(title),
      ],
    );
  }

  // Divider Widget
  Widget buildDivider() {
    return const Divider(
      height: 2,
      color: Colors.black,
    );
  }
}



