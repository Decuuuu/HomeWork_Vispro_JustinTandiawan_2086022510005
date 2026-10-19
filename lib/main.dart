import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

class MenuItem {
  final String id;
  final String name;
  final int price;
  final String category;
  final String imageUrl;

  const MenuItem({
    required this.id, required this.name, required this.price, required this.category, this.imageUrl = '',
  });
}

final List<Map<String, dynamic>> realMenus = [
  {'name': 'Burger Wagyu Double Cheese', 'price': 45000, 'category': 'Fast Food'},
  {'name': 'Es Kopi Susu Gula Aren', 'price': 18000, 'category': 'Coffee'},
  {'name': 'Dimsum Ayam Mentai (Isi 4)', 'price': 22000, 'category': 'Chinese Food'},
  {'name': 'Tteokbokki Mozzarella Pedas', 'price': 35000, 'category': 'Korean Food'},
  {'name': 'Nasi Goreng Seafood Makassar', 'price': 30000, 'category': 'Indonesian Food'},
  {'name': 'Kentang Goreng Saus Keju', 'price': 15000, 'category': 'Fast Food'},
  {'name': 'Ice Americano Tanpa Gula', 'price': 15000, 'category': 'Coffee'},
  {'name': 'Kwetiau Siram Sapi', 'price': 32000, 'category': 'Chinese Food'},
  {'name': 'Bibimbap Daging Sapi', 'price': 40000, 'category': 'Korean Food'},
  {'name': 'Coto Makassar Kuah Kental + Ketupat', 'price': 35000, 'category': 'Indonesian Food'},
];

final List<MenuItem> menuData = List.generate(
  500,
      (i) {
    if (i == 0) {
      return MenuItem(
        id: 'm$i',
        name: 'Sate Ayam Madura Bumbu Kacang Kental Manis Gurih dengan Lontong Daun Pisang Asli, Irisan Bawang Merah Segar, Cabai Rawit Merah Ekstra Pedas, dan Taburan Bawang Goreng Melimpah Ruah Khas Nusantara',
        price: 25000, category: 'Indonesian Food',
      );
    }
    if (i <= realMenus.length) {
      final menu = realMenus[i - 1];
      return MenuItem(
        id: 'm$i', name: menu['name'] as String, price: menu['price'] as int, category: menu['category'] as String,
      );
    }
    return MenuItem(
      id: 'm$i', name: 'Rekomendasi Menu Z Kuy Nomor ${i + 1}',
      price: 15000 + ((i % 10) * 1000),
      category: ['Fast Food', 'Coffee', 'Chinese Food', 'Korean Food', 'Indonesian Food'][i % 5],
    );
  },
);

void main() {
  runApp(const MakanZKuyApp());
}


class MakanZKuyApp extends StatefulWidget {
  final ThemeMode? themeMode;
  final List<MenuItem>? items;

  const MakanZKuyApp({super.key, this.themeMode, this.items});

  @override
  State<MakanZKuyApp> createState() => _MakanZKuyAppState();
}

class _MakanZKuyAppState extends State<MakanZKuyApp> {

  ThemeMode _currentThemeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();

    if (widget.themeMode != null) {
      _currentThemeMode = widget.themeMode!;
    }
  }


  void toggleTheme(ThemeMode mode) {
    setState(() {
      _currentThemeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color brandColor = Color(0xFFA55A46);
    const Color bgColor = Color(0xFFF6F0E4);

    return MaterialApp(
      title: 'Makan Z Kuy!',
      debugShowCheckedModeBanner: false,

      themeMode: _currentThemeMode,

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: brandColor,
          primary: brandColor,
          surface: bgColor,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: brandColor,
          foregroundColor: Colors.white,
        ),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: brandColor,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          foregroundColor: Colors.white,
        ),
      ),


      home: MainScreen(
        items: widget.items ?? menuData,
        currentTheme: _currentThemeMode,
        onThemeChanged: toggleTheme,
      ),
    );
  }
}