import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/features/shop/controllers/product/order_controller.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());

    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          /// Nothing found Widget
          final emptyWidget = TAnimationLoaderWidget(
              text: 'Whoops! No Orders Yet!',
              animation: TImages.orderCompletedAnimation,
              showAction: true,
              actionText: 'Let\'s fill it',
              onActionPressed: () => Get.off(() => NavigationMenu()),
          );

          /// Helper Function: Handle Loader, No Record or ERROR message
          final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          /// Congratulations Record found.
          final orders = snapshot.data!;
          return ListView.separated(
            shrinkWrap: true,
            itemCount: orders.length,
            separatorBuilder: (_, index) => SizedBox(height: TSizes.spaceBtwItems),
            itemBuilder: (_, index) {
              final order = orders[index];
              return TRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(TSizes.md),
                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
                radius: TSizes.cardRadiusLg,
                borderColor: TColors.borderPrimary,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// -- Top Row
                    Row(
                      children: [
                        /// 1 - Image
                        Icon(Iconsax.ship),
                        SizedBox(width: TSizes.spaceBtwItems / 2),

                        /// 2 - Status &  Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(order.orderStatusText,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary, fontWeightDelta: 1),
                              ),
                              Text(order.formattedOrderDate, style: Theme.of(context).textTheme.headlineSmall),
                            ],
                          ),
                        ),

                        /// 3 - Icon
                        IconButton(onPressed: () {}, icon: Icon(Iconsax.arrow_right_34, size: TSizes.iconSm),
                        ),
                      ],
                    ),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// -- Bottom Row
                    Row(
                      children: [
                        /// Order No
                        Expanded(
                          child: Row(
                            children: [
                              /// 1 - Icon
                              Icon(Iconsax.tag),
                              SizedBox(width: TSizes.spaceBtwItems / 2),

                              /// Order
                              Flexible(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Order', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium,
                                      ),
                                      Text(order.id, maxLines: 1, style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    ],
                                  ),
                                ),
                          ],
                          ),
                        ),

                        /// -- Delivery Date
                        Expanded(
                          child: Row(
                            children: [
                              /// 1 - Icon
                              Icon(Iconsax.calendar),
                              SizedBox(width: TSizes.spaceBtwItems / 2),

                              /// 2 - Status &  Date
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Shipping Date', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                    Text(order.formattedDeliveryDate, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],),
                  ],
                ),
              );
            }
            );

        },
    );






        }
}
