import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/product%20reviews/widgets/rating_progress_indicator.dart';
import 'package:t_store/features/shop/screens/product%20reviews/widgets/user_review_card.dart';
import 'package:t_store/utils/constants/sizes.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class TProductReviewScreen extends StatelessWidget {
  const TProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar: TAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ratings and reviews are verified and are from people who use the same type of device that you use'),
                SizedBox(height: TSizes.spaceBtwItems),

                /// Overall Product Ratings
                TOverallProductRating(),
                TRatingBarIndicator(rating: 3.5),
                Text('12,611', style: Theme.of(context).textTheme.bodySmall),
                SizedBox(height: TSizes.spaceBtwSections),

                /// User Reviews List
                UserReviewCard(),
                UserReviewCard(),
                UserReviewCard(),
                UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}





