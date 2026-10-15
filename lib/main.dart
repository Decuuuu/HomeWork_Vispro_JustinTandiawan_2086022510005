import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

class MenuItem {
  final String id;
  final String name;
  final int price;
  final String category;

  const MenuItem({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
  });
}

const List<MenuItem> defaultMenu = [
  MenuItem(id: '1', name: 'Ayam Geprek Sambal Matah', price: 20000, category: 'Makanan'),
  MenuItem(id: '2', name: 'Nasi Goreng Spesial', price: 18000, category: 'Makanan'),
  MenuItem(id: '3', name: 'Es Teh Manis', price: 5000, category: 'Minuman'),
  MenuItem(id: '4', name: 'Pisang Goreng Keju', price: 12000, category: 'Promo'),
];

void main() {
  runApp(const Lab04App());
}

class Lab04App extends StatelessWidget {
  final List<MenuItem>? items;
  final ThemeMode? themeMode;

  // Parameter ini menangkap settingan dari lab04_test
  const Lab04App({super.key, this.items, this.themeMode});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AFL 1 MakanKuy!',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode ?? ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange, brightness: Brightness.light),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange, brightness: Brightness.dark),
      ),
      home: MainScreen(items: items ?? defaultMenu),
    );
  }
}