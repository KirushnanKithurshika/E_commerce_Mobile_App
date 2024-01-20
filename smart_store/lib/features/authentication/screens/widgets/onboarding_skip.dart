import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_store/features/authentication/controllers/onboarding_controller.dart';
import 'package:smart_store/features/authentication/screens/onboarding/login/login.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_funtions.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(top:TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>const LoginScreen()));
        },
        child: Text('skip'),
      ),

    );
  }
}

