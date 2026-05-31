import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product_controller.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
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
                    SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
                ),
            /// -- Body -- Tutorial [Section #3, Video #5]
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
              children: [
                /// -- Promo Slider -- Tutorial [Section #3, Video #6]
                TPromoSlider(),
                SizedBox(height: TSizes.spaceBtwSections),

                /// -- Heading
                TSectionHeading(title: 'Popular Products', onPressed: () => Get.to(() => AllProducts())),
                SizedBox(height: TSizes.spaceBtwItems),

                /// -- Popular Products -- Tutorial [Section #3, Video #7]
                
                Obx(() {
                  if(controller.isLoading.value) return TVerticalProductShimmer();

                  if(controller.featuredProducts.isEmpty) {
                    return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                  }
                  return TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => TProductCardVertical(product: controller.featuredProducts[index]),
                  );
                }),
    ],
        ),
      ),
    ]),
      ),);
  }
}

























