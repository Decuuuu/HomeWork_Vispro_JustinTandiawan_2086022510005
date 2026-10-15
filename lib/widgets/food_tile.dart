import 'package:flutter/material.dart';
import '../main.dart';

// Class ini bernama FoodTile (digunakan untuk HP)
class FoodTile extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onAdd;

  const FoodTile({super.key, required this.item, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        title: Text(
          item.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text('Rp ${item.price} • ${item.category}'),
        trailing: IconButton(
          icon: const Icon(Icons.add_circle, color: Colors.orange),
          onPressed: onAdd,
        ),
      ),
    );
  }
}

// Class ini bernama MenuTile (digunakan untuk Tablet)
class MenuTile extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onAdd;

  const MenuTile({super.key, required this.item, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text('Rp ${item.price}', style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FilledButton.tonal(
                onPressed: onAdd,
                child: const Text('Tambah'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}