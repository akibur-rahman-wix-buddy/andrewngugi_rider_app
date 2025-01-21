import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_icons/app_icons.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/controller/map_controller.dart';
import 'package:andrewngugi_rider_app/gen/colors.gen.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'right_center_bottom_sheet.dart';

// Dashed Line Widget
class VerticalDashedLine extends StatelessWidget {
  final double height;
  final Color color;

  const VerticalDashedLine({
    Key? key,
    this.height = 50.0,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: _DashedLinePainter(color: color),
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;

  _DashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    double startY = 0;
    const double dashHeight = 4;
    const double dashSpacing = 3;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpacing;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Main Widget
class LocationSetStartNow extends StatefulWidget {
  const LocationSetStartNow({super.key});

  @override
  State<LocationSetStartNow> createState() => _LocationSetStartNowState();
}

class _LocationSetStartNowState extends State<LocationSetStartNow> {

  MapController mapController =Get.put(MapController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 680.h,
        decoration: const BoxDecoration(
          color: Colors.transparent, // Make the main background transparent
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white, // Internal sheet color
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Subtle shadow
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, -4), // Shadow effect upwards
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.verticalSpace(16.h),


                ///>>>>>>>>>>>>>pickup point and destination part >>>>>>>>>>>>>>>>>>>>>>>>>>>

                Container(
                  height: 135.h,
                  width: 345.w,
                  padding: EdgeInsets.all(12.sp),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x193F3F3F),
                        blurRadius: 40,
                        offset: Offset(0, 8),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      // Left Section - Icons and Dashed Line
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildLocationIcon(AppIcons.locationPoint),
                          VerticalDashedLine(
                              height: 40.h,
                              color: AppColor.c1F2428), // Dashed Line
                          _buildLocationIcon(AppIcons.location1),
                        ],
                      ),
                      UIHelper.horizontalSpace(16.w),

                      // Right Section - Location Text
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildLocationInfo(
                            title: "Pickup Point",
                            address: mapController.originController.text,
                          ),
                          _buildLocationInfo(
                            title: "Destination",
                            address: mapController.destinationController.text,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                UIHelper.verticalSpace(24.h),


                ///>>>>>>>>>>>>> product key and details >>>>>>>>>>>>>>>>>>>>



                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Moving Products:",style: TextFontStyle.textStyle14PoppinsW500),
                        UIHelper.verticalSpace(24.h),
                        Text("Weight:",style: TextFontStyle.textStyle14PoppinsW500),
                        UIHelper.verticalSpace(8.h),
                        Text("Time:",style: TextFontStyle.textStyle14PoppinsW500),
                        UIHelper.verticalSpace(8.h),
                        Text("Labor:",style: TextFontStyle.textStyle14PoppinsW500),
                        UIHelper.verticalSpace(8.h),
                        Text("Arrive Date:",style: TextFontStyle.textStyle14PoppinsW500),
                        UIHelper.verticalSpace(8.h),
                        Text("Arrive Time:",style: TextFontStyle.textStyle14PoppinsW500),
                        UIHelper.verticalSpace(8.h),
                        Text("Address Details:",style: TextFontStyle.textStyle14PoppinsW500),
                        UIHelper.verticalSpace(8.h),
                        Text("Phone Number: ",style: TextFontStyle.textStyle14PoppinsW500),
                        UIHelper.verticalSpace(8.h),

                      ],
                    ),
                    UIHelper.horizontalSpace(16.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Homeshifting",style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: const Color(0xFF637381),),),
                        UIHelper.verticalSpace(24.h),
                        Text("Up to 1Ton",style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: const Color(0xFF637381),),),
                        UIHelper.verticalSpace(8.h),
                        Text("5 Hour",style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: const Color(0xFF637381),),),
                        UIHelper.verticalSpace(8.h),
                        Text("2 Person",style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: const Color(0xFF637381),),),
                        UIHelper.verticalSpace(8.h),
                        Text("24 Dec 2024",style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: const Color(0xFF637381),),),
                        UIHelper.verticalSpace(8.h),
                        Text("4 PM",style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: const Color(0xFF637381),),),
                        UIHelper.verticalSpace(8.h),
                        SizedBox(
                          width: 200.w,
                          child: Text(
                            "4517 Washington Ave. Manchester", // Text string should be the first parameter
                            maxLines: 1,                        // Maximum lines allowed
                            overflow: TextOverflow.ellipsis,    // Truncate with ellipsis if overflowed
                            style: TextFontStyle.textStyle14PoppinsW400.copyWith(
                              color: const Color(0xFF637381),
                            ),
                          ),
                        ) ,UIHelper.verticalSpace(8.h),
                        Text("(239) 555-0108",style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: const Color(0xFF637381),),),
                        UIHelper.verticalSpace(8.h),
                      ],
                    )
                  ],
                ),
                UIHelper.verticalSpace(16.h),

                ///>>>>>>>>>> spacial note part >>>>>>>>>>>>>>>>>>>>>>>>>>>



                Text("Special Note:",style: TextFontStyle.textStyle14PoppinsW500,),
                UIHelper.verticalSpace(8.h),
                SizedBox(
                    width: 340.w,
                    child: Text("Horem Ipsum is simply dummy text of the printin g and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500",style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: const Color(0xFF637381),),)),
                UIHelper.verticalSpace(24.h),

                ///>>>>>>>>>>>>>>>>>  selectable car item >>>>>>>>>>>>>>>>>
                SelectableItems(),

                ///>>>>>>>>>>>>>>>>>> payment and promo section >>>>>>>>>>>>>>>>>>>>
                Container(
                  height: 60.h,
                  width: 345.w,
                  padding: EdgeInsets.all(12.sp),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x193F3F3F),
                        blurRadius: 40,
                        offset: Offset(0, 8),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      SizedBox(
                        width: 150.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(AppIcons.emptyWallet),
                                UIHelper.horizontalSpace(5.w),
                                Text("Payment",style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: Colors.black),),
                              ],
                            ),
                            SvgPicture.asset(AppIcons.arrowRight)
                          ],
                        ),
                      ),

                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                                width: 1,
                                color: AppColors.borderColor
                            )
                        ),
                      ),
                      SizedBox(
                        width: 150.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(AppIcons.information1),
                                UIHelper.horizontalSpace(5.w),
                                Text("Add Promo",style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: Colors.black),),
                              ],
                            ),
                            SvgPicture.asset(AppIcons.arrowRight)
                          ],
                        ),
                      ),



                    ],
                  ),
                ),
                UIHelper.verticalSpace(24.h),



                ///>>>>>>>>>>> start now button >>>>>>>>>>>>>>>>>>>>>>>>>>
                customButton(name: "Start Now", onCallBack: (){


                  showModalBottomSheet(
                    backgroundColor: Colors.transparent, // Transparent modal background
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: const RideCancelBottomSheet(), // Your custom widget
                      );
                    },
                  );

                }, context: context,borderColor: Colors.transparent,color: AppColor.buttonColor)


              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable method for location icons
  Widget _buildLocationIcon(String asset) {
    return Container(
      height: 32.h,
      width: 32.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColor.c1F2428),
      ),
      child: Center(child: SvgPicture.asset(asset)),
    );
  }

  // Reusable method for text
  Widget _buildLocationInfo({required String title, required String address}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextFontStyle.textStyle14PoppinsW400
              .copyWith(color: AppColor.blackColor.withOpacity(.6)),
        ),
        Text(
          address,
          style: TextFontStyle.textStyle14PoppinsW500,
        ),

      ],
    );
  }
}







