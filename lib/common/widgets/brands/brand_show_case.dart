import 'package:flutter/material.dart';

import '../../../features/shop/screens/store/store.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key, required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      radius: TSizes.cardRadiusSm,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(TSizes.md),
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(children: [

        /// Brands with Product Counts
        TBrandCard(showBorder: false),
        SizedBox(height: TSizes.spaceBtwItems),

        /// Brand Top 3 Product Images
        Row(
          children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
        )
      ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: TRoundedContainer(
      height: 100,
      radius: TSizes.cardRadiusXs,
      borderColor: Colors.transparent,
      backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
      margin: EdgeInsets.only(right: TSizes.sm),
      padding: EdgeInsets.all(TSizes.md),
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}