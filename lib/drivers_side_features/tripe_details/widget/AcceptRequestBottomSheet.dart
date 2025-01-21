import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_icons/app_icons.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_textFiled.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/tripe_details/widget/CancelBottomSheet.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AcceptRequestBottomSheet extends StatefulWidget {
  const AcceptRequestBottomSheet({super.key});

  @override
  State<AcceptRequestBottomSheet> createState() =>
      _AcceptRequestBottomSheetState();
}

class _AcceptRequestBottomSheetState extends State<AcceptRequestBottomSheet> {
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
          child:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Driver accept your request..",style: TextFontStyle.textStyle16PoppinsW600.copyWith(color: const Color(0xFF009F0B),),),
                UIHelper.verticalSpace(16.h),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.r,
                      backgroundImage:const AssetImage(AppImages.profile),
                    ),
                    UIHelper.horizontalSpace(8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 270.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Cameron Williamson",style: TextFontStyle.textStyle14PoppinsW500,),
                              Text("Trip ID",style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: const Color(0xFF637381)),)
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 270.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(AppIcons.star1,),
                                  UIHelper.horizontalSpace(5.w),
                                  Text("4.9",style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: const Color(0xFF637381)),)
                                ],
                              ),
                              Text("# S458SFV",style: TextFontStyle.textStyle14PoppinsW500,),

                            ],
                          ),
                        ),


                      ],
                    )
                  ],
                ),
                UIHelper.verticalSpace(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pickup Number",style: TextFontStyle.textStyle14PoppinsW400.copyWith(color: const Color(0xFF637381)),),
                    Text("A-1545-H25",style: TextFontStyle.textStyle14PoppinsW500,),

                  ],
                ),
                UIHelper.verticalSpace(16.h),
                Divider(
                  height: 2.h,
                  color: Colors.black54,
                ),
                UIHelper.verticalSpace(24.h),
                ChatWithDriver(),
                UIHelper.verticalSpace(24.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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



class ChatWithDriver extends StatefulWidget {
  const ChatWithDriver({super.key});

  @override
  _ChatWithDriverState createState() => _ChatWithDriverState();
}

class _ChatWithDriverState extends State<ChatWithDriver> {
  final TextEditingController _controller = TextEditingController();
  bool isTextEntered = false;

  @override
  void initState() {
    super.initState();
    // Listen for text changes
    _controller.addListener(() {
      setState(() {
        isTextEntered = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 250.w,
          child: CustomTextfield(
            controller: _controller, // Attach the controller
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(AppIcons.message),
            ),
            hintText: "Chat with driver",
            hintColor: const Color(0xFF637381),
            fillColor: const Color(0x0FD44F05),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (isTextEntered) {
              _controller.clear();
            }
          },
          child: Container(
            height: 50.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: const Color(0x0FD44F05),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Center(
              child: SvgPicture.asset(
                isTextEntered ? AppIcons.send : AppIcons.call, // Toggle icon
              ),
            ),
          ),
        )
      ],
    );
  }
}

