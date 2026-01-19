import 'package:flutter/foundation.dart';
import '../models/address.dart';
import '../data/mock_data.dart';

class AddressProvider with ChangeNotifier {
  List<Address> _addresses = [];

  AddressProvider() {
    _addresses = MockData.sampleAddresses;
  }

  List<Address> get addresses => [..._addresses];

  Address? get defaultAddress {
    try {
      return _addresses.firstWhere((address) => address.isDefault);
    } catch (e) {
      return _addresses.isNotEmpty ? _addresses.first : null;
    }
  }

  void addAddress(Address address) {
    if (address.isDefault) {
      _addresses = _addresses.map((addr) => addr.copyWith(isDefault: false)).toList();
    }
    _addresses.add(address);
    notifyListeners();
  }

  void updateAddress(String id, Address updatedAddress) {
    final index = _addresses.indexWhere((address) => address.id == id);
    if (index >= 0) {
      if (updatedAddress.isDefault) {
        _addresses = _addresses.map((addr) => addr.copyWith(isDefault: false)).toList();
      }
      _addresses[index] = updatedAddress;
      notifyListeners();
    }
  }

  void deleteAddress(String id) {
    _addresses.removeWhere((address) => address.id == id);
    notifyListeners();
  }

  void setDefaultAddress(String id) {
    _addresses = _addresses.map((address) {
      return address.copyWith(isDefault: address.id == id);
    }).toList();
    notifyListeners();
  }

  Address? getAddressById(String id) {
    try {
      return _addresses.firstWhere((address) => address.id == id);
    } catch (e) {
      return null;
    }
  }
}
