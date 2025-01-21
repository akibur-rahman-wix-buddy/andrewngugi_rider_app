import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../assets_helper/app_font/app_font.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/ui_helpers.dart';

class CompletedDriveHistoryScreen extends StatefulWidget {
  const CompletedDriveHistoryScreen({
    super.key,
  });

  @override
  State<CompletedDriveHistoryScreen> createState() => CompletedDriveHistoryScreenState();
}

class CompletedDriveHistoryScreenState extends State<CompletedDriveHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding:  const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
                boxShadow: const [
                  BoxShadow(
                color: Colors.black12,
                    blurRadius: 7,
                    spreadRadius: 4
            )
                ]
            ),
            
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '12 Nov 2022',
                        style: TextFontStyle.textStyle16PoppinsW600,
                      ),
                      UIHelper.horizontalSpaceSmall,
                      Text(
                        '11:12 PM',
                        style: TextFontStyle.textStyle16PoppinsW600,
                      ),
                      const Spacer(),
                      const ClipOval(
                        child: Image(
                          image: AssetImage(
                              AppImages.profile),
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpaceSmall,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: SvgPicture.asset(
                              Assets.icons.locationPoint,
                              width: 20,
                              height: 20,
                            ),
                          ),
                          CustomPaint(
                            size: const Size(1, 30),
                            painter: DottedLinePainter(),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: SvgPicture.asset(
                              Assets.icons.location1,
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                      UIHelper.horizontalSpaceMedium,
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text('Pickup Point',
                                  style: TextFontStyle
                                      .textStyle14PoppinsW400
                                      .copyWith(
                                      color: Colors.blueGrey)),
                              Text(
                                'Metaveresnow/bdCalling IT Ltd.',
                                style: TextFontStyle
                                    .textStyle14PoppinsW500,
                                maxLines: 1,
                              ),
                            ],
                          ),
                          UIHelper.verticalSpace(30.0),
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text('Destination',
                                  style: TextFontStyle
                                      .textStyle14PoppinsW400
                                      .copyWith(
                                      color: Colors.blueGrey)),
                              Text(
                                '24/16/a Meta bdCalling IT Ltd ',
                                style: TextFontStyle
                                    .textStyle14PoppinsW500,

                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dotHeight = 2;
    double space = 5;

    final paint = Paint()
      ..color = Colors.grey[400]!
      ..strokeCap = StrokeCap.round
      ..strokeWidth = dotHeight;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dotHeight),
        paint,
      );
      startY += dotHeight + space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}