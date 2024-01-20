import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_store/common/widgets/custom_shapes/appbar/appbar.dart';
import 'package:smart_store/utils/device/device_utility.dart';

import '../../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../../common/widgets/products.cart/product_card_vertical.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text.strings.dart';

import '../../../../../utils/helpers/helper_funtions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const THomeAppBar(),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TSearchContainer(text: 'Search in store'),
            const SizedBox(height: TSizes.spaceEtwSections),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child:Column(
                children:[
                  TPromoSlider(),

                  //TProductCardVertical(),
        

                ],


            ),
            ),
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: AssetImage(TImages.banner1),
                //
            ),
          ),

        )

        )
        ],
        ),
      ),
    );
  }
}

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({

    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width ,
    this.height ,
    this.applyImageRadius = true,
    required this. imageUrl,
    this.fit= BoxFit.contain,
    this.backgroundColor = TColors. light,
    this.isNetworkImage = false, required this.borderRadius,
  });
  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
        border: border,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(TSizes.md),
    image: DecorationImage(
    image: AssetImage(TImages.banner1),
    fit: BoxFit.cover,  // You can adjust the fit as per your requirement
    ),
    ),
      )
    );



  }
}

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        children: [
          const TSectionHeading(
            title: 'Popular categories',
            showActionButton: false,
            buttonTitle: '',
          ),
          const SizedBox(height: TSizes.spaceEtwSections),
          SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                // Change the image and title for each item
                String itemImage;
                String itemTitle;

                // Assign different image and title based on the index
                switch (index) {
                  case 0:
                    itemImage = TImages.shoe;
                    itemTitle = 'Shoes';
                    break;
                  case 1:
                    itemImage = TImages.clothes;
                    itemTitle = 'Clothing';
                    break;
                  case 2:
                    itemImage = TImages.toys;
                    itemTitle = 'Toys';
                    break;
                  case 3:
                    itemImage = TImages.live;
                    itemTitle = 'Home Decor';
                    break;
                  case 4:
                    itemImage = TImages.cosmetic;
                    itemTitle = 'Cosmetics';
                    break;
                  case 5:
                    itemImage = TImages.sports;
                    itemTitle = 'Sports';
                    break;
                  default:
                    itemImage = TImages.jewelry;
                    itemTitle = 'Jewelry';
                }

                return TVerticalImageText(
                  image: itemImage,
                  title: itemTitle,
                  onTap: () {
                    // Handle onTap for each item.
                    print('$itemTitle tapped!');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    Key? key,
    required this.image,
    required this.title,
    this.textColor = Colors.purple,
    this.backgroundColor = Colors.grey,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            // Circular icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? TColors.black : TColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 4),
            SizedBox(
              width: 40,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.purple),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    Key? key,
    this.textColor,
    required this.showActionButton,
    required this.title,
    required this.buttonTitle,
    this.onPressed,
  }) : super(key: key);

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Popular Categories',
          style: Theme.of(context).textTheme.headline6,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle)),
      ],
    );
  }
}

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    Key? key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBoarder = true,
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final bool showBackground, showBoarder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: showBoarder ? Border.all(color: Colors.cyan) : null,
        ),
        child: Row(
          children: [
            Icon(icon, color: TColors.darkerGrey),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              'Search in store',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        children: [
          Text(
            "Good day for shopping!!!",
            style: Theme.of(context).textTheme.headline5!.apply(color: Colors.cyan),
          ),
          Text(
            "Nevaasshahan ",

            style: Theme.of(context).textTheme.headline4!.apply(color: TColors.darkGrey),
          ),
        ],
      ),
      actions: [
        TCartCounterIcon(
          onPressed: () {},
          iconColor: Colors.purple,
        ),
      ],
    );
  }
}

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    Key? key,
    required this.onPressed,
    required this.iconColor,
  }) : super(key: key);

  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.shopping_bag, color: Colors.purple),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: TColors.grey.withOpacity(1),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.headline6!.apply(color: TColors.white, fontSizeFactor: 0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
