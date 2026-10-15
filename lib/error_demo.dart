import 'package:flutter/material.dart';

void main() {
  runApp(const ErrorDemoApp());
}

class ErrorDemoApp extends StatelessWidget {
  const ErrorDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.orange),
      home: const MakanKuyErrorScreen(),
    );
  }
}

class MakanKuyErrorScreen extends StatelessWidget {
  const MakanKuyErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MakanKuy!', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.orange.withOpacity(0.1),
              child: const Row(
                children: [
                  Icon(Icons.storefront, size: 32, color: Colors.orange),
                  SizedBox(width: 12),

                  Text(
                    'MakanKuy! Cabang Perintis Kemerdekaan Buka 24 Jam Nonstop Melayani Pesanan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Ketuk di sini untuk memunculkan keyboard...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),

              child: Row(
                children: [
                  Chip(label: Text('Semua')),
                  SizedBox(width: 8),
                  Chip(label: Text('Promo Spesial')),
                  SizedBox(width: 8),
                  Chip(label: Text('Makanan Berat')),
                  SizedBox(width: 8),
                  Chip(label: Text('Minuman Dingin')),
                  SizedBox(width: 8),
                  Chip(label: Text('Cemilan')),
                ],
              ),
            ),

            const Spacer(),

            Container(
              height: 300,
              width: double.infinity,
              color: Colors.grey[200],
              child: const Center(child: Text('Area Daftar Menu MakanKuy!')),
            )
          ],
        ),
      ),
    );
  }
}