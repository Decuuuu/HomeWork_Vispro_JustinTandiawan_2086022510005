import 'package:flutter/material.dart';
import '../widgets/category_chip.dart';
import '../widgets/food_tile.dart';
import '../widgets/cart_summary_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _selectedCategory = 'Semua';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('MakanKuy!', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Mau pesan apa hari ini?',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryChip(
                    label: 'Semua',
                    isSelected: _selectedCategory == 'Semua',
                    onTap: () => setState(() => _selectedCategory = 'Semua'),
                  ),
                  CategoryChip(
                    label: 'Promo',
                    isSelected: _selectedCategory == 'Promo',
                    onTap: () => setState(() => _selectedCategory = 'Promo'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                FoodTile(name: 'Ayam Geprek Sambal Matah', price: 20000, onAdd: () => _addToCart(20000)),
                FoodTile(name: 'Nasi Goreng Spesial', price: 18000, onAdd: () => _addToCart(18000)),
                FoodTile(name: 'Es Teh Manis', price: 5000, onAdd: () => _addToCart(5000)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CartSummaryBar(totalItems: _totalItems, totalPrice: _totalPrice),
    );
  }
}