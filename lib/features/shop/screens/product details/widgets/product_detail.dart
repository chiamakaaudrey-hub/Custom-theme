import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/features/shop/screens/product%20details/widgets/product_detail_image_slider.dart';
import 'package:t_store/features/shop/screens/product%20details/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product%20details/widgets/rating_share_widget.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/curved_edges/curved-edges-widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            TProductImageSlider(),

            /// 2 - Product Details
            Padding(
                padding: EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
                child: Column(
                  children: [
                    /// -- Rating & Share Button
                    TRatingAndShare(),

                    /// -- Price, Title, Stock & Brand
                    TProductMetaData(),

                    /// -- Attributes
                    /// -- Checkout Button
                    /// -- Description
                    /// -- Reviews
                  ],
                ) ,
            ),
          ],
        ),
      ),
    );
  }
}




