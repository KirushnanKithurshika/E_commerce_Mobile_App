import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";

import "../../../features/authentication/screens/onboarding/login/login.dart";
import "../../../utils/constants/image_strings.dart";
import "../../../utils/constants/sizes.dart";
import "../../../utils/constants/text.strings.dart";
import "../../styles/spacing_styles.dart";

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SingleChildScrollView(
        child:Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight *2,
          child:Column(
            children: [const Image(
              image: AssetImage(TImages.success),
              width: 250,
              height: 150,
            ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.accountcreatedSuccessfully,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              Text(
                TTexts.quoteaboutShopping,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceEtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  child: Text(
                    TTexts.tContinue,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.cyan),
                  ),
                ),
              ),

            ],
          )
        )

      ),
    );
  }
}
