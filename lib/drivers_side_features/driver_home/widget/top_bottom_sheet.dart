import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_icons/app_icons.dart';
import 'package:andrewngugi_rider_app/helpers/all_routes.dart';
import 'package:andrewngugi_rider_app/helpers/navigation_service.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import 'custom_button_bottom_sheet.dart';

void showTopSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent, // Makes background transparent
    builder: (BuildContext context) {
      return CustomTopSheet();
    },
  );
}

class CustomTopSheet extends StatefulWidget {


  @override
  State<CustomTopSheet> createState() => _CustomTopSheetState();
}

class _CustomTopSheetState extends State<CustomTopSheet> {
  String? _selectedButton;

  void _onButtonPressed(String buttonName) {
    setState(() {
      _selectedButton = buttonName;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter, // Aligns the bottom sheet to the top
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 30.sp),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft:Radius.circular(20.r),
                bottomRight: Radius.circular(20.r)
            )
        ),

        height: 300.h, // Height of the top sheet
        child: Column(


          children: [

            Row(
              children: [
                SizedBox(
                  width: 240.w,
                  child: Center(
                      child: RichText(
                        text:  TextSpan(
                          children: [


                            TextSpan(
                              text: 'Darlene ',
                              style: TextFontStyle.textStyle14PoppinsW500, // Red color for "24.12.2024"
                            ),
                            TextSpan(
                                text: 'is looking for a truck and, ',
                                style: TextFontStyle.textStyle14PoppinsW500.copyWith(color: Colors.black54) // Black color for "2 Labor"
                            ),
                            TextSpan(
                              text: '2 Labor ',
                              style: TextFontStyle.textStyle14PoppinsW500, // Red color for "24.12.2024"
                            ),
                            TextSpan(
                              text: 'for ',
                              style: TextFontStyle.textStyle14PoppinsW500.copyWith(color: Colors.black54), // Black color for "2 Labor"
                            ),
                            TextSpan(
                              text: '6 hours ',
                              style: TextFontStyle.textStyle14PoppinsW500, // Red color for "24.12.2024"
                            ),
                            TextSpan(
                              text: 'for ',
                              style: TextFontStyle.textStyle14PoppinsW500.copyWith(color: Colors.black54), // Black color for "2 Labor"
                            ),
                            TextSpan(
                              text: '24.12.2024',
                              style: TextFontStyle.textStyle14PoppinsW500, // Red color for "24.12.2024"
                            ),

                          ],
                        ),)),
                ),
                Text("\$658.00",style: TextFontStyle.headLine32PoppinsW700.copyWith(color: Colors.red,fontSize: 25.sp),)

              ],
            ),
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
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLocationIcon(AppIcons.locationPoint),
                      topVerticalDashedLine(height: 40.h, color: AppColor.c1F2428),
                      _buildLocationIcon(AppIcons.location1),
                    ],
                  ),
                  UIHelper.horizontalSpace(16.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildLocationInfo(
                        title: "Pickup Point",
                        address: "6391 Elgin St. Celina, Delaware 10299",
                      ),
                      _buildLocationInfo(
                        title: "Destination",
                        address:"2464 Royal Ln. Mesa, Jersey 45463",
                      ),
                    ],
                  )
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                customButtonBottomSheet(
                    textStyle: TextFontStyle.textStyle16PoppinsW600.copyWith(color:_selectedButton == "Cancel"
                        ? AppColor.whiteColor
                        : AppColor.buttonColor, ),
                    name: "Cancel",
                    onCallBack: () {
                      _onButtonPressed("Cancel");
                      NavigationService.goBack;

                    } ,
                    color: _selectedButton == "Cancel"
                        ? AppColor.buttonColor
                        : Colors.white,
                    borderColor: _selectedButton == "Cancel"
                        ? AppColor.whiteColor
                        : AppColor.buttonColor,
                    context: context,
                    minWidth: 165.w
                ),


                customButtonBottomSheet
                  (textStyle: TextFontStyle.textStyle16PoppinsW600.copyWith(color:_selectedButton == "Accept"
                    ? AppColor.whiteColor
                    : AppColor.buttonColor, ),
                    name: "Accept",
                    onCallBack: () {
                      _onButtonPressed("Accept");
                      NavigationService.navigateTo(Routes.tripeDetails);
                    },
                    color: _selectedButton == "Accept"
                        ? AppColor.buttonColor
                        : Colors.white,
                    borderColor: _selectedButton == "Accept"
                        ? AppColor.whiteColor
                        : AppColor.buttonColor,
                    context: context,
                    minWidth: 165.w
                ),


              ],
            )



          ],
        ),
      ),
    );
  }
}



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


Widget _buildLocationInfo({required String title, required String address}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: AppColor.blackColor.withOpacity(.6)),
      ),
      Text(
        address,
        style: TextFontStyle.textStyle14PoppinsW500,
      ),
    ],
  );
}

class topVerticalDashedLine extends StatelessWidget {
  final double height;
  final Color color;

  const topVerticalDashedLine({Key? key, this.height = 50.0, this.color = Colors.black}) : super(key: key);

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
    const double dashHeight = 4;
    const double dashSpace = 4;
    double startY = 0;

    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
