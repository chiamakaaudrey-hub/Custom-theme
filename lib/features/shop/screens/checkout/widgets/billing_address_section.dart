import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../../common/widgets/texts/section_heading.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {}),
        Text('Coding With T', style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey, size: 16),
            SizedBox(width: TSizes.spaceBtwItems),
            Text('+92-317-8059525', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

        SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey, size: 16),
            SizedBox(width: TSizes.spaceBtwItems),
            Text('South Liana, Maine 87695, USA', style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
      ],
    );
  }
}
