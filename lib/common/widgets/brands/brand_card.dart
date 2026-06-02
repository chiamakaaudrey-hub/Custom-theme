import 'package:flutter/material.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/images/t_circular_image.dart';
import '../../../../common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.showBorder = true,
    this.onTap,
    required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      /// Container Design
      child: TRoundedContainer(
        padding: EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        radius: TSizes.cardRadiusXs,
        borderColor: TColors.white,
        backgroundColor: Colors.transparent,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// -- Icon (Never add overlayColor)
              Flexible(
                child: TCircularImage(
                  isNetworkImage: true,
                  image: brand.image,
                  backgroundColor: Colors.transparent,
                  padding: TSizes.sm,
                  //overlayColor: isDark ? TColors.white : TColors.black,

                ),
              ),
              SizedBox(width: TSizes.spaceBtwItems / 2),

              /// -- Texts
              // [Expanded] & Column [MainAxisSize.min] is important to keep the elements in the vertical center and also
              // to keep text inside the boundaries
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TBrandTitleTextWithVerifiedIcon(title: brand.name, brandTextSize: TextSizes.large),
                    Text(
                      '${brand.productsCount ?? 0} products',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge,

                    )
                  ],
                ),
              )
            ]
        ),
      ),
    );
  }
}
