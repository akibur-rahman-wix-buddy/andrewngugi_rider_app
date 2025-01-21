import 'package:andrewngugi_rider_app/assets_helper/app_image/app_image.dart';


class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Track Your work and get the result",
    image: AppImages.onboardingImageOne,
    desc: "Remember to keep track of your professional accomplishments.",
  ),
  OnboardingContents(
    title: "Stay organized with team",
    image: AppImages.onboardingImageTwo,
    desc:
        "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnboardingContents(
    title: "Get notified when work happens",
    image: AppImages.onboardingImageThree,
    desc:
        "Take control of notifications, collaborate live or on your own time.",
  ),
];
