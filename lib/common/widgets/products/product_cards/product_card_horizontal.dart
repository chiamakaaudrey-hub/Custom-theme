import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/t_circular_icon.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);

    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.lightContainer,
      ),
      child: Row(
        children: [
          /// Thumbnail
          TRoundedContainer(
            height: 120,
            padding: EdgeInsets.all(TSizes.sm),
            radius: TSizes.cardRadiusLg,
            borderColor: TColors.borderPrimary,
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                /// -- Thumbnail Image
                SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(imageUrl: product.thumbnail, borderRadius: TSizes.borderRadiusSm, applyImageRadius: true, isNetworkImage: true),
            ),

                  /// -- Sale Tag
              Positioned(
                top: 12,
                child: TRoundedContainer(
                  radius: TSizes.sm,
                  backgroundColor: TColors.secondary.withOpacity(0.8), borderColor: TColors.borderPrimary,
                  padding: EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                  child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
                ),
              ),
              /// -- Favorite Icon Button
              Positioned(
                  top: 0,
                  right: 0,
                  child: TFavouriteIcon(productId: product.id),
              ),
              ],
      ),
                ),
          SizedBox(width: TSizes.spaceBtwItems),

          /// Details, Add to cart & Pricing
          SizedBox(
            width: 150,
            child: Padding(
              padding: EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: product.title, smallSize: true),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      TBrandTitleTextWithVerifiedIcon(title: product.brand!.name),
                    ],
                  ),

                  Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      Flexible(
                        child: Column(
                          children: [
                            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                              Padding(
                                padding: EdgeInsets.only(left: TSizes.sm),
                                child: Text(
                                  product.price.toString(),
                                  style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                                ),
                              ),

                            /// Price, Show sale price as main price if sale exist
                            Padding(
                              padding: EdgeInsets.only(left: TSizes.sm),
                              child: TProductPriceText(price: controller.getProductPrice(product)),
                            ),
                          ],
                        ),
                      ),

                      /// Add to Cart Button
                      Container(
                        decoration: BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.productImageRadius),
                          ),
                        ),
                        child: SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(child: Icon(Iconsax.add, color: TColors.white)),
                        ),
                      ),
                    ],
                  ),
                ]),
            ),
          ),
      ],
    ),
    );
  }
}
