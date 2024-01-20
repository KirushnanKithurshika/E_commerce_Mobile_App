import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

import '../../../../utils/helpers/helper_funtions.dart'; // Corrected import statement

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    Key? key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true, // Corrected variable name to showBorder
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder; // Corrected variable name to showBorder

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: showBackground
              ? dark
              ? TColors.white
              : TColors.light
              : Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: Colors.cyan) : null, // Corrected variable name to showBorder
        ),
        child: Row(
          children: [
            Icon(Iconsax.search_normal, color: TColors.darkerGrey),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              'Search in store',
              style: Theme.of(context).textTheme.bodyText2, // Corrected: Use bodyText2
            ),
          ],
        ),
      ),
    );
  }
}
