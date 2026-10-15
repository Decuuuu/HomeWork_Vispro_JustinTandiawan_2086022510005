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

final List<MenuItem> menuData = List.generate(
  500, // Syarat H1: 500 items
      (i) => MenuItem(
    id: 'm$i',
    // Syarat H1: Teks lebih dari 200 karakter pada item pertama
    name: i == 0
        ? 'Ayam Geprek Spesial Ekstra Pedas Sambal Matah dengan Tambahan Nasi Uduk Hangat, Sate Usus Goreng Kering, Kerupuk Bawang Renyah, Sayur Lalapan Segar, Irisan Tomat, dan Taburan Bawang Goreng Melimpah Ruah Khas Nusantara'
        : 'Menu Z Kuy Lezat Nomor ${i + 1}',
    price: 15000 + (i * 500),
    category: ['Semua', 'Promo', 'Makanan', 'Minuman'][i % 4],
  ),
);

void main() {
  runApp(const Lab04App());
}

class Lab04App extends StatelessWidget {
  // ThemeMode ini bisa dikendalikan oleh file lab04_test
  final ThemeMode? themeMode;
  final List<MenuItem>? items;

  const Lab04App({super.key, this.themeMode, this.items});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Z Kuy!',
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
      home: MainScreen(items: items ?? menuData),
    );
  }
}