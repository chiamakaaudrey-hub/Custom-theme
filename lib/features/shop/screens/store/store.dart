import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart' show GetNavigation;
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium,),
          actions: [
            TCartCounterIcon(onPressed: () {}, iconColor: Colors.white),
          ],
        ),

        /// -- Header -- Tutorial [Section #3, Video #7]
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,

                flexibleSpace: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [

                      /// -- Search Bar
                      SizedBox(height: TSizes.spaceBtwItems),
                      TSearchContainer(
                        text: 'Search in Store',
                        padding: EdgeInsets.symmetric(
                          horizontal: TSizes.defaultSpace,
                        ),
                        showBorder: true,
                        showBackground: false,
                      ),
                      SizedBox(height: TSizes.spaceBtwSections),

                      /// -- Featured Brands
                      TSectionHeading(
                        title: 'Featured Brands',
                        showActionButton: true,
                        onPressed: () => Get.to(()  => TBrandCard(showBorder: true)),
                      ),
                      SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      /// Brands GRID
                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return TBrandCard(showBorder: true);
                        },
                      ),
                    ],
                  ),
                ),

                /// -- Tabs -- Tutorial [Section #3, Video #8]
                bottom: TTabBar(
                  tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
                ),
            ];
          },

          /// -- Body -- Tutorial [Section #3, Video #8]
          body: TabBarView(
            children: categories.map((category) => TCategoryTab(category: category)).toList(),
          ),
        ),
      ),
    );
  }
}























