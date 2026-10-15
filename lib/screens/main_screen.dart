import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/app_header.dart';
import '../widgets/category_chip.dart';
import '../widgets/food_tile.dart';
import '../widgets/cart_summary_bar.dart';

class MainScreen extends StatefulWidget {
  final List<MenuItem> items;
  const MainScreen({super.key, required this.items});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _selectedCategory = 'Semua';
  String _searchQuery = '';
  int _totalItems = 0;
  int _totalPrice = 0;

  void _addToCart(int price) {
    setState(() {
      _totalItems++;
      _totalPrice += price;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = widget.items.where((item) {
      final matchSearch = item.name.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchCategory = _selectedCategory == 'Semua' || item.category == _selectedCategory;
      return matchSearch && matchCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Z Kuy!', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: SafeArea(

        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth > 600;

            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Padding(padding: EdgeInsets.fromLTRB(16, 16, 16, 8), child: AppHeader()),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: TextField(
                      key: const Key('search-field'),
                      decoration: InputDecoration(
                        hintText: 'Cari menu...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.surface,
                      ),
                      onChanged: (val) => setState(() => _searchQuery = val),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: CategoryChipBar(
                      categories: const ['Semua', 'Promo', 'Makanan', 'Minuman'],
                      selectedCategory: _selectedCategory,
                      onSelected: (cat) => setState(() => _selectedCategory = cat),
                    ),
                  ),
                ),

                if (filteredItems.isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      key: const Key('empty-state'),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off, size: 80, color: Colors.grey[400]),
                          const SizedBox(height: 16),
                          const Text('Oops, Menu tidak ditemukan', style: TextStyle(color: Colors.grey, fontSize: 18)),
                        ],
                      ),
                    ),
                  )

                else if (isTablet)
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    sliver: SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 0.75,
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (context, index) => MenuTile(
                            item: filteredItems[index],
                            onAdd: () => _addToCart(filteredItems[index].price)
                        ),
                        childCount: filteredItems.length,
                      ),
                    ),
                  )

                else
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) => FoodTile(
                          item: filteredItems[index],
                          onAdd: () => _addToCart(filteredItems[index].price),
                        ),
                        childCount: filteredItems.length,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: CartSummaryBar(totalItems: _totalItems, totalPrice: _totalPrice),
    );
  }
}