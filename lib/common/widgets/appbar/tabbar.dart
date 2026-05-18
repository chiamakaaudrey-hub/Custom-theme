import 'package:flutter/material.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../utils/constants/colors.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// If you want to add the background color to tabs. you have to wrap them in Material Widget
  /// To do that, we need [PreferredSized] Widget and that'ratings why I created custom class [PreferredSizeWidget]
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? TColors.black :TColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
        labelColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.primary,
      )
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}











