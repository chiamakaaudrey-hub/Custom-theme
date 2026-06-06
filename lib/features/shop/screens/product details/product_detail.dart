import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/product%20details/widgets/bottom_add_to_cart_widget.dart';
import 'package:t_store/features/shop/screens/product%20details/widgets/product_attributes.dart';
import 'package:t_store/features/shop/screens/product%20details/widgets/product_detail_image_slider.dart';
import 'package:t_store/features/shop/screens/product%20details/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product%20details/widgets/rating_share_widget.dart';
import 'package:t_store/features/shop/screens/product%20reviews/product_reviews.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../utils/constants/enums.dart';
import '../../models/product_model.dart';


class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
             TProductImageSlider(product: product),

            /// 2 - Product Details
            Padding(
                padding: EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
                child: Column(
                  children: [
                    /// -- Rating & Share Button
                    TRatingAndShare(),

                    /// -- Price, Title, Stock & Brand
                    TProductMetaData(product: product),

                    /// -- Attributes
                    if(product.productType == ProductType.variable.toString()) TProductAttributes(product: product,),
                    if(product.productType == ProductType.variable.toString()) SizedBox(height: TSizes.spaceBtwSections),

                    /// -- Checkout Button
                    SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Checkout'))),
                    SizedBox(height: TSizes.spaceBtwItems),
                    
                    /// -- Description
                    TSectionHeading(title: 'Description', showActionButton: false),
                    SizedBox(height: TSizes.spaceBtwItems),
                    ReadMoreText(product.description ?? '',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Less',
                      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),

                    /// -- Reviews
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TSectionHeading(title: 'Reviews (199)', showActionButton: false),
                            IconButton(icon: Icon(Iconsax.arrow_right_3, size: 18), onPressed: () => Get.to(() => ProductReviewScreen())),
                      ],
                    ),
                    SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ) ,
            ),
          ],
        ),
      ),
    );
  }
}




