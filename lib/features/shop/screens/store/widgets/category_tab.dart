import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_brands.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;


  @override
  Widget build(BuildContext context) {

    final controller = CategoryController.instance;

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// -- Brands
            CategoryBrands(category: category),
            SizedBox(height: TSizes.spaceBtwItems),
      
            /// -- Products
            FutureBuilder(
              future: controller.getCategoryProducts(categoryId: category.id),
              builder: (context, snapshot) {

                final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: TVerticalProductShimmer());
                if (response != null) return response;

                final products = snapshot.data!;

                return Column(
                  children: [
                    TSectionHeading(
                      title: 'You might like',
                      onPressed: () => Get.to(AllProducts(
                        title: category.name,
                        futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                )),
                    ),
                    SizedBox(height: TSizes.spaceBtwItems),
                    TGridLayout(itemCount: products.length, itemBuilder: (_, index) => TProductCardVertical(product: products[index])),
                    SizedBox(height: TSizes.spaceBtwSections),
                  ],
                );
              }
            ),
          ],
        ),
      ),
    ],
    );
  }
}
