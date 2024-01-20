import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_store/features/authentication/controllers/onboarding_controller.dart';
import 'package:smart_store/features/authentication/screens/widgets/onboarding_dot_navigation.dart';
import 'package:smart_store/features/authentication/screens/widgets/onboarding_next_button.dart';
import 'package:smart_store/features/authentication/screens/widgets/onboarding_page.dart';
import 'package:smart_store/features/authentication/screens/widgets/onboarding_skip.dart';
import 'package:smart_store/utils/constants/image_strings.dart';
import '../../../utils/constants/text.strings.dart';
import 'onboarding/login/login.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // OnBoarding Controller to handle Logic
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.shopping1,
                title: TTexts.onBoardingSubTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.shopping2,
                title: TTexts.onBoardingSubTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.shopping3,
                title: TTexts.onBoardingSubTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          // Skip button
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          OnBoardingNextButton(
            onButtonPressed: () {
              // If on the last page, navigate to the login page
              if (controller.currentPageIndex.value == 2) {
                Get.offAll(const LoginScreen());
              } else {
                // If not on the last page, navigate to the next onboarding page
                controller.nextPage();
              }
            },
          ),
        ],
      ),
    );
  }
}
