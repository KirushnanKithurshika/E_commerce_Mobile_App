import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_store/common/styles/spacing_styles.dart';
import 'package:smart_store/features/authentication/screens/signup.widgets/signup.dart';
import 'package:smart_store/utils/constants/text.strings.dart';
import 'package:smart_store/utils/helpers/helper_funtions.dart';


import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/onboarding_controller.dart';
import '../../password_configuration/forget_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return MaterialApp(
        theme: ThemeData(
        scaffoldBackgroundColor: dark ? Colors.black : Colors.white,),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                // Logo, title & sub_Title
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      height: 60,
                      image: AssetImage(
                        dark ? TImages.lightAppLogo : TImages.darkAppLogo,
                      ),
                    ),
                    Text(
                      TTexts.loginTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: TSizes.sm),
                    Text(
                      TTexts.loginSubTitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                // Form
                Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: TSizes.spaceBtwInputFields),
                    child: Column(
                      children: [
                        // Email
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.direct_right),
                            labelText:TTexts.email,
                            labelStyle: Theme.of(context).textTheme.bodySmall
                          ),
                        ),
                        const SizedBox(height: TSizes.spaceBtwInputFields),
                        TextFormField(
                          obscureText: true,
                          decoration:  InputDecoration(

                            prefixIcon: Icon(Iconsax.password_check),

                            labelText: TTexts.password,
                            labelStyle:Theme.of(context).textTheme.bodySmall,
                            suffixIcon: Icon(Iconsax.eye_slash),
                          ),
                        ),
                        const SizedBox(height: TSizes.spaceBtwInputFields / 2),
                        // Remember me or forget password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Remember me
                            Row(
                              children: [
                                Checkbox(
                                    value: true, onChanged: (value) {}),
                                 Text(TTexts.rememberMe,style:Theme.of(context).textTheme.labelSmall,),
                              ],
                            ),///  style: Theme.of(context).textTheme.bodyMedium
                            // Forget password
                            TextButton(
                              onPressed: ()=> Get.to(()=> const ForgetPassword()),
                              child:  Text(TTexts.forgetPassword,style:Theme.of(context).textTheme.labelSmall),
                            ),
                          ],
                        ),
                        const SizedBox(height: TSizes.spaceEtwSections),
                        // Sign in button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => const NavigationMenu()),
                            child: Text(TTexts.signIn,style: Theme.of(context).textTheme.labelSmall?.copyWith(

                                color: Color(0xC3A314B2)),
                          ),
                        ),
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () => Get.to(()=> const SignupScreen()),
                            child: Text(TTexts.createAccount,style:Theme.of(context).textTheme.labelSmall),
                          ),
                        ),
                        const SizedBox(height: TSizes.spaceEtwSections),
                      ],
                    ),
                  ),
                ),
                // Divider
                const SizedBox(height: TSizes.spaceEtwSections),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Divider(
                        color: dark ? TColors.darkGrey : TColors.grey,
                        thickness: 0.5,
                        indent: 60,
                        endIndent: 5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.spaceBtwItems),
                      child: Text(
                        TTexts.orSignInwith.capitalize!,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    Flexible(
                      child: Divider(
                        color: dark ? TColors.darkGrey : TColors.grey,
                        thickness: 0.5,
                        indent: 5,
                        endIndent: 60,
                      ),
                    ),
                  ],
                ),
                // Footer
                const SizedBox(height: TSizes.spaceBtwInputFields),

                    const SizedBox(width: TSizes.spaceBtwItems),Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: TColors.grey),
                              borderRadius: BorderRadius.circular(100)),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Image(
                              width: TSizes.iconMd,
                              height: TSizes.iconMd,
                              image: AssetImage(TImages.google),
                            ),
                          ),
                        ),

                        const SizedBox(width: TSizes.spaceBtwItems),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: TColors.grey),
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Image(
                          width: TSizes.iconMd,
                          height: TSizes.iconMd,
                          image: AssetImage(TImages.facebook),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
