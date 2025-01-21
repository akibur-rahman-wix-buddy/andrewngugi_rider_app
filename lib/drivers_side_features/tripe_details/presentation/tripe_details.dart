import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_icons/app_icons.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/driver_home/widget/trip_cancel_bottom_sheet.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/tripe_details/widget/AcceptRequestBottomSheet.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';



class TripeDetails extends StatefulWidget {
  const TripeDetails({super.key});

  @override
  State<TripeDetails> createState() => _TripeDetailsState();
}

class _TripeDetailsState extends State<TripeDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image:AssetImage(AppImages.bgImage))
        ),
        child:  Scaffold(
          backgroundColor: Colors.transparent,
          body:SafeArea(
            child: Padding(
              padding: EdgeInsets.all( UIHelper.kDefaulutPadding()),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30.r,
                              backgroundImage: AssetImage(AppImages.profile),
                            ),
                            UIHelper.horizontalSpace(15.w),
                            SizedBox(
                              height: 50.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Darlene Robertson",style: TextFontStyle.textStyle14PoppinsW500,),
                                  Text("Looking for a truck ",style: TextFontStyle.textStyle14PoppinsW400.copyWith(
                                    color: Colors.black54
                                  ),),
                
                                ],
                              ),
                            )
                          ],
                        ),
                        Text("\$658.00",style: TextFontStyle.headLine32PoppinsW700.copyWith(color: Colors.red,fontSize: 25.sp),)
                
                      ],
                    ),
                    UIHelper.verticalSpace(8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                
                        Text("Trip ID",style: TextFontStyle.textStyle14PoppinsW400.copyWith(
                            color: Colors.black54
                        ),),
                        Text("# S458SFV",style: TextFontStyle.textStyle14PoppinsW500,),
                      ],
                    ),
                    UIHelper.verticalSpace(24.h),
                  Divider(height: 2.h,color: Colors.black87,),
                  UIHelper.verticalSpace(10.h),
                    Container(
                      height: 135.h,
                      width: 345.w,
                      padding: EdgeInsets.all(12.sp),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                
                        shape: RoundedRectangleBorder(
                
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
                    UIHelper.verticalSpace(10.h),
                    Divider(height: 2.h,color: Colors.black87,),
                    UIHelper.verticalSpace(10.h),
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
                              width: 180.w,
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
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.blackColor.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 10,
                            // offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Receipt',
                                  style:
                                  TextFontStyle.textStyle16PoppinsW600,
                                ),
                                Text(
                                  '\$658.00',
                                  style:
                                  TextFontStyle.textStyle16PoppinsW600,
                                ),
                              ],
                            ),
                            UIHelper.verticalSpace(10),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Base Fare',
                                  style:
                                  TextFontStyle.textStyle14PoppinsW400,
                                ),
                                Text(
                                  '\$658.00',
                                  style:
                                  TextFontStyle.textStyle14PoppinsW400,
                                ),
                              ],
                            ),
                            UIHelper.verticalSpace(3),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Distance',
                                  style:
                                  TextFontStyle.textStyle14PoppinsW400,
                                ),
                                Text(
                                  '\$658.00',
                                  style:
                                  TextFontStyle.textStyle14PoppinsW400,
                                ),
                              ],
                            ),
                            UIHelper.verticalSpace(3),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Safety Coverage Fee',
                                  style:
                                  TextFontStyle.textStyle14PoppinsW400,
                                ),
                                Text(
                                  '\$658.00',
                                  style:
                                  TextFontStyle.textStyle14PoppinsW400,
                                ),
                              ],
                            ),
                            UIHelper.verticalSpace(3),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Helper (2*\$45)',
                                  style:
                                  TextFontStyle.textStyle14PoppinsW400,
                                ),
                                Text(
                                  '\$658.00',
                                  style:
                                  TextFontStyle.textStyle14PoppinsW400,
                                ),
                              ],
                            ),
                            UIHelper.verticalSpace(3),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Fare Saved',
                                  style:
                                  TextFontStyle.textStyle14PoppinsW400,
                                ),
                                Text(
                                  '- \$658.00',
                                  style:
                                  TextFontStyle.textStyle14PoppinsW400,
                                ),
                              ],
                            ),

                            /*dotted line start*/
                            UIHelper.verticalSpace(12.w),
                            CustomPaint(
                              size: const Size(double.infinity, 2),
                              // You can change the height to fit your needs
                              painter: DriveDottedLinePainter(),
                            ),
                            /*dotted line ended*/
                            UIHelper.verticalSpace(12.w),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Subtotal',
                                  style:
                                  TextFontStyle.textStyle14PoppinsW700,
                                ),
                                Text(
                                  '\$658.00',
                                  style:
                                  TextFontStyle.textStyle14PoppinsW700,
                                ),
                              ],
                            ),
                            UIHelper.verticalSpace(4.w),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Discount',
                                  style:
                                  TextFontStyle.textStyle14PoppinsW400,
                                ),
                                Text(
                                  '- \$658.00',
                                  style:
                                  TextFontStyle.textStyle14PoppinsW400,
                                ),
                              ],
                            ),
                            UIHelper.verticalSpace(12.w),
                            CustomPaint(
                              size: const Size(double.infinity, 2),
                              // You can change the height to fit your needs
                              painter: DriveDottedLinePainter(),
                            ),
                            UIHelper.verticalSpace(4.h),
                            CustomPaint(
                              size: const Size(double.infinity, 2),
                              // You can change the height to fit your needs
                              painter: DriveDottedLinePainter(),
                            ),
                            UIHelper.verticalSpace(10.w),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Net Fare',
                                  style:
                                  TextFontStyle.textStyle14PoppinsW700,
                                ),
                                Text(
                                  '\$658.00',
                                  style:
                                  TextFontStyle.textStyle14PoppinsW700,
                                ),
                              ],
                            ),

                            UIHelper.verticalSpace(16.h),
                            Divider(
                              height: 2.h,
                              color: Colors.black54,
                            ),
                            UIHelper.verticalSpace(16.h),

                            Row(
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
                                              child: const DriverCancelBottomSheet(), // Your custom widget
                                            );
                                          },
                                        );

                                      },
                                      child: Text(
                                          "Cancel Now",
                                          style: TextFontStyle.textStyle14PoppinsW600.copyWith(color: AppColor.buttonColor)
                                      ),
                                    ),
                                    const Icon(Icons.cancel,color: AppColor.buttonColor,)
                                  ],
                                )
                              ],
                            )

                          ],
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace(20.h)
                
                  ],
                
                ),
              ),
            ),
          ),

        ));
  }
}




class DriveDottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dotWidth = 2; // Width of each dot
    double space = 5; // Space between dots

    final paint = Paint()
      ..color = Colors.grey[400]!
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2; // Height of the line (dot thickness)

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dotWidth, size.height / 2),
        paint,
      );
      startX += dotWidth + space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
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
