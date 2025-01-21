import 'package:andrewngugi_rider_app/assets_helper/app_colors/app_colors.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_font/app_font.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_icons/app_icons.dart';
import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_appbar.dart';
import 'package:andrewngugi_rider_app/common_widgets/custom_button.dart';
import 'package:andrewngugi_rider_app/drivers_side_features/auth/widget/custom_userProfile_text_field.dart';
import 'package:andrewngugi_rider_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  TextEditingController amountController = TextEditingController();

  int? _selectedCardIndex;

  void _onCardSelected(int index) {
    setState(() {
      _selectedCardIndex = index; // Update the selected card index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImages.bgImage)),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(
            title: "Withdraw",
            isCenterd: true,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      AppImages.withdraw,
                      height: 163.h,
                      width: 200.w,
                    ),
                  ),
                  UIHelper.verticalSpace(24.h),
                  CustomUserprofileTextField(
                    keyBoardType: TextInputType.number,
                    controller: amountController,
                    hintText: "Enter your amount",
                    title: "Amount",
                    wight: double.infinity,
                  ),
                  UIHelper.verticalSpace(16.h),
                  Text(
                    "Choose your payment method!",
                    style: TextFontStyle.textStyle16PoppinsW600,
                  ),
                  UIHelper.verticalSpace(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomPayCard(
                        icon: AppIcons.applePay,
                        isSelected: _selectedCardIndex == 0,
                        onSelect: () => _onCardSelected(0),
                      ),
                      CustomPayCard(
                        icon: AppIcons.paypal,
                        isSelected: _selectedCardIndex == 1,
                        onSelect: () => _onCardSelected(1),
                      ),
                      CustomPayCard(
                        icon: AppIcons.stipe,
                        isSelected: _selectedCardIndex == 2,
                        onSelect: () => _onCardSelected(2),
                      ),
                      CustomPayCard(
                        icon: AppIcons.gogglePay,
                        isSelected: _selectedCardIndex == 3,
                        onSelect: () => _onCardSelected(3),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(200.h),
                  customButton(
                    name: "Withdraw",
                    onCallBack: () {},
                    color: AppColor.buttonColor,
                    borderColor: Colors.transparent,
                    context: context,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPayCard extends StatelessWidget {
  const CustomPayCard({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onSelect,
  });

  final String icon;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        margin: EdgeInsets.all(2.sp),
        width: 77.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: SvgPicture.asset(
                icon,
                height: 40.h,
                width: 60.w,
              ),
            ),
            if (isSelected)
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  height: 15.h,
                  width: 15.w,
                  decoration: const BoxDecoration(
                    color: AppColor.buttonColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: SvgPicture.asset(AppIcons.right),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
