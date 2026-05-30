import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/routes/routes.dart';

import '../../features/personalization/models/address_model.dart';
import '../../features/shop/models/banner_model.dart';
import 'image_strings.dart';

class TDummyData {
  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImages.banner3,
        targetScreen: TRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(imageUrl: TImages.banner5,
        targetScreen: TRoutes.settings,
        active: true),
    BannerModel(imageUrl: TImages.banner6,
        targetScreen: TRoutes.userAddress,
        active: true),
    BannerModel(imageUrl: TImages.banner8,
        targetScreen: TRoutes.checkout,
        active: false),
  ];

  /// -- User
  static final UserModel user = UserModel(id: '', username: '',
      firstName: 'Chiamaka',
      lastName: 'Audrey',
      email: 'chiamakaaudrey@gmail.com',
      phoneNumber: '1234567890',
      profilePicture: TImages.user,
      addresses: [
        AddressModel(
          id: '1',
          name: 'Chiamaka',
          phoneNumber: '1234567890',
          street: 'Ochi Street',
          city: 'Enugu',
          state: 'Enugu',
          postalCode: '400107',
          country: 'Nigeria'
        ),
        AddressModel(
          id: '6',
          name: 'John Doe',
            phoneNumber: '1234567890',
            street: 'Akokwa',
            city: 'Imo',
            state: 'Imo',
            postalCode: '400107',
            country: 'Nigeria'
        ),
      ],
  );

  /// -- Cart

  /// -- Order
}










