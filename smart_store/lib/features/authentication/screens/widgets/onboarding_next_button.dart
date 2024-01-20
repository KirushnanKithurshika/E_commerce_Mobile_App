import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_funtions.dart';

class OnBoardingNextButton extends StatelessWidget {
  final VoidCallback onButtonPressed; // Add this line

  const OnBoardingNextButton({
    Key? key,
    required this.onButtonPressed, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: onButtonPressed, // Change this line
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? TColors.primary : Colors.black,
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
