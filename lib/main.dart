import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() => runApp(const MakanKuyApp());

class MakanKuyApp extends StatelessWidget {
  const MakanKuyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MakanKuy AFL 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}