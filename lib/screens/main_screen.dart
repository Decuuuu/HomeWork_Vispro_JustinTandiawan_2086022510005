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
    // Filter data berdasarkan kategori dan pencarian
    final filteredItems = widget.items.where((item) {
      final matchesSearch = item.name.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCat = _selectedCategory == 'Semua' || item.category == _selectedCategory;
      return matchesSearch && matchesCat;
    }).toList();

    // Dapatkan semua nama kategori unik dari data yang masuk
    final List<String> categories = ['Semua'];
    for (var item in widget.items) {
      if (!categories.contains(item.category)) categories.add(item.category);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('MakanKuy!', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      // SafeArea + LayoutBuilder + CustomScrollView adalah KUNCI lulus semua test
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth > 600;

            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: AppHeader(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: TextField(
                      key: const Key('search-field'), // Kunci Test No. 8
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
                      categories: categories,
                      selectedCategory: _selectedCategory,
                      onSelected: (cat) => setState(() => _selectedCategory = cat),
                    ),
                  ),
                ),

                // Test 6: Zero items shows an empty state
                if (filteredItems.isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      key: const Key('empty-state'), // Kunci Test No. 6
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.fastfood, size: 64, color: Colors.grey[400]),
                          const SizedBox(height: 16),
                          const Text('Menu tidak ditemukan', style: TextStyle(color: Colors.grey, fontSize: 18)),
                        ],
                      ),
                    ),
                  )
                else if (isTablet)
                // Test 3: Tablet (800dp) The layout changes, it does not stretch
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    sliver: SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 0.7,
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
                // Test 7: 500 items built lazily (SliverList pengganti ListView statis)
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