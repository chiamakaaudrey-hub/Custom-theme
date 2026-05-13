import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:t_store/features/authentication/screens/signup/signup.dart';
import 'package:t_store/navigation_menu.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),

            /// Password
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value){}),
                    Text(TTexts.rememberMe),
                  ],
                ),
                /// Forget Password
                TextButton(onPressed: () => Get.to(() => ForgetPassword()), child: Text(TTexts.forgetPassword)),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => NavigationMenu()), child: Text(TTexts.signIn))),
            SizedBox(height: TSizes.spaceBtwItems),

            /// Create Account button
            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => SignupScreen()),
                child: Text(TTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
