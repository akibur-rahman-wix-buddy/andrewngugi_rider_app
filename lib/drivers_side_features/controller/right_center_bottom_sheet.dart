import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/controller/map_controller.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/tripe_details/widget/AcceptRequestBottomSheet.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/tripe_details/widget/CancelBottomSheet.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../assets_helper/app_colors/app_colors.dart';
import '../../../assets_helper/app_icons/app_icons.dart';

class RideCancelBottomSheet extends StatefulWidget {
  const RideCancelBottomSheet({super.key});

  @override
  State<RideCancelBottomSheet> createState() => _RideCancelBottomSheetState();
}

class _RideCancelBottomSheetState extends State<RideCancelBottomSheet> {

  MapController mapController =Get.put(MapController());

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
                Text("Finding nearby driver..", style: TextFontStyle.textStyle16PoppinsW600),
                UIHelper.verticalSpace(4.h),
                Text("We have sent your request to the nearby drivers", style: TextFontStyle.textStyle14PoppinsW400),
                UIHelper.verticalSpace(16.h),
                const Divider(height: 3, color: Colors.black54),
                UIHelper.verticalSpace(24.h),
                Text("Your Trip", style: TextFontStyle.textStyle16PoppinsW600),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildLocationIcon(AppIcons.locationPoint),
                          VerticalDashedLine(height: 40.h, color: AppColor.c1F2428),
                          _buildLocationIcon(AppIcons.location1),
                        ],
                      ),
                      UIHelper.horizontalSpace(16.w),
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
                UIHelper.verticalSpace(16.h),
                Divider(
                  height: 3.h,
                  color: Colors.black54,
                ),
                UIHelper.verticalSpace(24.h),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppIcons.emptyWallet) ,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 300.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                      "Payment",
                                      style:TextFontStyle.textStyle14PoppinsW500
                                  ),
                                  Text(
                                      "(cash)",
                                      style:TextFontStyle.textStyle14PoppinsW500.copyWith(color: Colors.green)
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                      "\$500",
                                      style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: const Color(0xFF637381),decoration: TextDecoration.lineThrough)
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                      "\$350",
                                      style: TextFontStyle.textStyle14PoppinsW600.copyWith(color: AppColor.buttonColor)
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Text(
                            "This is the estimated fare. This may vary.",
                            style:TextFontStyle.textStyle14PoppinsW400.copyWith(color: const Color(0xFF637381))
                        ),
                        UIHelper.verticalSpace(16.h),


                      ],
                    )
                  ],
                ),

                Divider(
                  height: 2.h,
                  color: Colors.black54,
                ),
                UIHelper.verticalSpace(24.h),
                SizedBox(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap:(){
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent, // Transparent modal background
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: const AcceptRequestBottomSheet(), // Your custom widget
                              );
                            },
                          );


                        },
                        child: Text(
                            "Cancel this Offer?",
                            style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: const Color(0xFF637381))
                        ),
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
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
                            },
                            child: GestureDetector(
                              onTap:  (){
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent, // Transparent modal background
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context).viewInsets.bottom,
                                      ),
                                      child: const CancelBottomSheet(), // Your custom widget
                                    );
                                  },
                                );
                              },
                              child: Text(
                                  "Cancel Now",
                                  style: TextFontStyle.textStyle14PoppinsW600.copyWith(color: AppColor.buttonColor)
                              ),
                            ),
                          ),
                          const Icon(Icons.cancel,color: AppColor.buttonColor,)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
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

class VerticalDashedLine extends StatelessWidget {
  final double height;
  final Color color;

  const VerticalDashedLine({super.key, this.height = 50.0, this.color = Colors.black});

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
