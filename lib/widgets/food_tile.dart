import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
    required this.name,
    required this.price,
    required this.onAdd,
  });

  final String name;
  final int price;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Rp $price'),
        trailing: IconButton(
          icon: const Icon(Icons.add_circle, color: Colors.orange),
          onPressed: onAdd,
        ),
      ),
    );
  }
}