import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/category_chip.dart';
import '../widgets/food_tile.dart';
import '../widgets/cart_summary_bar.dart';
import 'detail_screen.dart';
import 'checkout_screen.dart';

class MainScreen extends StatefulWidget {
  final List<MenuItem> items;
  final ThemeMode currentTheme;
  final Function(ThemeMode) onThemeChanged;

  const MainScreen({
    super.key,
    required this.items,
    required this.currentTheme,
    required this.onThemeChanged,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _selectedCategory = 'Fast Food';
  String _searchQuery = '';
  int _totalItems = 0;
  int _totalPrice = 0;

  void _addToCart(int price) {
    setState(() { _totalItems++; _totalPrice += price; });
  }

  Widget _buildSideMenu(BuildContext context) {
    final theme = Theme.of(context);
    final sidebarColor = theme.brightness == Brightness.light ? theme.colorScheme.primary : theme.colorScheme.surfaceContainer;
    final textColor = theme.brightness == Brightness.light ? Colors.white : theme.colorScheme.onSurface;

    return Container(
      width: 250,
      color: sidebarColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: sidebarColor),
            child: Text('Makan Z Kuy!', style: TextStyle(color: textColor, fontSize: 28, fontWeight: FontWeight.bold)),
          ),
          ListTile(leading: Icon(Icons.home, color: textColor), title: Text('Home', style: TextStyle(color: textColor)), onTap: () {}),
          ListTile(leading: Icon(Icons.menu_book, color: textColor), title: Text('Menu', style: TextStyle(color: textColor)), onTap: () {}),
          ListTile(leading: Icon(Icons.location_on, color: textColor), title: Text('Location', style: TextStyle(color: textColor)), onTap: () {}),
          const Divider(color: Colors.white54),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
            child: Text('Categories', style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          ListTile(title: Text('Recommendation', style: TextStyle(color: textColor, fontSize: 14)), onTap: () {}),
          ListTile(title: Text('Top Menu Today', style: TextStyle(color: textColor, fontSize: 14)), onTap: () {}),
          ListTile(title: Text('Food News Today', style: TextStyle(color: textColor, fontSize: 14)), onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context, bool isTablet) {
    final filteredItems = widget.items.where((item) {
      final matchSearch = item.name.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchCategory = _selectedCategory == 'Semua' || item.category == _selectedCategory;
      return matchSearch && matchCategory;
    }).toList();

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              key: const Key('search-field'),
              decoration: InputDecoration(
                hintText: 'Search your Favorite food...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
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
              categories: const ['Semua', 'Fast Food', 'Coffee', 'Chinese Food', 'Korean Food', 'Indonesian Food'],
              selectedCategory: _selectedCategory,
              onSelected: (cat) => setState(() => _selectedCategory = cat),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Recommendation Popular Food\nToday',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
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
                  const Text('Menu tidak ditemukan', style: TextStyle(color: Colors.grey, fontSize: 18)),
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
                    (context, index) => MenuTile(item: filteredItems[index], onAdd: () => _addToCart(filteredItems[index].price)),
                childCount: filteredItems.length,
              ),
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => FoodTile(item: filteredItems[index], onAdd: () => _addToCart(filteredItems[index].price)),
                childCount: filteredItems.length,
              ),
            ),
          ),
        const SliverToBoxAdapter(child: SizedBox(height: 100)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth > 800;

          return Scaffold(
            appBar: isTablet ? null : AppBar(
              title: const Text('Makan Z Kuy!', style: TextStyle(fontWeight: FontWeight.bold)),
              actions: [
                IconButton(
                  icon: Icon(widget.currentTheme == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode),
                  onPressed: () {
                    if (widget.currentTheme == ThemeMode.dark) {
                      widget.onThemeChanged(ThemeMode.light);
                    } else {
                      widget.onThemeChanged(ThemeMode.dark);
                    }
                  },
                ),
              ],
            ),
            drawer: isTablet ? null : Drawer(child: _buildSideMenu(context)),

            body: SafeArea(
              child: isTablet
                  ? Row(
                children: [
                  _buildSideMenu(context),
                  Expanded(child: _buildMainContent(context, true)),
                ],
              )
                  : _buildMainContent(context, false),
            ),

            bottomNavigationBar: CartSummaryBar(
              totalItems: _totalItems,
              totalPrice: _totalPrice,
              onOrder: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckoutScreen(totalItems: _totalItems, totalPrice: _totalPrice)),
                );
                if (result == true) {
                  setState(() { _totalItems = 0; _totalPrice = 0; });
                }
              },
            ),
          );
        }
    );
  }
}