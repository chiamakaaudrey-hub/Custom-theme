import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/sizes.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Profile')),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
            children: [
            /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageUploading.value
                          ? TShimmerEffect(width: 80, height: 80, radius: 80)
                          : TCircularImage(image: TImages.user, width: 80, height: 80, padding: TSizes.sm, isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: Text('Change Profile Picture')),
                  ],
                ),
              ),

              /// Details
              SizedBox(height: TSizes.spaceBtwItems / 2),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Profile Info
              TSectionHeading(title: 'Profile Information', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'Name', value: controller.user.value.fullName, onPressed: () => Get.to(() => ChangeName())),
              TProfileMenu(title: 'Username', value: controller.user.value.username, onPressed: (){}),

              SizedBox(height: TSizes.spaceBtwItems),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Personal Info
              TSectionHeading(title: 'Personal Information', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'User ID', value: '12345 ', icon: Iconsax.copy, onPressed: (){}),
              TProfileMenu(title: 'E-mail', value: 'chiamakaaudrey@gmail.com', onPressed: (){}),
              TProfileMenu(title: 'Phone Number', value: '+2349138863502', onPressed: (){}),
              TProfileMenu(title: 'Gender', value: 'Female', onPressed: (){}),
              TProfileMenu(title: 'Date of Birth', value: '15 May, 1994', onPressed: (){}),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: Text('Close Account', style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


