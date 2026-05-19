import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';

import '../../../../utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              TSectionHeading(title: 'Brands', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwItems),

              /// -- Brands
              TGridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => TBrandCard(
                    showBorder: true,
                    onTap: () => Get.to(() => BrandProducts()),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}

