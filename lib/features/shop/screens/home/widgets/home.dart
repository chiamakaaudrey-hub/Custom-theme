import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:t_store/utils/constants/colors.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved-edges-widget.dart';
import '../../../../../common/widgets/product.cart/cart_menu_icon.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'home_appbar.dart';

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
                    TAppHomeBar(),
                    /// Searchbar -- Tutorial [Section #3, Video #4]
                    /// Categories -- Tutorial [Section #3, Video #4]
                  ],
                ),
                ),
          ],
        ),
      ),
    );
  }
}














