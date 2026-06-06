import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/product/variation_controller.dart';

import '../features/shop/controllers/product/cart_controller.dart';
import '../utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(CartController());
  }
}