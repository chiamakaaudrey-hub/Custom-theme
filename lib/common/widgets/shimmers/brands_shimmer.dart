import 'package:flutter/cupertino.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import '../brands/brand_card.dart';
import '../layout/grid_layout.dart';

class TBrandsShimmer extends StatelessWidget {
  const TBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      mainAxisExtent: 80,
      itemBuilder: (_, __) => TShimmerEffect(width: 300, height: 80),
    );
  }
}
