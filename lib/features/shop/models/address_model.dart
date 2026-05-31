import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  final String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final bool selectedAddress;

  const AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.selectedAddress = false,
  });

  /// Empty Address
  static AddressModel empty() => const AddressModel(
    id: '',
    name: '',
    phoneNumber: '',
    street: '',
    city: '',
    state: '',
    postalCode: '',
    country: '',
  );

  /// Convert Address to JSON
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'PhoneNumber': phoneNumber,
      'Street': street,
      'City': city,
      'State': state,
      'PostalCode': postalCode,
      'Country': country,
      'SelectedAddress': selectedAddress,
    };
  }

  /// Create Address from Firestore Document
  factory AddressModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();

    if (data == null) return AddressModel.empty();

    return AddressModel(
      id: document.id,
      name: data['Name'] ?? '',
      phoneNumber: data['PhoneNumber'] ?? '',
      street: data['Street'] ?? '',
      city: data['City'] ?? '',
      state: data['State'] ?? '',
      postalCode: data['PostalCode'] ?? '',
      country: data['Country'] ?? '',
      selectedAddress: data['SelectedAddress'] ?? false,
    );
  }

  /// Create Address from Map
  factory AddressModel.fromMap(Map<String, dynamic> data) {
    return AddressModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      phoneNumber: data['PhoneNumber'] ?? '',
      street: data['Street'] ?? '',
      city: data['City'] ?? '',
      state: data['State'] ?? '',
      postalCode: data['PostalCode'] ?? '',
      country: data['Country'] ?? '',
      selectedAddress: data['SelectedAddress'] ?? false,
    );
  }

  /// Full formatted address
  String get formattedAddress {
    return '$street, $city, $state, $postalCode, $country';
  }
}
