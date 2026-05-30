import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/popups/loaders.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../personalization/models/user_model.dart';
import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // Observable for showing/hiding password
  final privacyPolicy = true.obs; // Observable for privacy policy acceptance
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form Key for form validation

  /// -- SIGN UP
  Future<void> signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information ...',
        TImages.docerAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the Privacy Policy & Terms of use.',
        );
        return;
      }
      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save authenticated user data in the Firebase Firestone
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue',
      );

      // Move to verify email screen
      Get.to(() => SuccessScreen(title: TTexts.yourAccountCreatedTitle, subTitle: TTexts.yourAccountCreatedSubTitle, onPressed: () => Get.to(() => NavigationMenu())));

    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}