class SelectableItems extends StatefulWidget {
  @override
  _SelectableItemsState createState() => _SelectableItemsState();
}

class _SelectableItemsState extends State<SelectableItems> {
  int selectedIndex = -1; // To track selected item index

  // Sample data for items
  final List<Map<String, dynamic>> items = [
    {
      "title": "Pickup",
      "subtitle": "Quick and affordable",
      "image": AppImages.pickup2, // Replace with your image path
      "oldPrice": "\$500",
      "newPrice": "\$400",
    },
    {
      "title": "Van",
      "subtitle": "Spacious Van for larger product",
      "image": AppImages.van2, // Replace with your image path
      "oldPrice": "\$600",
      "newPrice": "\$450",
    },
    {
      "title": "XL2",
      "subtitle": "Quick and larger product",
      "image": AppImages.xl2, // Replace with your image path
      "oldPrice": "\$700",
      "newPrice": "\$500",
    },
    {
      "title": "Truck",
      "subtitle": "Quick and larger product",
      "image": AppImages.truck2, // Replace with your image path
      "oldPrice": "\$400",
      "newPrice": "\$300",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index; // Update selected index
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              height: 74.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  width: 2.0,
                  color: selectedIndex == index
                      ? AppColor.buttonColor // Selected item color
                      : const Color(0xFFBDBDBD), // Default gray color
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          item['image'],
                          height: 42.0,
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                item['title'],
                                style:TextFontStyle.textStyle14PoppinsW500
                            ),
                            Text(
                                item['subtitle'],
                                style:TextFontStyle.textStyle14PoppinsW400.copyWith(color: const Color(0xFF637381))
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                          item['oldPrice'],
                          style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: const Color(0xFF637381))
                      ),
                      const SizedBox(width: 10),
                      Text(
                          item['newPrice'],
                          style: TextFontStyle.textStyle14PoppinsW500.copyWith(color: AppColor.buttonColor)
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


















