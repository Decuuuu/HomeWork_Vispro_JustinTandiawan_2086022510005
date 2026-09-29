import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.orange,
      width: double.infinity,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('MakanKuy!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
          Text('Mau pesan apa hari ini?', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}