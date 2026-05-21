import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../common/widgets/loaders/animation_loader.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) =>
          PopScope(
            canPop: false, // Disable popping with the back button
            child: Container(
              color: THelperFunctions.isDarkMode(Get.context!)
                  ? TColors.dark
                  : TColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 250), // Adjust the spacing as needed
                  TAnimationLoaderWidget(text: text, animation: animation),
                ],
              ),

            ),
          ),
    );
  }

  static void stopLoading() {
    Navigator
        .of(Get.overlayContext!)
        .pop(); //Close the dialog using the navigator
  }

}
