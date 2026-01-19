import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../data/mock_data.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  String _selectedCategory = 'All';
  String _searchQuery = '';
  String _sortBy = 'default';

  ProductProvider() {
    _products = MockData.products;
  }

  List<Product> get products {
    List<Product> filteredProducts = _products;

    if (_selectedCategory != 'All') {
      filteredProducts = filteredProducts
          .where((product) => product.category == _selectedCategory)
          .toList();
    }

    if (_searchQuery.isNotEmpty) {
      filteredProducts = filteredProducts
          .where((product) =>
              product.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              product.description.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }

    switch (_sortBy) {
      case 'price_low':
        filteredProducts.sort((a, b) => a.finalPrice.compareTo(b.finalPrice));
        break;
      case 'price_high':
        filteredProducts.sort((a, b) => b.finalPrice.compareTo(a.finalPrice));
        break;
      case 'rating':
        filteredProducts.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'popularity':
        filteredProducts.sort((a, b) => b.reviewCount.compareTo(a.reviewCount));
        break;
      default:
        break;
    }

    return filteredProducts;
  }

  List<Product> get trendingProducts {
    return _products.where((product) => product.reviewCount > 100).toList()
      ..sort((a, b) => b.reviewCount.compareTo(a.reviewCount));
  }

  List<Product> get discountedProducts {
    return _products.where((product) => product.hasDiscount).toList();
  }

  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;
  String get sortBy => _sortBy;

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setSortBy(String sortBy) {
    _sortBy = sortBy;
    notifyListeners();
  }

  void clearFilters() {
    _selectedCategory = 'All';
    _searchQuery = '';
    _sortBy = 'default';
    notifyListeners();
  }

  Product? getProductById(String id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Product> getProductsByCategory(String category) {
    if (category == 'All') return _products;
    return _products.where((product) => product.category == category).toList();
  }
}
