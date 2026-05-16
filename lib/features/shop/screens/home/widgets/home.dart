import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved-edges-widget.dart';
import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'home_appbar.dart';
import 'home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header -- Tutorial [Section #3, Video #2]
            TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    /// -- AppBar -- Tutorial [Section #3, Video #3]
                    TAppHomeBar(),
                    SizedBox(height: TSizes.spaceBtwSections),

                    /// Searchbar -- Tutorial [Section #3, Video #4]
                    TSearchContainer(text: 'Search in Store', padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace)),
                      SizedBox(height: TSizes.spaceBtwSections),
                    
                    /// Categories -- Tutorial [Section #3, Video #4]
                    Padding(padding: EdgeInsets.only(left: TSizes.defaultSpace),
                      child: Column(
                        children: [

                          /// -- Heading
                        TSectionHeading(title: 'Popular Categories', showActionButton: false, textColor: Colors.white),
                          SizedBox(height: TSizes.spaceBtwItems),

                          /// -- Categories
                          THomeCategories(),
                      ],),),
                    ],
                ),
                ),
            /// -- Body -- Tutorial [Section #3, Video #5]
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
              children: [
                /// -- Promo Slider -- Tutorial [Section #3, Video #6]
                TPromoSlider(banners: [TImages.promoBanner1, TImages.promoBanner2, TImages.promoBanner3]),
                SizedBox(height: TSizes.spaceBtwSections),

                /// -- Heading
                TSectionHeading(title: 'Popular Products', onPressed: (){}),
                SizedBox(height: TSizes.spaceBtwItems),

                /// -- Popular Products -- Tutorial [Section #3, Video #7]
                TGridLayout(itemCount: 2, itemBuilder: (_, index) => TProductCardVertical()),
    ],
    )
            )
          ],
        ),
      ),
    );
  }
}

























