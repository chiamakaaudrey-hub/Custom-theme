import 'package:flutter/material.dart';
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
    this.onTap
  });

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
              /// -- Icon (Never add overlayColor
              Flexible(
                child: TCircularImage(
                  isNetworkImage: false,
                  image: TImages.clothIcon,
                  backgroundColor: Colors.transparent,
                  padding: TSizes.sm,
                  //overlayColor: isDark ? TColors.white : TColors.black,

                ),
              ),
              SizedBox(width: TSizes.spaceBtwItems / 2),

              /// -- Text
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TBrandTitleTextWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large),
                    Text(
                      '25 Products',
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
