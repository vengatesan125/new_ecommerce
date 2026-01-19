import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/product_provider.dart';
import '../../providers/cart_provider.dart';
import '../../data/mock_data.dart';
import '../../widgets/product_card.dart';
import '../products/product_list_screen.dart';
import '../products/product_details_screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SmartCart'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue.shade700,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  Provider.of<ProductProvider>(context, listen: false)
                      .setSearchQuery(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductListScreen(),
                        ),
                      );
                    },
                    child: const Text('See All'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: MockData.categories.length,
                itemBuilder: (context, index) {
                  final category = MockData.categories[index];
                  return Consumer<ProductProvider>(
                    builder: (context, productProvider, _) {
                      final isSelected = productProvider.selectedCategory == category;
                      return GestureDetector(
                        onTap: () {
                          productProvider.setCategory(category);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductListScreen(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: 80,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.blue.shade700
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                _getCategoryIcon(category),
                                color: isSelected ? Colors.white : Colors.black54,
                                size: 32,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                category,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isSelected ? Colors.white : Colors.black87,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Trending Products',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Consumer<CartProvider>(
                    builder: (context, cart, _) {
                      return cart.itemCount > 0
                          ? Badge(
                              label: Text('${cart.itemCount}'),
                              child: IconButton(
                                icon: const Icon(Icons.shopping_cart),
                                onPressed: () {},
                              ),
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
            Consumer<ProductProvider>(
              builder: (context, productProvider, _) {
                final trendingProducts = productProvider.trendingProducts;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: trendingProducts.length > 6 ? 6 : trendingProducts.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: trendingProducts[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                              product: trendingProducts[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Electronics':
        return Icons.devices;
      case 'Fashion':
        return Icons.checkroom;
      case 'Home & Kitchen':
        return Icons.kitchen;
      case 'Beauty':
        return Icons.spa;
      case 'Sports':
        return Icons.sports_tennis;
      case 'Books':
        return Icons.book;
      case 'Toys':
        return Icons.toys;
      default:
        return Icons.category;
    }
  }
}
